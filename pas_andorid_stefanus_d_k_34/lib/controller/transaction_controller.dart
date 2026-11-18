import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/food_model.dart';

class TransactionController extends GetxController {
  late FoodModel food;
  final TextEditingController txtJumlah = TextEditingController(text: '1');

  @override
  void onInit() {
    super.onInit();
    food = Get.arguments;
  }

  void bayar() {
    int jumlah = 1;

    if (jumlah <= 1) {
      Get.snackbar('Error', 'Jumlah harus lebih dari 0');
      return;
    }

    int subtotal = food.price * jumlah;
    int ppn = (subtotal * 0.05).round();
    int total = subtotal + ppn;

    Get.defaultDialog(
      title: 'Rincian Pembayaran',
      middleText: 'Subtotal : Rp $subtotal\n'
          'PPN (5%) : Rp $ppn\n'
          'Total Bayar : Rp $total',
      textConfirm: 'Tutup',
      onConfirm: () => Get.back(),
    );
  }
}