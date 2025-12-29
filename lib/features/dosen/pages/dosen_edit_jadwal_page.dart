import 'package:flutter/material.dart';

class Schedule {
  final int id;
  final String course;
  final String day;
  final String time;
  final String room;
  final int students;

  Schedule({
    required this.id,
    required this.course,
    required this.day,
    required this.time,
    required this.room,
    required this.students,
  });
}

class DosenEditJadwalPage extends StatelessWidget {
  const DosenEditJadwalPage({super.key});

  // Dummy schedule data
  List<Schedule> get schedules => [
        Schedule(
          id: 1,
          course: 'Pemrograman Web',
          day: 'Senin',
          time: '08:00 - 10:00',
          room: 'Lab 301',
          students: 32,
        ),
        Schedule(
          id: 2,
          course: 'Basis Data',
          day: 'Selasa',
          time: '10:00 - 12:00',
          room: 'Lab 302',
          students: 28,
        ),
        Schedule(
          id: 3,
          course: 'Algoritma',
          day: 'Rabu',
          time: '13:00 - 15:00',
          room: 'Kelas A201',
          students: 30,
        ),
        Schedule(
          id: 4,
          course: 'Jaringan Komputer',
          day: 'Kamis',
          time: '08:00 - 10:00',
          room: 'Lab 303',
          students: 25,
        ),
        Schedule(
          id: 5,
          course: 'Mobile Development',
          day: 'Jumat',
          time: '10:00 - 12:00',
          room: 'Lab 301',
          students: 29,
        ),
      ];

  // Gradient sesuai hari
  LinearGradient getDayGradient(String day) {
    switch (day) {
      case 'Senin':
        return const LinearGradient(colors: [Colors.blue, Colors.cyan]);
      case 'Selasa':
        return const LinearGradient(colors: [Colors.purple, Colors.pink]);
      case 'Rabu':
        return const LinearGradient(colors: [Colors.green, Colors.teal]);
      case 'Kamis':
        return const LinearGradient(colors: [Colors.orange, Colors.amber]);
      case 'Jumat':
        return const LinearGradient(colors: [Colors.red, Colors.pink]);
      case 'Sabtu':
        return const LinearGradient(colors: [Colors.indigo, Colors.purple]);
      default:
        return const LinearGradient(colors: [Colors.grey, Colors.black]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 60, 16, 24),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.purple, Colors.pink],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Edit Jadwal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Kelola jadwal mengajar',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // Jadwal List
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: schedules.map((s) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    gradient: getDayGradient(s.day),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        s.course,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${s.day}, ${s.time}',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Colors.blueAccent,
                                          Colors.cyanAccent,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.blue,
                                        ),
                                        const SizedBox(width: 4),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Ruangan',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white70,
                                              ),
                                            ),
                                            Text(
                                              s.room,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Colors.purpleAccent,
                                          Colors.pinkAccent,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.group,
                                          color: Colors.purple,
                                        ),
                                        const SizedBox(width: 4),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Mahasiswa',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white70,
                                              ),
                                            ),
                                            Text(
                                              '${s.students} orang',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // Floating add button
          Positioned(
            bottom: 24,
            right: 24,
            child: GestureDetector(
              onTap: () {
                // Tambahkan fungsi tambah jadwal di sini
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.indigo, Colors.purple],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 8),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
