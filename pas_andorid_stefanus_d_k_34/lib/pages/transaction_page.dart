import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../components/custum_button.dart';
import '../components/custum_textfield.dart';
import '../components/custom_textfield_judul.dart';
import '../components/custum_textfield_teks.dart';
import '../controller/transaction_controller.dart';
import '../models/food_model.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransactionController());
    final food = controller.food;

    return Scaffold(
      appBar: AppBar(
        title: const CustomTextfieldJudul(
          text: 'Transaksi Pembelian',
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                food.image,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 220,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.fastfood, size: 64),
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextfieldJudul(text: food.name),
            const SizedBox(height: 4),
            CustomTextfieldTeks(
              text: 'Rp ${food.price}',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            const SizedBox(height: 8),
            CustomTextfieldTeks(text: food.description, fontSize: 15),
            const SizedBox(height: 24),
            CustomTextField(
              txtcontroller: controller.txtJumlah,
              hintText: 'Jumlah yang dibeli',
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: CustomButton(text: 'Bayar', onPressed: controller.bayar),
            ),
          ],
        ),
      ),
    );
  }
}
