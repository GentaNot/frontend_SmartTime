import 'package:flutter/material.dart';

class ProfilDosenPage extends StatefulWidget {
  const ProfilDosenPage({super.key});

  @override
  State<ProfilDosenPage> createState() => _ProfilDosenPageState();
}

class _ProfilDosenPageState extends State<ProfilDosenPage> {
  bool notifEnabled = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 16),
            _buildInfoSection(),
            const SizedBox(height: 16),
            _buildSettingSection(),
            const SizedBox(height: 16),
            const SizedBox(height: 20),
            _buildLogoutButton(context),
            const SizedBox(height: 16),
            const Text(
              'SmartTime V2.0 • Build 2024.12',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 48, 20, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6A11CB), Color(0xFFB721FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 8),
              const Text(
                'Profil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 44,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 44, color: Colors.grey),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Dr. Wahyu Pratama',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Teknik Informatika',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // ================= INFO =================
  Widget _buildInfoSection() {
    return _buildCard(
      title: 'Informasi Pribadi',
      children: const [
        _InfoTile(
          icon: Icons.person_outline,
          label: 'Nama Lengkap',
          value: 'Dr. Wahyu Pratama',
        ),
        _InfoTile(
          icon: Icons.badge_outlined,
          label: 'NIDN',
          value: '0412345678',
        ),
        _InfoTile(
          icon: Icons.email_outlined,
          label: 'Email',
          value: 'wahyu@lecturer.ac.id',
        ),
      ],
    );
  }

  // ================= SETTINGS =================
  Widget _buildSettingSection() {
    return _buildCard(
      title: 'Pengaturan',
      children: [
        SwitchListTile(
          value: notifEnabled,
          onChanged: (v) => setState(() => notifEnabled = v),
          title: const Text('Notifikasi'),
          subtitle: const Text('Terima pembaruan push'),
          secondary: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }

  // ================= LOGOUT =================
  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        child: const Text(
          'Logout',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // ================= CARD WRAPPER =================
  Widget _buildCard({required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 4,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

// ================= REUSABLE WIDGETS =================
class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
