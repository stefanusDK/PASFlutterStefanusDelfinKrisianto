import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custum_button.dart';
import '../components/custum_textfield_teks.dart';
import '../controller/feat_controller.dart';

class FeatPage extends StatelessWidget {
  FeatPage({super.key});
  final controller = Get.put(FeatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextfieldTeks(text: controller.errorMessage.value),
                  const SizedBox(height: 12),
                  CustomButton(
                    text: 'Coba Lagi',
                    onPressed: controller.getTeams,
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.listTeam.length,
          itemBuilder: (context, index) {
            final team = controller.listTeam[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.network(
                  team.strBadge,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.shield, size: 40),
                ),
                title: CustomTextfieldTeks(
                  text: team.strTeam,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: Row(
                  children: [
                    const Icon(Icons.stadium, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: CustomTextfieldTeks(
                        text: team.strStadium,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
