import 'package:flutter/material.dart';
import 'account_setting_screen.dart';
import 'saved_jobs_screen.dart';
import 'track_job_screen.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Profile avatar + name
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 44,
                          backgroundColor: const Color(0xFFEEF2FF),
                          child: const Icon(Icons.person, size: 48, color: Color(0xFF2563EB)),
                        ),
                        Container(
                          width: 26, height: 26,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2563EB)),
                          child: const Icon(Icons.edit, color: Colors.white, size: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Omar Zakaria', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black)),
                    const SizedBox(height: 16),
                    // Profile completion
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF2FF),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 44, height: 44,
                                child: CircularProgressIndicator(
                                  value: 0.76,
                                  strokeWidth: 4,
                                  backgroundColor: Colors.white,
                                  color: const Color(0xFF2563EB),
                                ),
                              ),
                              const Text('76%', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF2563EB))),
                            ],
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Profile Completion', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
                                Text('5 Details Remaining', style: TextStyle(fontSize: 11, color: Colors.grey)),
                                Text('Updated 3 days ago', style: TextStyle(fontSize: 11, color: Colors.grey)),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // ── Menu Items ──
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    _menuSection('Profile', [
                      _MenuItem('Account', 'Personal Info, Profile Picture', Icons.person_outline, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AccountSettingScreen()))),
                      _MenuItem('Profile Set-up', 'Maintain your job, experience, Project work and certifications.', Icons.settings_outlined, () {}),
                    ]),
                    const Divider(height: 1, color: Color(0xFFEEEEEE)),
                    _menuItem(context, icon: Icons.track_changes_outlined, title: 'Track Job', subtitle: 'Track your job application and status updates', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TrackJobScreen()))),
                    const Divider(height: 1, color: Color(0xFFEEEEEE)),
                    _menuItem(context, icon: Icons.bookmark_outline, title: 'Saved Job', subtitle: 'Manage your bookmarked job opportunities', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SavedJobsScreen()))),
                    const Divider(height: 1, color: Color(0xFFEEEEEE)),
                    _menuItem(context, icon: Icons.help_outline, title: 'Help & Support', subtitle: 'Customer Support, 24/7, Chat support, Customer call representative', onTap: () {}),
                    const Divider(height: 1, color: Color(0xFFEEEEEE)),
                    _menuItem(context, icon: Icons.workspace_premium_outlined, title: 'Upgrade to Premium', subtitle: 'Get our Premium plan to unlock better opportunities.', onTap: () {}),
                    const Divider(height: 1, color: Color(0xFFEEEEEE)),
                    _menuItem(context, icon: Icons.privacy_tip_outlined, title: 'Privacy Policy', subtitle: 'Read our Privacy policy documentation.', onTap: () {}),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuSection(String label, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
          child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        ...items,
      ],
    );
  }

  Widget _menuItem(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: const Color(0xFF2563EB), size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
                  Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey, height: 1.4)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  const _MenuItem(this.title, this.subtitle, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: const Color(0xFF2563EB), size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black)),
                  Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey, height: 1.4)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}