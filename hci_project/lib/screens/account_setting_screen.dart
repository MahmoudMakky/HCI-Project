import 'package:flutter/material.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  final _nameController = TextEditingController(text: 'Omar Zakaria');
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _flatController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose(); _emailController.dispose();
    _mobileController.dispose(); _dobController.dispose();
    _genderController.dispose(); _pincodeController.dispose();
    _landmarkController.dispose(); _flatController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      prefixIcon: Icon(icon, color: Colors.grey, size: 20),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFDDE1E7), width: 1.5)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFDDE1E7), width: 1.5)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Back + Title ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back, size: 20, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Account Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                    ],
                  ),
                ),
              ),

              // ── Avatar ──
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(radius: 44, backgroundColor: const Color(0xFFEEF2FF), child: const Icon(Icons.person, size: 48, color: Color(0xFF2563EB))),
                    Container(
                      width: 26, height: 26,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2563EB)),
                      child: const Icon(Icons.edit, color: Colors.white, size: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Center(child: Text('Omar Zakaria', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
              const Center(child: Text('CSC Backend · Instructor Net', style: TextStyle(fontSize: 12, color: Colors.grey))),
              const SizedBox(height: 24),

              // ── Personal Info ──
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Personal Info', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
              ),
              const SizedBox(height: 4),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider(color: Color(0xFFDDE1E7))),
              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(controller: _nameController, decoration: _inputDecoration('Omar Zakaria', Icons.person_outline)),
                    const SizedBox(height: 12),
                    TextField(controller: _emailController, keyboardType: TextInputType.emailAddress, decoration: _inputDecoration('Email address', Icons.email_outlined)),
                    const SizedBox(height: 12),
                    TextField(controller: _mobileController, keyboardType: TextInputType.phone, decoration: _inputDecoration('Mobile Number', Icons.phone_outlined)),
                    const SizedBox(height: 12),
                    TextField(controller: _dobController, decoration: _inputDecoration('Date of Birth', Icons.calendar_today_outlined)),
                    const SizedBox(height: 12),
                    TextField(controller: _genderController, decoration: _inputDecoration('Gender', Icons.person_2_outlined)),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Address ──
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Address', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
              ),
              const SizedBox(height: 4),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider(color: Color(0xFFDDE1E7))),
              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(controller: _pincodeController, decoration: _inputDecoration('Pincode', Icons.location_on_outlined)),
                    const SizedBox(height: 12),
                    TextField(controller: _landmarkController, decoration: _inputDecoration('Landmark, Locality, Place...', Icons.map_outlined)),
                    const SizedBox(height: 12),
                    TextField(controller: _flatController, decoration: _inputDecoration('Flat no, Street name, Area na...', Icons.home_outlined)),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Save', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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