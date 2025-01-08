import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';

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

  void _saveItem() {
    _formKey.currentState!
        .validate(); // not null (!) // validate calls validate methods on each field
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
                      initialValue: '1',
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
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(items: [
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
                    ], onChanged: (value) {}),
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
