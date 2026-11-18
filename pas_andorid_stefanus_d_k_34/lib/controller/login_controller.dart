import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_project1/models/login_model.dart';
import 'package:flutter_project1/routers.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {

  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  void login() async {
    if (txtUsername.text.toString().isEmpty || txtPassword.text.toString().isEmpty) {
      Get.snackbar('Error', 'Username dan Password tidak boleh kosong');
      return;
    }

    try {
      isLoading.value = true;
      final url = Uri.parse("https://mediadwi.com/api/latihan/login"); 

      final respon = await http.post(
        url,
        body: {
          "username": txtUsername.text.toString(),
          "password": txtPassword.text.toString(),
        },
      );

      isLoading.value = false;

      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        loginModel.value = LoginModel.fromJson(data);

        if (loginModel.value?.status == true) {
          Get.snackbar("Berhasil", loginModel.value!.message.toString());
          Get.offNamed(Routers.mainMenuPage);
        } else {
          Get.snackbar("Gagal", loginModel.value?.message ?? "Login Gagal");
        }
      } else {
        Get.snackbar("Gagal", "Cek koneksi internet Anda");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}