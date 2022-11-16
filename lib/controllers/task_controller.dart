import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/models/task_model.dart';

class TaskController extends GetxController {
  RxBool isEditing = false.obs;
  int index = 0;
  RxList<TaskModel> tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    var box = GetStorage();
    if (box.read('task') != null) {
      var list = box.read('task');
      for (var item in list) {
        tasks.add(TaskModel.fromJson(item));
      }
    }

    ever(tasks, (value){
      box.write('task', tasks.toJson());
    });


    super.onInit();
  }
}
