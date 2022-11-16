import 'package:flutter/material.dart';
import 'package:to_do/constant.dart';
import 'package:get/get.dart';
import 'package:to_do/controllers/task_controller.dart';
import 'package:to_do/controllers/textfilde_controller.dart';
import 'package:to_do/pages/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [TopSectionWidget(), BottomSectionWidget()],
        ),
      ),
    );
  }
}

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: kLightBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, top: 20),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Icon(Icons.bookmarks, color: kLightBlueColor),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 40, top: 20),
              child: Text(
                "All",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
          Container(
            margin: EdgeInsets.only(left: 40, top: 10),
            child: Obx(()  {
              return Text("${Get.find<TaskController>().tasks.length} Tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ));
            })
          ),
        ],
      ),
    );
  }
}

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.6,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Obx((){
          return ListView.separated(itemBuilder: (context, index) {
            var task = Get.find<TaskController>().tasks[index];
            return ListTile(
              onLongPress: (){
                Get.defaultDialog(
                  title: "Are you sure to delete this item?",
                  titleStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.white,
                  middleText: '',
                  radius: 15,
                  textCancel: "No",
                  cancelTextColor: kLightBlueColor,
                  textConfirm: "Yes",
                  confirmTextColor: Colors.white,
                  buttonColor: kLightBlueColor,
                  barrierDismissible: false,
                  onConfirm: (){
                    Get.find<TaskController>().tasks.removeAt(index);
                    Get.back();
                  }
                );

              },
              title: Text(Get.find<TaskController>().tasks[index].taskTitle! ?? ''),
              subtitle: Text(Get.find<TaskController>().tasks[index].taskSubtitle! ?? ''),
              onTap: (){
                Get.find<TaskController>().isEditing.value = true ;
                Get.find<TaskController>().index = index ;
                Get.find<TextfieldController>().taskTitle!.text =
                Get.find<TaskController>().tasks[index].taskTitle!;
                /////////////////////////////////////////////////////
                Get.find<TextfieldController>().taskSubtitle!.text =
                Get.find<TaskController>().tasks[index].taskSubtitle!;
                Get.toNamed('/addscreen');
              },
              trailing: Checkbox(
                activeColor: kLightBlueColor,
                onChanged: (value){
                  task.status = !task.status!;
                  Get.find<TaskController>().tasks[index] = task;
                },
                value: Get.find<TaskController>().tasks[index].status,
                side: BorderSide(color: Colors.black,width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            );
          },
              separatorBuilder: (context, index) {
                return Divider(color: Colors.black, height: 1,);
              },
              itemCount: Get.find<TaskController>().tasks.length);
        })
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      heroTag: 'hero',
      onPressed: () {
        Get.find<TaskController>().isEditing.value = false;
        Get.find<TextfieldController>().taskTitle!.text = '';
        Get.find<TextfieldController>().taskSubtitle!.text  = '';
        Get.to(AddTaskScreen());

      },
      elevation: 0,
      child: Icon(Icons.add),
      backgroundColor: kLightBlueColor,
    );
  }
}
