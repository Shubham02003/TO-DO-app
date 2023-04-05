import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  DialogBox(
      {Key? key,
      required this.onCancel,
      required this.onSave,
      required this.controller})
      : super(key: key);

  @override
  VoidCallback? onSave;
  VoidCallback? onCancel;
  final controller;
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                    hintText: 'Add Task', border: OutlineInputBorder()),
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: onSave,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    'ADD',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                  onPressed: onCancel,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
