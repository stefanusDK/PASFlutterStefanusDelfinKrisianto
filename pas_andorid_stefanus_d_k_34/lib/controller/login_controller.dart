import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../Routers.dart';

class LoginController extends GetxController {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  void login() async {
    if (txtUsername.text.trim().isEmpty || txtPassword.text.isEmpty) {
      Get.snackbar('Error', 'Username dan Password tidak boleh kosong');
      return;
    }

    try {
      isLoading.value = true;
      final url = Uri.parse('https://mediadwi.com/api/latihan/login');

      final respon = await http.post(
        url,
        body: {
          'username': txtUsername.text.toString(),
          'password': txtPassword.text.toString(),
        },
      );

      isLoading.value = false;

      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        loginModel.value = LoginModel.fromJson(data);

        if (loginModel.value?.status == true) {
          Get.snackbar('Berhasil', loginModel.value!.message.toString());
          Get.offNamed(Routers.mainMenu);
        } else {
          Get.snackbar("Gagal", loginModel.value?.message ?? "Login Gagal");
        }
      } else {
        Get.snackbar('Gagal', 'Cek koneksi internet Anda');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Tidak dapat terhubung ke server');
    }
  }

}
