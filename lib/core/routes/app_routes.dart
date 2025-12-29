import 'package:flutter/material.dart';
import 'package:flutter_application_4/features/mahasiswa/pages/point_mahasiswa.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/mahasiswa/pages/mahasiswa_main_page.dart';
import '../../features/dosen/pages/dosen_main_page.dart';
import '../../features/mahasiswa/pages/jadwal_kelas_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String mahasiswaMain = '/mahasiswa';
  static const String dosenMain = '/dosen';
  static const String jadwalKelas = '/jadwal-kelas';
  static const String pointMahasiswa = '/point-mahasiswa';
  


  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginPage(),
      mahasiswaMain: (context) => const MahasiswaMainPage(),
      jadwalKelas: (context) => const JadwalKelasPage(),
      AppRoutes.pointMahasiswa: (context) => const PointMahasiswaPage(),
      dosenMain: (context) => const DosenMainPage(),
    };
  }
}
