import 'package:flutter/material.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Recent Request', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                  GestureDetector(
                    onTap: () {},
                    child: const Text('View all', style: TextStyle(fontSize: 13, color: Color(0xFF2563EB))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80, height: 80,
                      decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(20)),
                      child: const Icon(Icons.people_outline, size: 40, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    const Text('No Connection Request', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}