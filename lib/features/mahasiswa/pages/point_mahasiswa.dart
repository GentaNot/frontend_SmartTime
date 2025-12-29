import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart'; // Package untuk animasi ringan

class PointMahasiswaPage extends StatefulWidget {
  const PointMahasiswaPage({super.key});

  @override
  State<PointMahasiswaPage> createState() => _PointMahasiswaPageState();
}

class _PointMahasiswaPageState extends State<PointMahasiswaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int currentPoints = 1245;
  final int totalEarned = 2850;
  final int pointsSpent = 1605;

  final List<Map<String, dynamic>> history = [
    {
      "activity": "Check-in Pemrograman Web",
      "points": 10,
      "time": "2 jam lalu",
      "earned": true,
    },
    {
      "activity": "Bonus Ketepatan Waktu",
      "points": 5,
      "time": "2 jam lalu",
      "earned": true,
    },
    {
      "activity": "Tukar Voucher Kantin",
      "points": 50,
      "time": "1 hari lalu",
      "earned": false,
    },
  ];

  final List<Map<String, dynamic>> rewards = [
    {
      "name": "Voucher Kantin Rp 10.000",
      "desc": "Makan siang gratis",
      "points": 50,
    },
    {
      "name": "Free Print 50 Halaman",
      "desc": "Cetak gratis di kampus",
      "points": 75,
    },
    {
      "name": "Sertifikat Kehadiran Terbaik",
      "desc": "Penghargaan resmi",
      "points": 500,
    },
  ];

  final List<Map<String, dynamic>> achievements = [
    {
      "title": "Perfect Week",
      "desc": "Hadir sempurna 1 minggu",
      "progress": 5,
      "total": 5,
      "points": 25,
    },
    {
      "title": "Early Bird Master",
      "desc": "Datang lebih awal 10x",
      "progress": 7,
      "total": 10,
      "points": 50,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _claimReward(Map<String, dynamic> reward) {
    if (currentPoints >= reward["points"]) {
      setState(() {
        currentPoints -= reward["points"] as int;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Berhasil menukar ${reward["name"]}!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          _header(),
          TabBar(
            controller: _tabController,
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.purple,
            tabs: const [
              Tab(text: "Riwayat"),
              Tab(text: "Hadiah"),
              Tab(text: "Pencapaian"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_riwayatTab(), _hadiahTab(), _achievementTab()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.pink]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Tombol kembali
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Poin & Hadiah",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.yellowAccent, size: 32),
              const SizedBox(width: 8),
              BounceInDown(
                key: ValueKey<int>(currentPoints),
                duration: const Duration(milliseconds: 800),
                child: Text(
                  "$currentPoints",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _pointInfo("Total Diraih", totalEarned),
              _pointInfo("Terpakai", pointsSpent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pointInfo(String title, int value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.white70)),
        Text(
          value.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }

  // ================= RIWAYAT =================
  Widget _riwayatTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: history.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = history[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            title: Text(item["activity"]),
            subtitle: Text(item["time"]),
            trailing: Text(
              item["earned"] ? "+${item["points"]}" : "-${item["points"]}",
              style: TextStyle(
                color: item["earned"] ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  // ================= HADIAH =================
  Widget _hadiahTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: rewards.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final reward = rewards[index];
        final bool canClaim = currentPoints >= reward["points"];
        return BounceInUp(
          duration: const Duration(milliseconds: 500),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              title: Text(reward["name"]),
              subtitle: Text("${reward["desc"]} • ${reward["points"]} poin"),
              trailing: ElevatedButton(
                onPressed: canClaim ? () => _claimReward(reward) : null,
                child: const Text("Tukar"),
              ),
            ),
          ),
        );
      },
    );
  }

  // ================= ACHIEVEMENT =================
  Widget _achievementTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: achievements.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final a = achievements[index];
        final double progress = a["progress"] / a["total"];
        return BounceInRight(
          duration: const Duration(milliseconds: 500),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    a["title"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(a["desc"]),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress,
                    color: progress == 1 ? Colors.green : Colors.purple,
                    backgroundColor: Colors.grey.shade300,
                    minHeight: 8,
                  ),
                  const SizedBox(height: 6),
                  Text("${a["progress"]} / ${a["total"]}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
