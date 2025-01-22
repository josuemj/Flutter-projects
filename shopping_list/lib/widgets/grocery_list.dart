import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/model/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _loadedItems; // no initial value (late)
  String? _error;
  String apiUrl = dotenv.get('FIREBASE_URL');
  String apiPath = dotenv.get('DB_PATH');
  @override
  void initState() {
    _loadedItems = _loadItems(); //late

    super.initState();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(apiUrl, apiPath); //path into firebase

    final response = await http.get(url); //getting items
    print(response.statusCode); //if > 400, all error code
    if (response.statusCode >= 400) {
      throw Exception(
          'Failde to fetch grocerie'); // rejected future will be true on future builder
    }

    print(response.body);

    if (response.body == 'null') {
      //firebase return 'null' string

      return [];
    }

    final Map<String, dynamic> listData =
        json.decode(response.body); //converitng repsonse to JSON
    final List<GroceryItem> _loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      _loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }
    return _loadedItems;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );

    // setState(() {
    //   _groceryItems.add(newItem);
    // });
    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.removeAt(index);
    });
    final url =
        Uri.https(apiUrl, 'shopping-list/${item.id}.json'); //path into firebase
    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
            )
          ],
          title: const Text(
            'Your groceries',
          ),
        ),
        body: FutureBuilder(
            future: _loadedItems,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              if (snapshot.data!.isEmpty) {
                return const Center(child: Text('Start by adding some items'));
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Dismissible(
                  onDismissed: (direction) => {
                    _removeItem(
                      snapshot.data![index],
                    )
                  },
                  key: ValueKey(snapshot.data![index].id),
                  child: ListTile(
                    title: Text(snapshot.data![index].name),
                    leading: Container(
                      width: 24,
                      height: 24,
                      color: snapshot.data![index].category.color,
                    ),
                    trailing: Text(
                      snapshot.data![index].quantity.toString(),
                    ),
                  ),
                ),
              );
            }));
  }
}
