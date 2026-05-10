import 'package:flutter/material.dart';
import 'graduation_details.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _flatController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _postalCodeController.dispose();
    _landmarkController.dispose();
    _flatController.dispose();
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
                'Personal Info',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Divider(color: Color(0xFFDDE1E7)),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: _inputDecoration('Name', Icons.person_outline),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration(
                  'Mobile Number',
                  Icons.phone_outlined,
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration(
                  'Email Address',
                  Icons.email_outlined,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration('Age', Icons.person_outline),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _genderController,
                      decoration: _inputDecoration(
                        'Gender',
                        Icons.male_outlined,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const Text(
                'Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Divider(color: Color(0xFFDDE1E7)),
              const SizedBox(height: 16),
              TextField(
                controller: _postalCodeController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration(
                  'Postal Code',
                  Icons.location_on_outlined,
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _landmarkController,
                decoration: _inputDecoration(
                  'Landmark, Locality, Place...',
                  Icons.map_outlined,
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _flatController,
                decoration: _inputDecoration(
                  'Flat no, Street name, Area na...',
                  Icons.home_outlined,
                ),
              ),
              const SizedBox(height: 32),
              // Button — no style, inherits from main.dart
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GraduationDetailsScreen(),
                    ),
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GraduationDetailsScreen(),
                    ),
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
