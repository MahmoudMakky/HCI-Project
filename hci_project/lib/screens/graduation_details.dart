import 'package:flutter/material.dart';
import 'package:hci_project/screens/home_screen.dart';
import 'add_project.dart';

class GraduationDetailsScreen extends StatefulWidget {
  const GraduationDetailsScreen({super.key});

  @override
  State<GraduationDetailsScreen> createState() =>
      _GraduationDetailsScreenState();
}

class _GraduationDetailsScreenState extends State<GraduationDetailsScreen> {
  String? _selectedUniversity;
  final _collegeController = TextEditingController();
  final _graduationYearController = TextEditingController();
  final List<String> _universities = [
    'Cairo University',
    'Ain Shams University',
    'Alexandria University',
    'American University in Cairo',
    'Other',
  ];
  final List<Map<String, TextEditingController>> _extraEntries = [];

  @override
  void dispose() {
    _collegeController.dispose();
    _graduationYearController.dispose();
    for (final entry in _extraEntries) {
      entry.values.forEach((c) => c.dispose());
    }
    super.dispose();
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      prefixIcon: Icon(icon, color: Colors.grey, size: 20),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFDDE1E7), width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFDDE1E7), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
      ),
    );
  }

  Widget _universityDropdown({
    String? value,
    ValueChanged<String?>? onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDDE1E7), width: 1.5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint: const Text(
            'Select University',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          items: _universities
              .map((u) => DropdownMenuItem(value: u, child: Text(u)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, size: 20, color: Colors.black),
                    SizedBox(width: 4),
                    Text(
                      'Back',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Education',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Divider(color: Color(0xFFDDE1E7)),
              const SizedBox(height: 16),
              const Text(
                'Enter Details',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              _universityDropdown(
                value: _selectedUniversity,
                onChanged: (val) => setState(() => _selectedUniversity = val),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _collegeController,
                decoration: _inputDecoration(
                  'College Name',
                  Icons.school_outlined,
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _graduationYearController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration(
                  'Graduation Year',
                  Icons.calendar_today_outlined,
                ),
              ),
              for (final entry in _extraEntries) ...[
                const SizedBox(height: 24),
                const Divider(color: Color(0xFFDDE1E7)),
                const SizedBox(height: 14),
                _universityDropdown(),
                const SizedBox(height: 14),
                TextField(
                  controller: entry['college'],
                  decoration: _inputDecoration(
                    'College Name',
                    Icons.school_outlined,
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: entry['year'],
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration(
                    'Graduation Year',
                    Icons.calendar_today_outlined,
                  ),
                ),
              ],
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => setState(
                  () => _extraEntries.add({
                    'university': TextEditingController(),
                    'college': TextEditingController(),
                    'year': TextEditingController(),
                  }),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Color(0xFF2563EB), size: 20),
                    SizedBox(width: 6),
                    Text(
                      'Add More Details',
                      style: TextStyle(
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Button — no style, inherits from main.dart
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddProjectScreen()),
                  ),
                  child: const Text(
                    'Save & Continue',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
                  ),
                  child: const Text(
                    'Skip For Now',
                    style: TextStyle(
                      color: Color(0xFF2563EB),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
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
}
