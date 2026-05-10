import 'package:flutter/material.dart';
import 'apply_for_job.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({super.key});

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Job detail', 'Qualification', 'Skills'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // ── Back ──
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back, size: 22, color: Colors.black),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Job Header Card ──
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xFF6366F1).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(
                              Icons.design_services_rounded,
                              color: Color(0xFF6366F1),
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Graphic Designer',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Polar Web-design',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF2563EB),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'California, United States',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEEF2FF),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  '\$15k - \$25k / month',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF2563EB),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  '1 Month ago',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ApplyForJobScreen(),
                                ),
                              ),
                              child: const Text(
                                'Apply For Job',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ── Tabs ──
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: List.generate(_tabs.length, (i) {
                          final selected = _selectedTab == i;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedTab = i),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: selected
                                          ? const Color(0xFF2563EB)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  _tabs[i],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: selected
                                        ? const Color(0xFF2563EB)
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ── Tab Content ──
                    if (_selectedTab == 0) _jobDetailContent(),
                    if (_selectedTab == 1) _qualificationContent(),
                    if (_selectedTab == 2) _skillsContent(),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _jobDetailContent() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Requirements :',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '• Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.6),
          ),
          Text(
            '• Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
            style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.6),
          ),
          Text(
            '• When an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.6),
          ),
          Text(
            '• It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
            style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _qualificationContent() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Qualification :',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '• Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.6),
          ),
          Text(
            '• Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
            style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.6),
          ),
          Text(
            '• When an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.6),
          ),
          Text(
            '• It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
            style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _skillsContent() {
    final skills = [
      'Graphic Designing',
      'Adobe XD',
      'Figma design',
      'Adobe Photoshop',
      'Figma',
      'Illustrator',
    ];
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Skills :',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills
                .map(
                  (s) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF2563EB).withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      s,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
