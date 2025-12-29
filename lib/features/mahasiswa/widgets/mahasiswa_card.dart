import 'package:flutter/material.dart';

class MahasiswaCard extends StatelessWidget {
  const MahasiswaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Mahasiswa Card'),
        subtitle: const Text('Placeholder content'),
      ),
    );
  }
}
