import 'package:flutter/material.dart';
import 'user_post_info.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Profile', 'Posts', 'Connection'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Back Button ──
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.black,
                  ),
                ),
              ),

              // ── Profile Header Card ──
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: const Color(0xFFEEF2FF),
                          child: const Icon(
                            Icons.person,
                            color: Color(0xFF2563EB),
                            size: 36,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Andrew Michel',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                'Sr. Android Developer at',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const Text(
                                'Polar Web-design',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF2563EB),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: Color(0xFFEEEEEE)),
                    const SizedBox(height: 8),
                    const Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '3k+ Followers',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Follow'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF2563EB)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              minimumSize: const Size(double.infinity, 46),
                            ),
                            child: const Text(
                              'Message',
                              style: TextStyle(
                                color: Color(0xFF2563EB),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
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
                    final selected = _selectedTabIndex == i;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedTabIndex = i),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
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

              // ── Profile Tab Content ──
              if (_selectedTabIndex == 0) ...[
                // About
                _sectionCard(
                  title: 'About',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '• Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          height: 1.6,
                        ),
                      ),
                      Text(
                        '• Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          height: 1.6,
                        ),
                      ),
                      Text(
                        '• When an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          height: 1.6,
                        ),
                      ),
                      Text(
                        '• It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),

                // Experience
                _sectionCard(
                  title: 'Experience',
                  child: Column(
                    children: [
                      _experienceItem(
                        icon: Icons.layers_rounded,
                        iconColor: Colors.red,
                        title: 'Sr. Devops developer',
                        company: 'Web-design studio',
                        period: '2013-16',
                      ),
                      const SizedBox(height: 16),
                      _experienceItem(
                        icon: Icons.circle,
                        iconColor: const Color(0xFF6366F1),
                        title: 'Jr. Front-end developer',
                        company: 'Urban devs',
                        period: '2014-15',
                      ),
                      const SizedBox(height: 16),
                      _experienceItem(
                        icon: Icons.circle,
                        iconColor: const Color(0xFF10B981),
                        title: 'Jr. System Engineer',
                        company: 'Goodevs labs',
                        period: '2013-14',
                      ),
                    ],
                  ),
                ),

                // Contact Details
                _sectionCard(
                  title: 'Contact Details',
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.language,
                            size: 18,
                            color: Color(0xFF2563EB),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'www.domain.com',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF2563EB),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 18,
                            color: Color(0xFF2563EB),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Andrew.domain.com',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF2563EB),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],

              // ── Posts Tab ──
              if (_selectedTabIndex == 1) ...[
                _buildPostCard(),
                _buildPostCard(),
              ],

              // ── Connection Tab ──
              if (_selectedTabIndex == 2)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Text(
                      'No connections yet',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _experienceItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String company,
    required String period,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              company,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            Text(
              period,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPostCard() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const UserPostInfoScreen()),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
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
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Andrew Michel',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Sr. Android Developer at Microsoft',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Hey there, folks',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            const Text(
              'Are you looking for a talented individual to join your team? Look no further! We are currently seeking a motivated and skilled individual to fill a position at our company.',
              style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.5),
            ),
            const SizedBox(height: 6),
            const Text(
              'Job Title:\n[Desktop App Developer]',
              style: TextStyle(fontSize: 12, height: 1.5),
            ),
            const SizedBox(height: 4),
            const Text('Qualifications:', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 6),
            const Text(
              'Read More',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(
                  Icons.thumb_up_outlined,
                  size: 14,
                  color: Color(0xFF2563EB),
                ),
                SizedBox(width: 4),
                Text(
                  '2.3k Likes',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(width: 12),
                Icon(Icons.access_time, size: 13, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  '20 mins ago',
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
