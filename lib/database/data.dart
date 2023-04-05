import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List toDoTaskList = [];
  final _myBox= Hive.box('myBox');

  void createInitialData(){
    toDoTaskList=[
      ['Do HomeWork',false],["Do WorkOut",false]
    ];
  }

  void loadData(){
    toDoTaskList=_myBox.get('TODOLIST');
  }
  void updatateData(){
    _myBox.put('TODOLIST',toDoTaskList);
  }
}