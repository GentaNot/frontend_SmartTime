import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('App Card'),
        subtitle: const Text('Placeholder content'),
      ),
    );
  }
}
