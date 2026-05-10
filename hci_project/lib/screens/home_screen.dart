import 'package:flutter/material.dart';
import 'user_profile.dart';
import 'search_not_found.dart';
import 'advanced_filter.dart';
import 'job_detail.dart';
import 'company_profile.dart';
import 'network_screen.dart';
import 'create_post.dart';
import 'message_screen.dart';
import 'profile_page_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  final List<String> _categories = [
    'All', 'Development', 'Designing', 'Marketing', 'Finance',
  ];
  int _selectedCategory = 0;

  void _openPost() {
    final Widget postScreen = const CreatePostScreen();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext sheetContext) {
        return FractionallySizedBox(heightFactor: 0.95, child: postScreen);
      },
    );
  }

  void _onTabTapped(int i) {
    if (i == 2) { _openPost(); return; }
    setState(() => _selectedTab = i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(child: _buildCurrentPage()),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCurrentPage() {
    if (_selectedTab == 1) {
      return const NetworkScreen();
    } else if (_selectedTab == 3) {
      return const MessageScreen();
    } else if (_selectedTab == 4) {
      return const ProfilePageScreen(); // ✅ Profile tab → ProfilePageScreen
    } else {
      return SingleChildScrollView(child: _homeBody());
    }
  }

  Widget _homeBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ──
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Good Morning', style: TextStyle(fontSize: 13, color: Colors.grey)),
                Text('Test', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              ]),
              Container(
                width: 40, height: 40,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFDDE1E7))),
                child: const Icon(Icons.notifications_outlined, color: Colors.black, size: 20),
              ),
            ],
          ),
        ),

        // ── Search Bar ──
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchNotFoundScreen())),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    height: 46,
                    decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
                    child: const Row(children: [
                      Icon(Icons.search, color: Colors.grey, size: 20),
                      SizedBox(width: 8),
                      Text('Search Company, Job Profile....', style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ]),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdvancedFilterScreen())),
                child: Container(
                  width: 46, height: 46,
                  decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.tune, color: Colors.black, size: 20),
                ),
              ),
            ],
          ),
        ),

        // ── Category Chips ──
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(bottom: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: List.generate(_categories.length, (i) {
                final selected = _selectedCategory == i;
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = i),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: selected ? const Color(0xFF2563EB) : const Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(_categories[i], style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: selected ? Colors.white : Colors.black)),
                  ),
                );
              }),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // ── Top Companies ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Top Companies Hiring', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
              GestureDetector(onTap: () {}, child: const Text('View all', style: TextStyle(fontSize: 13, color: Color(0xFF2563EB)))),
            ],
          ),
        ),
        const SizedBox(height: 12),

        _jobCard(logo: Icons.grid_view_rounded, logoColor: const Color(0xFF1877F2), title: 'Graphic Designer', company: 'Microsoft Corporation', location: 'California, United States', salary: '\$15k - \$25k / month', experience: '1-2 years', time: '2 month ago'),
        _jobCard(logo: Icons.design_services_rounded, logoColor: const Color(0xFF6366F1), title: 'UI / UX Designer', company: 'Figma', location: 'New York, United States', salary: '\$20k - \$30k / month', experience: '1.5 years', time: '30 days ago'),

        const SizedBox(height: 16),

        // ── Recent Posts ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent Posts', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
              GestureDetector(onTap: () {}, child: const Row(children: [
                Text('Sort by', style: TextStyle(fontSize: 12, color: Colors.grey)),
                SizedBox(width: 4),
                Icon(Icons.swap_vert, size: 16, color: Colors.grey),
              ])),
            ],
          ),
        ),
        const SizedBox(height: 12),

        _postCard(name: 'Andrew Michel', role: 'Sr. Android Developer at', company: 'Microsoft', isFollowing: false, time: '20 mins ago', likes: '2.3k'),
        _postCard(name: 'Andrew Michel', role: 'Sr. Android Developer at', company: 'Microsoft', isFollowing: false, time: '20 mins ago', likes: '2.3k'),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _jobCard({required IconData logo, required Color logoColor, required String title, required String company, required String location, required String salary, required String experience, required String time}) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const JobDetailScreen())),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFEEEEEE))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(width: 44, height: 44, decoration: BoxDecoration(color: logoColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Icon(logo, color: logoColor, size: 24)),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CompanyProfileScreen())),
                child: Text(company, style: const TextStyle(fontSize: 12, color: Color(0xFF2563EB))),
              ),
            ])),
            const Icon(Icons.bookmark_border, color: Colors.grey, size: 20),
          ]),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 12),
          Row(children: [const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey), const SizedBox(width: 4), Text(location, style: const TextStyle(fontSize: 12, color: Colors.grey))]),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(salary, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF2563EB))),
            Row(children: [
              const Icon(Icons.access_time, size: 13, color: Colors.grey), const SizedBox(width: 4),
              Text(experience, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(width: 12),
              const Icon(Icons.access_time_filled, size: 13, color: Colors.grey), const SizedBox(width: 4),
              Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ]),
          ]),
        ]),
      ),
    );
  }

  Widget _postCard({required String name, required String role, required String company, required bool isFollowing, required String time, required String likes}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFEEEEEE))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const CircleAvatar(radius: 20, backgroundColor: Color(0xFFEEF2FF), child: Icon(Icons.person, color: Color(0xFF2563EB), size: 22)),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const UserProfileScreen())),
              child: Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            RichText(text: TextSpan(style: const TextStyle(fontSize: 11, color: Colors.grey), children: [
              TextSpan(text: role),
              TextSpan(text: ' $company', style: const TextStyle(color: Color(0xFF2563EB))),
            ])),
          ])),
          const Icon(Icons.more_horiz, color: Colors.grey),
        ]),
        const SizedBox(height: 10),
        Container(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6), decoration: BoxDecoration(color: const Color(0xFF2563EB), borderRadius: BorderRadius.circular(20)), child: const Text('+ Follow', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500))),
        const SizedBox(height: 10),
        const Text('Hey there, folks', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black)),
        const SizedBox(height: 6),
        const Text('Are you looking for a talented individual to join your team? Look no further! We are currently seeking a motivated and skilled individual to fill a position at our company.', style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.5)),
        const SizedBox(height: 6),
        const Text('Job Title:\n[Desktop App Developer]', style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.5)),
        const SizedBox(height: 4),
        const Text('Qualifications:', style: TextStyle(fontSize: 12, color: Colors.black87)),
        const SizedBox(height: 8),
        GestureDetector(onTap: () {}, child: const Text('Read More', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black))),
        const SizedBox(height: 12),
        const Divider(height: 1, color: Color(0xFFEEEEEE)),
        const SizedBox(height: 10),
        Row(children: [
          const Icon(Icons.thumb_up_outlined, size: 14, color: Color(0xFF2563EB)), const SizedBox(width: 4),
          Text('$likes Likes', style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(width: 12),
          const Icon(Icons.access_time, size: 13, color: Colors.grey), const SizedBox(width: 4),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _actionBtn(Icons.thumb_up_outlined, 'Like'),
          _actionBtn(Icons.comment_outlined, 'Comment'),
          _actionBtn(Icons.share_outlined, 'Share'),
        ]),
      ]),
    );
  }

  Widget _actionBtn(IconData icon, String label) {
    return Row(children: [Icon(icon, size: 18, color: Colors.grey), const SizedBox(width: 6), Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey))]);
  }

  Widget _buildBottomNav() {
    final items = [
      {'icon': Icons.home_outlined, 'label': 'Home'},
      {'icon': Icons.hub_outlined, 'label': 'Network'},
      {'icon': Icons.add_circle_outline, 'label': 'Post'},
      {'icon': Icons.chat_bubble_outline, 'label': 'Message'},
      {'icon': Icons.person_outline, 'label': 'Profile'},
    ];
    return Container(
      decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Color(0xFFEEEEEE)))),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final selected = _selectedTab == i;
          return GestureDetector(
            onTap: () => _onTabTapped(i),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(items[i]['icon'] as IconData, size: 24, color: selected ? const Color(0xFF2563EB) : Colors.grey),
              const SizedBox(height: 2),
              Text(items[i]['label'] as String, style: TextStyle(fontSize: 10, color: selected ? const Color(0xFF2563EB) : Colors.grey)),
            ]),
          );
        }),
      ),
    );
  }
}