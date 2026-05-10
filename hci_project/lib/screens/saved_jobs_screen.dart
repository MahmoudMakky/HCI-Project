import 'package:flutter/material.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  final List<Map<String, dynamic>> _savedJobs = [
    {'title': 'Graphic Designer', 'company': 'Microsoft Corporation', 'logo': Icons.grid_view_rounded, 'color': 0xFF1877F2, 'location': 'California, United States', 'salary': '\$15k - \$35k / month', 'experience': '1.0 years', 'time': '7 month ago'},
    {'title': 'Junior FullStack', 'company': 'Google', 'logo': Icons.code_rounded, 'color': 0xFF10B981, 'location': 'Los Angeles, United States', 'salary': '\$20k - \$50k / month', 'experience': '0.1 years', 'time': '5 Week ago'},
  ];

  void _removeJob(int index) => setState(() => _savedJobs.removeAt(index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, size: 20, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Saved Job', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                  ],
                ),
              ),
            ),

            Expanded(
              child: _savedJobs.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bookmark_outline, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No Saved Job', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                          SizedBox(height: 8),
                          Text('Your saved jobs will appear here', style: TextStyle(fontSize: 13, color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _savedJobs.length,
                      itemBuilder: (context, i) {
                        final job = _savedJobs[i];
                        final color = Color(job['color'] as int);
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFEEEEEE)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 44, height: 44,
                                    decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                                    child: Icon(job['logo'] as IconData, color: color, size: 24),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(job['title'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                                        Text(job['company'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _removeJob(i),
                                    child: const Icon(Icons.bookmark, color: Color(0xFF2563EB), size: 22),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(height: 1, color: Color(0xFFEEEEEE)),
                              const SizedBox(height: 10),
                              Row(children: [
                                const Icon(Icons.location_on_outlined, size: 13, color: Colors.grey),
                                const SizedBox(width: 4),
                                Text(job['location'] as String, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                              ]),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(job['salary'] as String, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF2563EB))),
                                  Row(children: [
                                    const Icon(Icons.access_time, size: 12, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    Text(job['experience'] as String, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                                    const SizedBox(width: 10),
                                    const Icon(Icons.access_time_filled, size: 12, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    Text(job['time'] as String, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}