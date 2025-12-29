import 'package:flutter/material.dart';

import 'home_mahasiswa.dart';
import 'alarm_page.dart';
import 'attendance_page.dart';
import 'score_mahasiswa.dart';
import '../widgets/bottom_mahasiswa_nav.dart';

class MahasiswaMainPage extends StatefulWidget {
  const MahasiswaMainPage({super.key});

  @override
  State<MahasiswaMainPage> createState() => _MahasiswaMainPageState();
}

class _MahasiswaMainPageState extends State<MahasiswaMainPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeMahasiswaPage(),
    AlarmPage(),
    AttendancePage(),
    ScoreMahasiswaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: MahasiswaBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}
