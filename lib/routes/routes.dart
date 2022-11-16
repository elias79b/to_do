import 'package:get/get.dart';
import 'package:to_do/pages/add_task_screen.dart';
import 'package:to_do/pages/home_screen.dart';


class Routes{
  static List<GetPage> get pages=> [
    GetPage(name: '/homescreen', page: ()=> HomeScreen()),
    GetPage(name: '/addscreen', page: ()=> AddTaskScreen()),
  ];
}