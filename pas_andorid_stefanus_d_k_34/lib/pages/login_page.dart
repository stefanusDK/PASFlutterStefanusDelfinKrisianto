import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custum_button.dart';
import '../components/custum_textfield.dart';
import '../components/custom_textfield_judul.dart';
import '../components/custum_textfield_teks.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());

  static const Color warnaUtama = Color(0xFFEE4D2D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.restaurant_menu, size: 72, color: warnaUtama),
              const SizedBox(height: 12),
              const CustomTextfieldJudul(
                text: 'Kuliner & Liga Inggris',
                color: warnaUtama,
                fontSize: 26,
              ),
              const SizedBox(height: 4),
              const CustomTextfieldTeks(
                text: 'Silakan login untuk melanjutkan',
                color: Colors.black54,
              ),
              const SizedBox(height: 32),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextField(
                  txtcontroller: controller.txtUsername,
                  hintText: 'Username',
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextField(
                  txtcontroller: controller.txtPassword,
                  hintText: 'Password',
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 8),
              Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: CustomButton(
                          text: 'Login',
                          onPressed: controller.login,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
