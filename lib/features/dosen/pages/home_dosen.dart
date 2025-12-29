import 'package:flutter/material.dart';
import 'package:flutter_application_4/features/dosen/pages/dosen_edit_jadwal_page.dart';

class HomeDosenPage extends StatelessWidget {
  const HomeDosenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildTeachingSchedule(context),
              const SizedBox(height: 16),
              _buildStudentSummary(),
              const SizedBox(height: 16),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang,',
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      'Dr. Wahyu Pratama',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'NIDN: 042345678',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(Icons.notifications, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              _HeaderStat(title: 'Kelas Hari Ini', value: '3'),
              SizedBox(width: 12),
              _HeaderStat(title: 'Total Mahasiswa', value: '95'),
              SizedBox(width: 12),
              _HeaderStat(title: 'Avg Score', value: '82'),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= TEACHING SCHEDULE =================
Widget _buildTeachingSchedule(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigasi ke halaman edit jadwal
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const DosenEditJadwalPage()),
      );
    },
    child: _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Jadwal Mengajar Hari Ini',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                'Minggu, 28 Desember',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _teachingItem(
            course: 'Pemrograman Web',
            time: '08:00 - 10:00',
            room: 'Lab 301',
            status: 'Selesai',
            present: '25/35 hadir',
          ),
          _teachingItem(
            course: 'Basis Data',
            time: '10:30 - 12:30',
            room: 'Ruang 205',
            status: 'Berlangsung',
            present: '32/34 hadir',
            action: ElevatedButton(
              onPressed: () {},
              child: const Text('Verifikasi Kehadiran'),
            ),
          ),
          _teachingItem(
            course: 'Algoritma',
            time: '13:30 - 15:00',
            room: 'Lab 302',
            status: 'Akan Datang',
            present: '0/28 hadir',
            action: OutlinedButton(
              onPressed: () {},
              child: const Text('Belum Dimulai'),
            ),
          ),
        ],
      ),
    ),
  );
}


  /// ================= STUDENT SUMMARY =================
  Widget _buildStudentSummary() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ringkasan Mahasiswa',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              _SummaryBox(
                title: 'Skor Baik (>75)',
                value: '78',
                color: Colors.green,
                icon: Icons.check_circle,
              ),
              SizedBox(width: 12),
              _SummaryBox(
                title: 'Perlu Perhatian',
                value: '17',
                color: Colors.orange,
                icon: Icons.warning,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= HELPERS =================
  Widget _card({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      child: child,
    );
  }

  Widget _teachingItem({
    required String course,
    required String time,
    required String room,
    required String status,
    required String present,
    Widget? action,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFE3F2FD),
            child: Icon(Icons.school, color: Colors.blue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  '$time • $room',
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  present,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Chip(
                label: Text(status),
                backgroundColor: status == 'Berlangsung'
                    ? Colors.blue.shade50
                    : status == 'Selesai'
                    ? Colors.green.shade50
                    : Colors.grey.shade200,
              ),
              if (action != null) ...[const SizedBox(height: 4), action],
            ],
          ),
        ],
      ),
    );
  }
}

/// ================= COMPONENTS =================
class _HeaderStat extends StatelessWidget {
  final String title;
  final String value;

  const _HeaderStat({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryBox extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const _SummaryBox({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
