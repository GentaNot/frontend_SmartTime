import 'package:flutter/material.dart';

import '../pages/home_dosen.dart';
import '../pages/verify_dosen.dart';
import '../pages/score_dosen.dart';
import '../pages/profil_dosen.dart';

import '../widgets/bottom_nav.dart';

class DosenMainPage extends StatefulWidget {
  const DosenMainPage({super.key});

  @override
  State<DosenMainPage> createState() => _DosenMainPageState();
}

class _DosenMainPageState extends State<DosenMainPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeDosenPage(),
    VerifyDosenPage(),
    ScoreDosenPage(),
    ProfilDosenPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: DosenBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}
