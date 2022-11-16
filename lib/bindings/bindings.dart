import 'package:get/get.dart';
import 'package:to_do/controllers/task_controller.dart';
import 'package:to_do/controllers/textfilde_controller.dart';


class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
    Get.put(TextfieldController());
  }

}