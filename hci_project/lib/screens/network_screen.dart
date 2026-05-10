import 'package:flutter/material.dart';
import 'user_profile.dart';
import 'no_connection_screen.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  // Each request: {name, role, company, connections}
  final List<Map<String, String>> _requests = [
    {
      'name': 'Andrew Michel',
      'role': 'Sr. Android Developer at',
      'company': 'Polar Web-design',
      'connections': '3k+ Connection',
    },
    {
      'name': 'Andre Design Studio',
      'role': 'Product Designer at',
      'company': 'design studio',
      'connections': '3k+ Connection',
    },
    {
      'name': 'Joseph Dolny',
      'role': 'Sr. Software engineer at',
      'company': 'Uber devs & labs',
      'connections': '3k+ Connection',
    },
    {
      'name': 'Mendez Diaz',
      'role': 'Sr. UI devs at',
      'company': 'Uber devs & labs',
      'connections': '3k+ Connection',
    },
  ];

  void _reject(int index) => setState(() => _requests.removeAt(index));
  void _accept(int index) => setState(() => _requests.removeAt(index));

  @override
  Widget build(BuildContext context) {
    // ✅ Show NoConnectionScreen when list is empty
    if (_requests.isEmpty) {
      return const NoConnectionScreen();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ──
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: const Text(
                  'Recent Request',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Request',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Connection Request Cards ──
              ...List.generate(_requests.length, (i) {
                final r = _requests[i];
                return _requestCard(
                  context,
                  index: i,
                  name: r['name']!,
                  role: r['role']!,
                  company: r['company']!,
                  connections: r['connections']!,
                );
              }),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _requestCard(
    BuildContext context, {
    required int index,
    required String name,
    required String role,
    required String company,
    required String connections,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundColor: Color(0xFFEEF2FF),
            child: Icon(Icons.person, color: Color(0xFF2563EB), size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const UserProfileScreen(),
                    ),
                  ),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                    children: [
                      TextSpan(text: '$role '),
                      TextSpan(
                        text: company,
                        style: const TextStyle(color: Color(0xFF2563EB)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  connections,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              // ✅ Reject removes the card
              GestureDetector(
                onTap: () => _reject(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFDDE1E7)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Reject',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              // ✅ Accept removes the card
              GestureDetector(
                onTap: () => _accept(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Accept',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
