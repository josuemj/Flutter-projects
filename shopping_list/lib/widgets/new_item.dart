import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/model/categories.dart';
import 'package:shopping_list/model/grocery_item.dart';
import 'package:http/http.dart' as htpp;

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

//form to display
class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories
      .vegetables]!; // initial not null value for categories drop down :)

  void _saveItem() async {
    String apiUrl = dotenv.get('FIREBASE_URL');
    String apiPath = dotenv.get('DB_PATH');

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // onSave funcs

      final url = Uri.https(apiUrl, apiPath); //path into firebase
      final response = await htpp.post(
        url,
        headers: {
          'Content-Type': 'application/json', //json aplication
        },
        body: json.encode(
          {
            // body request (data)
            'name': _enteredName,
            'quantity': _enteredQuantity,
            'category': _selectedCategory.title,
          },
        ),
      );

      print(response.body);
      print(response.statusCode);

      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop();
      // Navigator.of(context).pop(GroceryItem(
      //   id: DateTime.now().toString(),
      //   name: _enteredName,
      //   quantity: _enteredQuantity,
      //   category: _selectedCategory,
      // ));
    } // not null (!) // validate calls validate methods on each field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey, // GlobalKey() obj,
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) => _enteredName = value!,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters'; // error message
                  }
                  return null; // valid
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType:
                          TextInputType.number, //number keyboard optmized
                      decoration: InputDecoration(
                        label: Text('quantity'),
                      ),
                      initialValue: _enteredQuantity.toString(),
                      //initial value
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) ==
                                null || //convert str to num return null if not int
                            int.tryParse(value)! <= 0) {
                          return 'Must be a valid positive number'; // error message
                        }
                        return null; // valid
                      },
                      onSaved: (value) => _enteredQuantity = int.parse(value!),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                        value: _selectedCategory,
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                                value: category.value,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      color: category.value.color,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(category.value.title)
                                  ],
                                ))
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value!;
                          });
                        }),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: const Text('R eset')),
                  ElevatedButton(onPressed: _saveItem, child: Text('Add item'))
                ],
              ) //instead of TextField()
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
    );
  }
}

/*
E/flutter ( 4826): [ERROR:flutter/runtime/dart_vm_initializer.cc(40)] Unhandled Exception:
 ClientException: Connection reset by peer, 
 uri=http://flutter-prep-e8ab4-default-rtdb.firebaseio.com/shopping-list.json
E/flutter ( 4826): #0      IOClient.send (package:http/src/io_client.dart:156:7)
E/flutter ( 4826): <asynchronous suspension>
E/flutter ( 4826): #1      BaseClient._sendUnstreamed (package:http/src/base_client.dart:93:32)
E/flutter ( 4826): <asynchronous suspension>
E/flutter ( 4826): #2      _withClient (package:http/http.dart:167:12)
E/flutter ( 4826): <asynchronous suspension>
E/flutter ( 4826): 
*/
