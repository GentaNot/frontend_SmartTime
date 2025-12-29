import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  TimeOfDay? sleepTime;
  TimeOfDay? wakeTime;
  bool prepAlarm = true;

  String get sleepDuration {
    if (sleepTime == null || wakeTime == null) return "--";

    final now = DateTime.now();
    DateTime start = DateTime(
      now.year,
      now.month,
      now.day,
      sleepTime!.hour,
      sleepTime!.minute,
    );
    DateTime end = DateTime(
      now.year,
      now.month,
      now.day,
      wakeTime!.hour,
      wakeTime!.minute,
    );

    if (end.isBefore(start)) {
      end = end.add(const Duration(days: 1));
    }

    final diff = end.difference(start);
    return "${diff.inHours}j ${diff.inMinutes.remainder(60)}m";
  }

  Future<void> pickTime(bool isSleep) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: isSleep
          ? (sleepTime ?? TimeOfDay.now())
          : (wakeTime ?? TimeOfDay.now()),
    );

    if (picked != null) {
      setState(() {
        isSleep ? sleepTime = picked : wakeTime = picked;
      });
    }
  }

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
            Text("Sleep & Alarm"),
            Text("Atur jadwal tidur Anda", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _sleepDurationCard(),
            const SizedBox(height: 14),
            _timeCard(
              icon: Icons.nightlight_round,
              title: "Waktu Tidur",
              subtitle: "Kapan Anda akan tidur?",
              time: sleepTime,
              onTap: () => pickTime(true),
            ),
            const SizedBox(height: 12),
            _timeCard(
              icon: Icons.wb_sunny,
              title: "Waktu Bangun",
              subtitle: "Kapan Anda harus bangun?",
              time: wakeTime,
              onTap: () => pickTime(false),
            ),
            const SizedBox(height: 12),
            _prepAlarmCard(),
            const SizedBox(height: 12),
            _tipsCard(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 48,
          child: ElevatedButton.icon(
            onPressed: saveSchedule,
            icon: const Icon(Icons.save),
            label: const Text("Simpan Jadwal"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2F80ED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ================= DURASI TIDUR =================
  Widget _sleepDurationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFFBF3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 6),
              Text(
                "Durasi Tidur",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            sleepDuration,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Rekomendasi: 7–9 jam per malam",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// ================= TIME PICKER =================
  Widget _timeCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required TimeOfDay? time,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE8F1FF),
            child: Icon(icon, color: const Color(0xFF2F80ED)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              time == null ? "--:--" : time.format(context),
              style: const TextStyle(fontSize: 16, color: Color(0xFF2F80ED)),
            ),
          ),
        ],
      ),
    );
  }

  void saveSchedule() {
    if (sleepTime == null || wakeTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Silakan atur waktu tidur dan bangun terlebih dahulu"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Jadwal tidur disimpan • Durasi $sleepDuration"),
        backgroundColor: Colors.green,
      ),
    );
  }

  /// ================= PREP ALARM =================
  Widget _prepAlarmCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFE8F1FF),
            child: Icon(Icons.notifications, color: Color(0xFF2F80ED)),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Preparation Alarm",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "30 menit sebelum kelas",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Switch(
            value: prepAlarm,
            activeColor: const Color(0xFF2F80ED),
            onChanged: (v) => setState(() => prepAlarm = v),
          ),
        ],
      ),
    );
  }

  /// ================= TIPS =================
  Widget _tipsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2F80ED).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "💡 Tips Tidur Berkualitas",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F80ED),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "• Tidur dan bangun di waktu yang sama setiap hari",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "• Hindari gadget 30 menit sebelum tidur",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "• Jaga suhu kamar tetap sejuk (18–22°C)",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "• Hindari kafein 6 jam sebelum tidur",
            style: TextStyle(fontSize: 12),
          ),
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
