import 'package:flutter/material.dart';

class ScoreDosenPage extends StatefulWidget {
  const ScoreDosenPage({super.key});

  @override
  State<ScoreDosenPage> createState() => _ScoreDosenPageState();
}

class _ScoreDosenPageState extends State<ScoreDosenPage> {
  List<Map<String, dynamic>> scores = [
    {
      "id": 1,
      "matkul": "Pemrograman Web",
      "nama": "Ahmad Rizki",
      "nim": "2021001",
      "nilai": "A",
    },
    {
      "id": 2,
      "matkul": "Basis Data",
      "nama": "Sarah Wijaya",
      "nim": "2021002",
      "nilai": "B",
    },
    {
      "id": 3,
      "matkul": "Algoritma",
      "nama": "Budi Santoso",
      "nim": "2021003",
      "nilai": "C",
    },
  ];

  Color gradeColor(String grade) {
    switch (grade) {
      case "A":
        return Colors.green;
      case "B":
        return Colors.blue;
      case "C":
        return Colors.orange;
      case "D":
      case "E":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text("Nilai Mahasiswa"),
        backgroundColor: const Color(0xFF5B5FEF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF5B5FEF),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: scores.length,
        itemBuilder: (context, index) {
          final s = scores[index];
          return _scoreCard(s);
        },
      ),
    );
  }

  Widget _scoreCard(Map<String, dynamic> s) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: gradeColor(s["nilai"]).withOpacity(0.15),
                ),
                child: Icon(
                  Icons.school,
                  color: gradeColor(s["nilai"]),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s["nama"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${s["matkul"]} • NIM ${s["nim"]}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              _actionButton(Icons.edit, Colors.blue),
              const SizedBox(width: 6),
              _actionButton(Icons.delete, Colors.red),
            ],
          ),

          const SizedBox(height: 14),

          /// Nilai
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: gradeColor(s["nilai"]).withOpacity(0.1),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.grade,
                  color: gradeColor(s["nilai"]),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Nilai:",
                  style: TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                Text(
                  s["nilai"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: gradeColor(s["nilai"]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, Color color) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, size: 18),
        color: color,
        onPressed: () {},
      ),
    );
  }
}
