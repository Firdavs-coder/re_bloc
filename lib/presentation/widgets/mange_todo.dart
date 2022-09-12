import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_bloc/logic/todo/todo_cubit.dart';

class ManageTodo extends StatelessWidget {
  ManageTodo({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<TodoCubit>(context).addTodo(_title);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please, enter title";
                }
                return null;
              },
              onSaved: (value) {
                _title = value!;
              },
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () => _submit(context),
                  child: const Text("Add"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
