import 'package:flutter/material.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({super.key});

  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Profile', 'Posts', 'People'];

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
                  children: [
                    // ── Company Header ──
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: const Color(0xFF6366F1).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.business_rounded,
                              color: Color(0xFF6366F1),
                              size: 34,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Polar Web-design',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Information & Technology Company',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                size: 13,
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
                          const SizedBox(height: 4),
                          const Text(
                            '3k+ Followers',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 14),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Follow',
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

                    // ── Profile Tab ──
                    if (_selectedTab == 0) ...[
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About Us',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Important Links',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _linkRow(Icons.language, 'www.domain.com'),
                            const SizedBox(height: 10),
                            _linkRow(
                              Icons.camera_alt_outlined,
                              'www.instagram.com / domain',
                            ),
                            const SizedBox(height: 10),
                            _linkRow(
                              Icons.facebook_outlined,
                              'www.facebook.com / domain',
                            ),
                          ],
                        ),
                      ),
                    ],

                    // ── Posts Tab ──
                    if (_selectedTab == 1) ...[
                      _postCard(
                        name: 'Christina joel',
                        role: 'HR Consultant & manager of',
                        company: 'Polar Web-design',
                      ),
                      _postCard(
                        name: 'Charley Mora',
                        role: 'Lead Product designer of',
                        company: 'Polar Web-design',
                      ),
                    ],

                    // ── People Tab ──
                    if (_selectedTab == 2) ...[
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'People Working Here',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: 0.85,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              children: [
                                _peopleCard(
                                  'Andrew Michel',
                                  'Sr. Android Developer at Microsoft',
                                  '9k Connections',
                                ),
                                _peopleCard(
                                  'Rashel Teles',
                                  'Sr. Android Developer at Microsoft',
                                  '9k Connections',
                                ),
                                _peopleCard(
                                  'Joseph Diraz',
                                  'Sr. Connection Developer at Polar Web-design',
                                  '923 Connections',
                                ),
                                _peopleCard(
                                  'Merhues',
                                  'Sr. Android Developer at Polar Web-design',
                                  '1.9k Connections',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],

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

  Widget _linkRow(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF2563EB)),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF2563EB)),
        ),
      ],
    );
  }

  Widget _postCard({
    required String name,
    required String role,
    required String company,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFEEF2FF),
                child: const Icon(
                  Icons.person,
                  color: Color(0xFF2563EB),
                  size: 22,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(text: role),
                          TextSpan(
                            text: ' $company',
                            style: const TextStyle(color: Color(0xFF2563EB)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '+ Follow',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Hey there, folks',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Are you looking for a talented individual to join your team? Look no further! We are currently seeking a motivated and skilled individual to fill a position at our company.',
            style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.5),
          ),
          const SizedBox(height: 6),
          const Text(
            'Job Title:\n[Desktop App Developer]',
            style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.5),
          ),
          const SizedBox(height: 4),
          const Text(
            'Qualifications:',
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          const Text(
            'Read More',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.thumb_up_outlined, size: 14, color: Color(0xFF2563EB)),
              SizedBox(width: 4),
              Text(
                '1k Likes',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(width: 12),
              Icon(Icons.access_time, size: 13, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                '6 mins ago',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _actionBtn(Icons.thumb_up_outlined, 'Like'),
              _actionBtn(Icons.comment_outlined, 'Comment'),
              _actionBtn(Icons.share_outlined, 'Share'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _peopleCard(String name, String role, String connections) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFFEEF2FF),
            child: const Icon(Icons.person, color: Color(0xFF2563EB), size: 26),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            connections,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Follow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionBtn(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
