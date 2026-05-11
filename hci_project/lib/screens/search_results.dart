import 'package:flutter/material.dart';
import 'advanced_filter.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final _searchController = TextEditingController(text: 'Design');
  int _selectedFilter = 0;
  String _sortBy = 'Recent';
  final List<String> _filterTabs = ['All', 'Company', 'Jobs', 'People'];
  final List<String> _sortOptions = [
    'Recent',
    'Relevant',
    'Top Rated',
    'Salary: High to Low',
    'Salary: Low to High',
  ];

  // ── Data ──
  final List<Map<String, dynamic>> _allJobs = [
    {
      'title': 'Graphic Designer',
      'company': 'Microsoft Corporation',
      'logo': Icons.grid_view_rounded,
      'color': 0xFF1877F2,
      'location': 'California, United States',
      'salary': '\$15k - \$25k / month',
      'experience': '1.5 years',
      'time': '2 month ago',
      'salaryNum': 15,
    },
    {
      'title': 'UI / UX Designer',
      'company': 'Figma',
      'logo': Icons.design_services_rounded,
      'color': 0xFF6366F1,
      'location': 'New York, United States',
      'salary': '\$25k - \$30k / month',
      'experience': '1.5 years',
      'time': '10 days ago',
      'salaryNum': 25,
    },
    {
      'title': 'Senior Designer',
      'company': 'Apple Inc',
      'logo': Icons.phone_iphone,
      'color': 0xFF6B7280,
      'location': 'San Francisco, United States',
      'salary': '\$40k - \$60k / month',
      'experience': '3 years',
      'time': '5 days ago',
      'salaryNum': 40,
    },
  ];

  List<Map<String, dynamic>> get _sortedJobs {
    final jobs = List<Map<String, dynamic>>.from(_allJobs);
    switch (_sortBy) {
      case 'Salary: High to Low':
        jobs.sort(
          (a, b) => (b['salaryNum'] as int).compareTo(a['salaryNum'] as int),
        );
        break;
      case 'Salary: Low to High':
        jobs.sort(
          (a, b) => (a['salaryNum'] as int).compareTo(b['salaryNum'] as int),
        );
        break;
      case 'Top Rated':
        jobs.sort(
          (a, b) => (b['salaryNum'] as int).compareTo(a['salaryNum'] as int),
        );
        break;
      default:
        break;
    }
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) return jobs;
    return jobs
        .where(
          (j) =>
              (j['title'] as String).toLowerCase().contains(query) ||
              (j['company'] as String).toLowerCase().contains(query),
        )
        .toList();
  }

  void _showSortSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sort By',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ..._sortOptions.map(
              (opt) => GestureDetector(
                onTap: () {
                  setState(() => _sortBy = opt);
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: _sortBy == opt
                        ? const Color(0xFFEEF2FF)
                        : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _sortBy == opt
                          ? const Color(0xFF2563EB)
                          : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        opt,
                        style: TextStyle(
                          fontSize: 14,
                          color: _sortBy == opt
                              ? const Color(0xFF2563EB)
                              : Colors.black,
                          fontWeight: _sortBy == opt
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                      if (_sortBy == opt)
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF2563EB),
                          size: 18,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Search Bar ──
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (_) => setState(() {}),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 20,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AdvancedFilterScreen(),
                        ),
                      ),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Filter Tabs ──
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Row(
                  children: List.generate(_filterTabs.length, (i) {
                    final selected = _selectedFilter == i;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedFilter = i),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFF2563EB)
                              : const Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _filterTabs[i],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: selected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 8),

              // ── Company Section ──
              if (_selectedFilter == 0 || _selectedFilter == 1) ...[
                _sectionHeader('Company', 'View all'),
                _companyCard(
                  icon: Icons.design_services_rounded,
                  iconColor: const Color(0xFF6366F1),
                  name: 'UX Design Labs',
                  category: 'Information & Technology Company',
                  location: 'California, United States',
                  followers: '9k',
                ),
                _companyCard(
                  icon: Icons.brush_rounded,
                  iconColor: const Color(0xFF10B981),
                  name: 'Geni Design Studio',
                  category: 'Information, Designing Company',
                  location: 'London, New York',
                  followers: '9k',
                ),
              ],

              // ── People Section ──
              if (_selectedFilter == 0 || _selectedFilter == 3) ...[
                const SizedBox(height: 8),
                _sectionHeader('People', 'View all'),
                _personCard(
                  name: 'Andrew Michel',
                  role: 'Sr. Android Developer at Microsoft',
                  location: 'London, New York',
                  followers: '100+',
                ),
                _personCard(
                  name: 'Brooke cagle',
                  role: 'Sr. Network Administrator at Google',
                  location: 'Paris, France',
                  followers: '1000+',
                ),
              ],

              // ── Jobs Section ──
              if (_selectedFilter == 0 || _selectedFilter == 2) ...[
                const SizedBox(height: 8),
                // Sort header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Jobs',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: _showSortSheet,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEF2FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.sort,
                                color: Color(0xFF2563EB),
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Sort: $_sortBy',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF2563EB),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_sortedJobs.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: Column(
                        children: [
                          Icon(Icons.search_off, size: 48, color: Colors.grey),
                          SizedBox(height: 12),
                          Text(
                            'No jobs found',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  ...(_sortedJobs.map((job) => _jobCard(job))),
              ],

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              action,
              style: const TextStyle(fontSize: 13, color: Color(0xFF2563EB)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _companyCard({
    required IconData icon,
    required Color iconColor,
    required String name,
    required String category,
    required String location,
    required String followers,
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
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 24),
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
                  ),
                ),
                Text(
                  category,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.people_outline,
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '$followers Followers',
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(70, 36),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: const Text('Follow', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _personCard({
    required String name,
    required String role,
    required String location,
    required String followers,
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
                  ),
                ),
                Text(
                  role,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.people_outline,
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '$followers Followers',
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(70, 36),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: const Text('Follow', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _jobCard(Map<String, dynamic> job) {
    final color = Color(job['color'] as int);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(job['logo'] as IconData, color: color, size: 24),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job['title'] as String,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      job['company'] as String,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.bookmark_border, color: Colors.grey, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 13,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                job['location'] as String,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                job['salary'] as String,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2563EB),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 12, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    job['experience'] as String,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.access_time_filled,
                    size: 12,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    job['time'] as String,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
