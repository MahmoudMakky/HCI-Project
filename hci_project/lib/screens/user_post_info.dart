import 'package:flutter/material.dart';

class UserPostInfoScreen extends StatelessWidget {
  const UserPostInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Back ──
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                    const Icon(Icons.more_vert, size: 22, color: Colors.black),
                  ],
                ),
              ),

              // ── Profile Header ──
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
                            children: const [
                              Text(
                                'Andrew Michel',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Sr. Android Developer at',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
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

              // ── Tabs (Posts selected) ──
              Container(
                color: Colors.white,
                child: Row(
                  children: ['Profile', 'Posts', 'Connection'].map((tab) {
                    final selected = tab == 'Posts';
                    return Expanded(
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
                          tab,
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
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 8),

              // ── Recent Posts Label ──
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: const Text(
                  'Recent Posts',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              // ── Post Cards ──
              _postCard(),
              _postCard(),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _postCard() {
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
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Andrew Michel',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
