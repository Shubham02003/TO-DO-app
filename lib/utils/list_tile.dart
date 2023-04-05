import 'package:flutter/material.dart';

class Customtile extends StatelessWidget {
  String? taskName;
  bool? isTaskComplete;
  Function(bool?)? onChanged;
  VoidCallback deleteTask;
  Customtile({Key? key, this.taskName, this.isTaskComplete, this.onChanged,required this.deleteTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 13),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.black,
            value: isTaskComplete,
            onChanged: onChanged,
           activeColor: Colors.greenAccent,

          ),
          Text(
            taskName!,
            style: isTaskComplete!
                ? TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey)
                : TextStyle(decoration: TextDecoration.none,color: Colors.white),
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: deleteTask,
            child: Icon(Icons.delete,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
