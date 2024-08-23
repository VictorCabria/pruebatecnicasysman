import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'presentation/controllers/theme_controller.dart';
import 'presentation/pages/item_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController =
      Get.put(ThemeController()); // Inicializa el ThemeController

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Flutter Firebase DDD',
        theme: ThemeData.light(), // Tema claro por defecto
        darkTheme: ThemeData.dark(), // Tema oscuro
        themeMode: themeController.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode
                .light, // Cambia el tema basado en el estado del ThemeController
        home: ItemListPage(),
      );
    });
  }
}
