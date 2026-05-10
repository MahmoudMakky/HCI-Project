import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _mentionController = TextEditingController();
  final _tagsController = TextEditingController();
  bool _allowConnections = true;
  bool _visibleToAll = true;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _mentionController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      filled: true,
      fillColor: const Color(0xFFF8F9FA),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFDDE1E7), width: 1.5)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFDDE1E7), width: 1.5)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5)),
    );
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Create New Post', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.black, size: 22),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Post Title
                    const Text('Post Title', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87)),
                    const SizedBox(height: 8),
                    TextField(controller: _titleController, decoration: _inputDecoration('Ex. What is trending now...')),
                    const SizedBox(height: 16),

                    // Description
                    const Text('Description', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Write about what you think...',
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                        filled: true,
                        fillColor: const Color(0xFFF8F9FA),
                        contentPadding: const EdgeInsets.all(14),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFDDE1E7), width: 1.5)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFDDE1E7), width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Mention
                    const Text('Mention', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87)),
                    const SizedBox(height: 8),
                    TextField(controller: _mentionController, decoration: _inputDecoration('@michel')),
                    const SizedBox(height: 16),

                    // Tags
                    const Text('Tags', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87)),
                    const SizedBox(height: 8),
                    TextField(controller: _tagsController, decoration: _inputDecoration('#Graphic_design #Digital marketing')),
                    const SizedBox(height: 20),

                    // Add Media
                    const Text('Add Media ( Optional )', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87)),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFDDE1E7), width: 1.5),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_file_outlined, color: Color(0xFF2563EB), size: 28),
                            SizedBox(height: 6),
                            Text('Upload Files', style: TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.w500, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Allow connections toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Allow your connection to Repost', style: TextStyle(fontSize: 13, color: Colors.black87)),
                        Switch(
                          value: _allowConnections,
                          onChanged: (val) => setState(() => _allowConnections = val),
                          activeColor: const Color(0xFF2563EB),
                        ),
                      ],
                    ),

                    // Visible to all toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Visible to all', style: TextStyle(fontSize: 13, color: Colors.black87)),
                        Switch(
                          value: _visibleToAll,
                          onChanged: (val) => setState(() => _visibleToAll = val),
                          activeColor: const Color(0xFF2563EB),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFFDDE1E7)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              minimumSize: const Size(double.infinity, 52),
                            ),
                            child: const Text('Save as Draft', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Post', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
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