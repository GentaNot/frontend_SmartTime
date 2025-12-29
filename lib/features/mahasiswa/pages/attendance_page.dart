import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

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
            Text("Attendance"),
            Text("Konfirmasi kehadiran kelas", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _currentClassCard(),
            const SizedBox(height: 14),
            _summaryAttendance(),
            const SizedBox(height: 14),
            _attendanceHistory(),
            const SizedBox(height: 14),
            _attendanceInfo(),
          ],
        ),
      ),
    );
  }

  /// ================= CURRENT CLASS =================
  Widget _currentClassCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F1FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Kelas Berlangsung",
              style: TextStyle(
                color: Color(0xFF2F80ED),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Pemrograman Web",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text("Dr. Wahyu Pratama", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),
          _infoRow(Icons.access_time, "08:00 - 10:00"),
          _infoRow(Icons.location_on, "Lab 301"),
          _infoRow(Icons.calendar_month, "Jumat, 13 Desember 2024"),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check_circle),
              label: const Text("Konfirmasi Kehadiran"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2F80ED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= SUMMARY =================
  Widget _summaryAttendance() {
    return Row(
      children: [
        _summaryCard(
          "12",
          "Tepat Waktu",
          Colors.green,
          const Color(0xFFE9F9EF),
        ),
        const SizedBox(width: 10),
        _summaryCard("2", "Terlambat", Colors.orange, const Color(0xFFFFF6E5)),
        const SizedBox(width: 10),
        _summaryCard("0", "Alpha", Colors.red, const Color(0xFFFFECEC)),
      ],
    );
  }

  Widget _summaryCard(String value, String label, Color color, Color bg) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(label, style: TextStyle(color: color, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  /// ================= HISTORY =================
  Widget _attendanceHistory() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Riwayat Kehadiran",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _historyItem(
            "Pemrograman Web",
            "12 Des 2024",
            "Tepat Waktu",
            "+5",
            Colors.green,
          ),
          _historyItem(
            "Basis Data",
            "11 Des 2024",
            "Tepat Waktu",
            "+5",
            Colors.green,
          ),
          _historyItem(
            "Algoritma",
            "10 Des 2024",
            "Terlambat",
            "-2",
            Colors.orange,
          ),
          _historyItem(
            "Jaringan Komputer",
            "9 Des 2024",
            "Tepat Waktu",
            "+5",
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _historyItem(
    String matkul,
    String date,
    String status,
    String score,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  matkul,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(status, style: TextStyle(color: color, fontSize: 12)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  score,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= INFO =================
  Widget _attendanceInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2F80ED).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "ℹ Informasi Kehadiran",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F80ED),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "• Konfirmasi kehadiran maksimal 10 menit setelah kelas dimulai",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "• Tepat waktu: +5 score · Terlambat: -2 score · Alpha: -5 score",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "• Konfirmasi hanya dapat dilakukan sekali per pertemuan",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  /// ================= HELPERS =================
  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
