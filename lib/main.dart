import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/bindings/bindings.dart';
import 'package:to_do/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratAlternatesTextTheme()),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: Routes.pages,
      initialBinding: MyBindings(),
      initialRoute: '/homescreen',
    );
  }

}
