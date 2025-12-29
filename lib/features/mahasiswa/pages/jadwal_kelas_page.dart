import 'package:flutter/material.dart';

class JadwalKelasPage extends StatelessWidget {
  const JadwalKelasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F80ED),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Jadwal Kelas"),
            Text(
              "Minggu ini • Semester 5",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _daySection(
            "Senin • Hari Ini",
            [
              _scheduleItem(
                "Pemrograman Web",
                "08:00",
                "Lab 301",
                const Color(0xFF2F80ED),
              ),
              _scheduleItem(
                "Algoritma",
                "13:00",
                "Kelas A201",
                Colors.orange,
              ),
            ],
          ),
          _daySection(
            "Selasa",
            [
              _scheduleItem(
                "Basis Data",
                "10:00",
                "Lab 302",
                Colors.green,
              ),
            ],
          ),
          _daySection(
            "Rabu",
            [
              _scheduleItem(
                "Jaringan Komputer",
                "08:00",
                "Lab 303",
                Colors.purple,
              ),
              _scheduleItem(
                "UI/UX Design",
                "13:00",
                "Studio 101",
                Colors.pink,
              ),
            ],
          ),
          _daySection(
            "Kamis",
            [
              _scheduleItem(
                "Mobile Development",
                "13:00",
                "Lab 301",
                Colors.teal,
              ),
            ],
          ),
          _daySection(
            "Jumat",
            [
              _scheduleItem(
                "Pemrograman Web",
                "10:00",
                "Lab 301",
                const Color(0xFF2F80ED),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= DAY SECTION =================
  Widget _daySection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        ...items,
      ],
    );
  }

  /// ================= SCHEDULE ITEM =================
  Widget _scheduleItem(
    String subject,
    String time,
    String location,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "📍 $location",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
