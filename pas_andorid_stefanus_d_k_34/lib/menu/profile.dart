import 'package:flutter/material.dart';
import '../components/custom_textfield_judul.dart';
import '../components/custum_textfield_teks.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xFFEE4D2D),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const CustomTextfieldJudul(
              text: 'Stefanus Delfin Krisianto',
              fontSize: 20,
            ),
            const SizedBox(height: 4),
            const CustomTextfieldTeks(
              text: 'Siswa SMK - PPLG',
              color: Colors.black54,
            ),
            const SizedBox(height: 20),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: Color(0xFFEE4D2D)),
                    title: CustomTextfieldTeks(
                      text: 'Nama Lengkap',
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                    subtitle: CustomTextfieldTeks(
                      text: 'Stefanus Delfin Krisianto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.school, color: Color(0xFFEE4D2D)),
                    title: CustomTextfieldTeks(
                      text: 'Kelas',
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                    subtitle: CustomTextfieldTeks(
                      text: '11 PPLG 1',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.badge, color: Color(0xFFEE4D2D)),
                    title: CustomTextfieldTeks(
                      text: 'No. Absen',
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                    subtitle: CustomTextfieldTeks(
                      text: '34',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.info_outline, color: Color(0xFFEE4D2D)),
                title: CustomTextfieldTeks(
                  text: 'Bio',
                  fontSize: 12,
                  color: Colors.black54,
                ),
                subtitle: CustomTextfieldTeks(
                  text:
                      'Siswa jurusan PPLG (perangkat lunak dan Gim).',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}