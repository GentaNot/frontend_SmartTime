import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/routes/app_routes.dart';

class HomeMahasiswaPage extends StatelessWidget {
  const HomeMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
          /// 👉 TOMBOL POIN MAHASISWA
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.pointMahasiswa);
      },
      backgroundColor: const Color(0xFF2F7CF6),
      icon: const Icon(Icons.stars, color: Colors.white),
      label: const Text(
        'Poin Saya',
        style: TextStyle(color: Colors.white),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildDisciplineScore(),
              const SizedBox(height: 12),
              _buildAttendanceStatus(),
              const SizedBox(height: 12),
              _buildTodaySchedule(context),
              const SizedBox(height: 16),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= HEADER =================
Widget _buildHeader() {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Color(0xFF2F7CF6),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Expanded(
              child: Text(
                'Selamat Pagi,\nSarah Wijaya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(Icons.notifications, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _SleepInfo(title: 'Jadwal Tidur', time: '22:00'),
              _SleepInfo(title: 'Bangun Besok', time: '06:00'),
            ],
          ),
        ),
      ],
    ),
  );
}

/// ================= DISCIPLINE SCORE =================
Widget _buildDisciplineScore() {
  return _card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.insights, color: Colors.green),
            SizedBox(width: 8),
            Text(
              'Discipline Score',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Chip(
              label: Text('Excellent'),
              backgroundColor: Color(0xFFE8F5E9),
              labelStyle: TextStyle(color: Colors.green),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          '85',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: 0.85,
          backgroundColor: Colors.grey.shade200,
          color: Colors.green,
          minHeight: 8,
        ),
      ],
    ),
  );
}

/// ================= ATTENDANCE STATUS =================
Widget _buildAttendanceStatus() {
  return _card(
    color: const Color(0xFFE8F5E9),
    child: Row(
      children: [
        const Icon(Icons.check_circle, color: Colors.green),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Status Kehadiran Hari Ini',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                'Pemrograman Web\n08:00 - 10:00',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text('Tepat Waktu'),
        ),
      ],
    ),
  );
}

/// ================= TODAY SCHEDULE =================
Widget _buildTodaySchedule(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, AppRoutes.jadwalKelas);
    },
    child: _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Jadwal Kuliah Hari Ini',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.jadwalKelas);
                },
                child: const Text('Lihat Semua'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _scheduleItem(
            course: 'Pemrograman Web',
            time: '08:00 - 10:00',
            room: '301 - Lab',
            isNew: true,
          ),
          _scheduleItem(
            course: 'Basis Data',
            time: '10:30 - 12:00',
            room: '203 - Ruang',
          ),
          _scheduleItem(
            course: 'Algoritma',
            time: '13:00 - 15:00',
            room: '302 - Lab',
          ),
        ],
      ),
    ),
  );
}


/// ================= SHARED CARD =================
Widget _card({required Widget child, Color? color}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: child,
  );
}

Widget _scheduleItem({
  required String course,
  required String time,
  required String room,
  bool isNew = false,
}) {
  return ListTile(
    leading: const CircleAvatar(
      backgroundColor: Color(0xFFE3F2FD),
      child: Icon(Icons.school, color: Colors.blue),
    ),
    title: Text(course),
    subtitle: Text('$time\n$room'),
    trailing: isNew
        ? Chip(label: const Text('New'), backgroundColor: Colors.blue.shade50)
        : null,
  );
}

/// ================= SMALL COMPONENTS =================
class _SleepInfo extends StatelessWidget {
  final String title;
  final String time;

  const _SleepInfo({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 4),
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

