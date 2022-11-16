import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/controllers/task_controller.dart';
import 'package:to_do/controllers/textfilde_controller.dart';
import 'package:to_do/models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MycustomAppbar(),
          TitleWidget(),
          TaskTextfield(),
          NoteWidget(),
          MyButton(),
        ],
      )),
    );
  }
}

class MycustomAppbar extends StatelessWidget {
  const MycustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: 45),
          child: Text(
            Get.find<TaskController>().isEditing.value
                ? 'Edit Task'
                : 'New Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        )),
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close))
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, top: 10),
        child: Text("What are you planning?"));
  }
}

class TaskTextfield extends StatelessWidget {
  const TaskTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: Get.find<TextfieldController>().taskTitle,
        maxLines: 6,
        cursorColor: kLightBlueColor,
        cursorHeight: 40,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextField(
        controller: Get.find<TextfieldController>().taskSubtitle,
        maxLength: 30,
        cursorColor: kLightBlueColor,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.bookmark_border,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            counter: Container(),
            hintText: "Add note"),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: Get.width,
      height: 40,
      child: ElevatedButton(
          style: TextButton.styleFrom(
              elevation: 0, backgroundColor: kLightBlueColor),
          onPressed: () {
            if(Get.find<TaskController>().isEditing.value){
              var task = Get.find<TaskController>().tasks[Get.find<TaskController>().index];
              task.taskTitle = Get.find<TextfieldController>().taskTitle!.text;
              task.taskSubtitle = Get.find<TextfieldController>().taskSubtitle!.text;
              Get.find<TaskController>().tasks[Get.find<TaskController>().index] = task;
            }else{
              Get.find<TaskController>().tasks.add(
                TaskModel(
                    taskTitle:
                    Get.find<TextfieldController>().taskTitle!.text,
                    taskSubtitle:
                    Get.find<TextfieldController>().taskSubtitle!.text,
                    status: false),
              );
            }
            Get.back();
          },
          child: Text( Get.find<TaskController>().isEditing.value
              ? 'Edit'
              : 'Add')),
    );
  }
}
