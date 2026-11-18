import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_textfield_judul.dart';
import '../controller/main_menu_controller.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final controller = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final index = controller.selectedIndex.value;

      return Scaffold(
        appBar: AppBar(
          title: const CustomTextfieldJudul(
            text: 'Kuliner & Liga Inggris',
            fontSize: 20,
          ),
          automaticallyImplyLeading: false,
        ),
        body: IndexedStack(
          index: index,
          children: controller.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: const Color(0xFFEE4D2D),
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer), label: 'Feat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      );
    });
  }
}
