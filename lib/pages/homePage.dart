import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/database/data.dart';
import 'package:to_do_app/utils/add_task_box.dart';
import 'package:to_do_app/utils/list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  ToDoDataBase db = ToDoDataBase();
  final _myBox = Hive.box('myBox');

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void saveTheTask() {
    setState(() {
      db.toDoTaskList.add([textEditingController.text, false]);
      textEditingController.clear();
      Navigator.pop(context);
    });
    db.updatateData();
  }

  void creatTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            onSave: saveTheTask,
            onCancel: () => Navigator.of(context).pop(),
            controller: textEditingController,
          );
        });
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoTaskList[index][1] = !db.toDoTaskList[index][1];
    });
    db.updatateData();
  }

  void deleteTask(index) {
    setState(() {
      db.toDoTaskList.removeAt(index);
    });
    db.updatateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        // backgroundColor: Colors.yellow
        elevation: 0,
        title: const Text(
          'To Do ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //  backgroundColor: Colors.yellow,
        onPressed: creatTask,
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: db.toDoTaskList.length,
          itemBuilder: (context, index) {
            return Customtile(
              taskName: db.toDoTaskList[index][0],
              isTaskComplete: db.toDoTaskList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              deleteTask: () => deleteTask(index),
            );
          }),
    );
  }
}
