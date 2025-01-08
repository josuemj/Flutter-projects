import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/model/categories.dart';
import 'package:shopping_list/model/grocery_item.dart';

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

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // onSave funcs
      Navigator.of(context).pop(GroceryItem(
        id: DateTime.now().toString(),
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _selectedCategory,
      ));
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
