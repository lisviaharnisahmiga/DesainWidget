import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modul Stateless',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B4EE6),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F7FC),
      ),
      home: const StatelessOverviewPage(),
    );
  }
}

class StatelessOverviewPage extends StatelessWidget {
  const StatelessOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pemrograman Mobile',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight,
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SectionHeader(
                            title: 'Kartu Mahasiswa',
                            subtitle:
                            'Universitas Internasional Semen Indonesia',
                          ),
                          const SizedBox(height: 10),
                          StudentCard(
                            nama: 'Lisvia Harni Sahmiga',
                            nim: '3012410036',
                            prodi: 'Informatika',
                            isPrimary: true,
                          ),
                          const SizedBox(height: 8),
                          StudentCard(
                            nama: 'Anisa Rahmawati',
                            nim: '3012410012',
                            prodi: 'Teknik Informatika',
                          ),
                          const SizedBox(height: 8),
                          StudentCard(
                            nama: 'Nabila Putri Rahma',
                            nim: '3012410025',
                            prodi: 'Sistem Informasi',
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0xFFE5E0F8),
                            ),
                          ),
                          _SectionHeader(
                            title: 'Profil Pengguna',
                            subtitle:
                            'Mahasiswa Universitas Internasional Semen Indonesia',
                          ),
                          const SizedBox(height: 10),
                          ProfileCard(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Widget Komponen Kartu Mahasiswa
class StudentCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String prodi;
  final bool isPrimary;

  const StudentCard({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodi,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isPrimary ? primaryColor.withOpacity(0.08) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isPrimary
              ? primaryColor.withOpacity(0.3)
              : const Color(0xFFEBE8F5),
          width: 1.2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isPrimary ? primaryColor : const Color(0xFFF0ECFB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.badge_outlined,
              color: isPrimary ? Colors.white : primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: isPrimary ? primaryColor : const Color(0xFF2D2B35),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$nim • $prodi',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7A7786),
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

// Widget Komponen Profil
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEBE8F5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 36,
            backgroundColor: Color(0xFF6B4EE6),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: Color(0xFFF0ECFB),
              child: Icon(
                Icons.person,
                size: 38,
                color: Color(0xFF6B4EE6),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Lisvia Harni Sahmiga',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2B35),
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Frontend & UI/UX Designer',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF6B4EE6),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _ContactIconButton(icon: Icons.email_outlined, label: 'Email'),
              _ContactIconButton(icon: Icons.phone_outlined, label: 'Telepon'),
              _ContactIconButton(
                  icon: Icons.location_on_outlined, label: 'Lokasi'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactIconButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ContactIconButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F5FD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E0F8)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF6B4EE6), size: 18),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4A4658),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D2B35),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 11.5, color: Color(0xFF8A8796)),
        ),
      ],
    );
  }
}