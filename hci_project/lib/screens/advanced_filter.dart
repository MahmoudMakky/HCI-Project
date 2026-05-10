import 'package:flutter/material.dart';
import 'search_results.dart';

class AdvancedFilterScreen extends StatefulWidget {
  const AdvancedFilterScreen({super.key});

  @override
  State<AdvancedFilterScreen> createState() => _AdvancedFilterScreenState();
}

class _AdvancedFilterScreenState extends State<AdvancedFilterScreen> {
  // Job Type
  String _jobType = 'On site';

  // Experience
  final Map<String, bool> _experience = {
    'No Experience': false,
    'Upto 1 Year': false,
    '2 - 3 Years': false,
    '3 - 5 Years': false,
    '7+ Years': false,
  };

  // Location
  final _locationController = TextEditingController(text: 'United I');

  final Map<String, bool> _locations = {
    'United States': true,
    'United Arab, Emirates': false,
    'United Kingdom': false,
  };

  // Job Category
  final Map<String, bool> _categories = {
    'Accounting & Finance': false,
    'Agriculture': false,
    'Architecture': false,
    'Arts & Crafts': false,
    'Content Writing': false,
    'Construction': false,
    'Designing': false,
    'Data Analyst': false,
    'Data Scientist': false,
    'Healthcare': false,
    'Hardware': false,
    'Media Reporting': false,
    'Sales & Marketing': false,
    'Information & Technology': false,
    'Social Media Marketing': false,
  };

  // Expanded sections
  final Map<String, bool> _expanded = {
    'Job Type': true,
    'Experience': true,
    'Location': true,
    'Salary Amount': false,
    'Job Category': true,
    'Job Level': false,
  };

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Filter',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1, color: Color(0xFFEEEEEE)),

            // ── Scrollable Content ──
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Job Type
                    _sectionHeader('Job Type'),

                    if (_expanded['Job Type']!) ...[
                      _radioOption(
                        'On site',
                        _jobType,
                        (val) => setState(() => _jobType = val!),
                      ),

                      _radioOption(
                        'Remote Job',
                        _jobType,
                        (val) => setState(() => _jobType = val!),
                      ),
                    ],

                    // Experience
                    _sectionHeader('Experience'),

                    if (_expanded['Experience']!) ...[
                      for (final key in _experience.keys)
                        _checkboxOption(
                          key,
                          _experience[key]!,
                          (val) => setState(() => _experience[key] = val!),
                        ),
                    ],

                    // Location
                    _sectionHeader('Location'),

                    if (_expanded['Location']!) ...[
                      const SizedBox(height: 8),

                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFDDE1E7),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 18,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      for (final key in _locations.keys)
                        _radioOption(
                          key,

                          // FIXED HERE
                          _locations.entries
                              .firstWhere(
                                (e) => e.value,
                                orElse: () => MapEntry('', false),
                              )
                              .key,

                          (val) {
                            setState(() {
                              for (final k in _locations.keys) {
                                _locations[k] = false;
                              }

                              _locations[key] = true;
                            });
                          },
                        ),
                    ],

                    // Salary Amount
                    _sectionHeader('Salary Amount'),

                    // Job Category
                    _sectionHeader('Job Category'),

                    if (_expanded['Job Category']!) ...[
                      for (final key in _categories.keys)
                        _checkboxOption(
                          key,
                          _categories[key]!,
                          (val) => setState(() => _categories[key] = val!),
                        ),
                    ],

                    // Job Level
                    _sectionHeader('Job Level'),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // ── Bottom Buttons ──
            const Divider(height: 1, color: Color(0xFFEEEEEE)),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _jobType = 'On site';

                          for (final k in _experience.keys) {
                            _experience[k] = false;
                          }

                          for (final k in _categories.keys) {
                            _categories[k] = false;
                          }
                        });
                      },

                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFDDE1E7)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: const Size(double.infinity, 52),
                      ),

                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SearchResultsScreen(),
                        ),
                      ),

                      child: const Text(
                        'Apply',
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
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    final expanded = _expanded[title] ?? false;

    return GestureDetector(
      onTap: () => setState(() => _expanded[title] = !expanded),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            Icon(
              expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioOption(
    String label,
    String groupValue,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),

      child: Row(
        children: [
          Radio<String>(
            value: label,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: const Color(0xFF2563EB),
          ),

          Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _checkboxOption(
    String label,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),

      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF2563EB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
