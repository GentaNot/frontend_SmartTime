import 'package:flutter/material.dart';

class VerifyDosenPage extends StatefulWidget {
  const VerifyDosenPage({super.key});

  @override
  State<VerifyDosenPage> createState() => _VerifyDosenPageState();
}

class _VerifyDosenPageState extends State<VerifyDosenPage> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> mahasiswa = [
    {"nama": "Ahmad Rizki", "nim": "2021001", "status": "Hadir"},
    {"nama": "Sarah Wijaya", "nim": "2021002", "status": "Hadir"},
    {"nama": "Budi Santoso", "nim": "2021003", "status": "Terlambat"},
    {"nama": "Dewi Lestari", "nim": "2021004", "status": ""},
    {"nama": "Eko Prasetyo", "nim": "2021005", "status": ""},
  ];

  String search = "";

  void setStatus(int index, String status) {
    setState(() {
      mahasiswa[index]["status"] = status;
    });
  }

  int countStatus(String status) {
    return mahasiswa.where((m) => m["status"] == status).length;
  }

  @override
  Widget build(BuildContext context) {
    final filteredMahasiswa = mahasiswa.where((m) {
      final q = search.toLowerCase();
      return m["nama"].toLowerCase().contains(q) ||
          m["nim"].toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text("Verifikasi Kehadiran"),
        backgroundColor: const Color(0xFF2F80ED),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildSummary(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              onChanged: (v) => setState(() => search = v),
              decoration: InputDecoration(
                hintText: "Cari nama atau NIM...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMahasiswa.length,
              itemBuilder: (context, index) {
                final m = filteredMahasiswa[index];
                final realIndex = mahasiswa.indexOf(m);
                return _buildMahasiswaCard(m, realIndex);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Kehadiran berhasil disimpan"),
                    ),
                  );
                },
                icon: const Icon(Icons.lock),
                label: const Text("Kunci & Simpan Kehadiran"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F80ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF2F80ED),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _summaryItem("Hadir", countStatus("Hadir")),
          _summaryItem("Terlambat", countStatus("Terlambat")),
          _summaryItem("Alpha", countStatus("Alpha")),
          _summaryItem(
            "Pending",
            mahasiswa.where((m) => m["status"] == "").length,
          ),
        ],
      ),
    );
  }

  Widget _summaryItem(String title, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(title, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildMahasiswaCard(Map<String, dynamic> m, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            m["nama"],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text("NIM: ${m["nim"]}", style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          Row(
            children: [
              _statusButton(
                label: "Hadir",
                color: Colors.green,
                selected: m["status"] == "Hadir",
                onTap: () => setStatus(index, "Hadir"),
              ),
              const SizedBox(width: 8),
              _statusButton(
                label: "Terlambat",
                color: Colors.orange,
                selected: m["status"] == "Terlambat",
                onTap: () => setStatus(index, "Terlambat"),
              ),
              const SizedBox(width: 8),
              _statusButton(
                label: "Alpha",
                color: Colors.red,
                selected: m["status"] == "Alpha",
                onTap: () => setStatus(index, "Alpha"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusButton({
    required String label,
    required Color color,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 36,
          decoration: BoxDecoration(
            color: selected ? color : const Color(0xFFF1F3F6),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
