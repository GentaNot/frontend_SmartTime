import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/routes/app_routes.dart';

class ScoreMahasiswaPage extends StatelessWidget {
  const ScoreMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 16),
              _currentScore(),
              const SizedBox(height: 16),
              _monthlyTrend(),
              const SizedBox(height: 16),
              _attendanceSummary(),
              const SizedBox(height: 16),
              _attendanceDetail(),
              const SizedBox(height: 16),
              _logoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 30, color: Colors.blue),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Sarah Wijaya",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text("NIM: 2021001", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }

  // ================= CURRENT SCORE =================
  Widget _currentScore() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Current Score",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "85",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Excellent",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: 0.85,
            minHeight: 8,
            backgroundColor: Colors.grey.shade300,
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 6),
          const Text(
            "+7 poin dari minggu lalu",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ================= MONTHLY TREND =================
  Widget _monthlyTrend() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tren Skor Bulanan",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const weeks = ["W1", "W2", "W3", "W4"];
                        return Text(
                          weeks[value.toInt()],
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                    spots: const [
                      FlSpot(0, 78),
                      FlSpot(1, 82),
                      FlSpot(2, 84),
                      FlSpot(3, 86),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= SUMMARY =================
  Widget _attendanceSummary() {
    return Row(
      children: [
        Expanded(
          child: _summaryBox(
            title: "Total Pertemuan",
            value: "14",
            color: Colors.grey.shade200,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _summaryBox(
            title: "Tingkat Kehadiran",
            value: "86%",
            color: Colors.green.shade100,
          ),
        ),
      ],
    );
  }

  // ================= DETAIL =================
  Widget _attendanceDetail() {
    return _card(
      child: Column(
        children: [
          _detailRow(color: Colors.green, title: "Tepat Waktu", value: "12"),
          _detailRow(color: Colors.orange, title: "Terlambat", value: "2"),
          _detailRow(color: Colors.red, title: "Alpha", value: "0"),
        ],
      ),
    );
  }

  // ================= LOGOUT =================
  Widget _logoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: const Icon(Icons.logout),
        label: const Text("Logout"),
      ),
    );
  }

  // ================= REUSABLE =================
  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }

  Widget _summaryBox({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _detailRow({
    required Color color,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 5, backgroundColor: color),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
