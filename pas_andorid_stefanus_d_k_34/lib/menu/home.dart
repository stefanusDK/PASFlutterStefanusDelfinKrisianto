import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custum_textfield_teks.dart';
import '../models/food_model.dart';
import '../Routers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dummyFoods.length,
        itemBuilder: (context, index) {
          final food = dummyFoods[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  food.image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 70,
                    height: 70,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.fastfood),
                  ),
                ),
              ),
              title: CustomTextfieldTeks(
                text: food.name,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              subtitle: CustomTextfieldTeks(
                text: 'Rp ${food.price}',
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Get.toNamed(Routers.transaction, arguments: food);
              },
            ),
          );
        },
      ),
    );
  }
}
