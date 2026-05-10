import 'package:flutter/material.dart';
import 'chat_room_screen.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  final List<Map<String, String>> _chats = const [
    {
      'name': 'LinkedIn',
      'msg': 'Lorem Ipsum is simply dummy text...',
      'time': '9:00',
      'avatar': 'L',
      'color': '0xFF0A66C2',
    },
    {
      'name': 'Pinterest',
      'msg': 'Lorem Ipsum is simply dummy text...',
      'time': '9:05',
      'avatar': 'P',
      'color': '0xFFE60023',
    },
    {
      'name': 'Andrew chatk',
      'msg': 'Lorem Ipsum is simply dummy text...',
      'time': '14:00',
      'avatar': 'A',
      'color': '0xFF2563EB',
    },
    {
      'name': 'Solo lawrence',
      'msg': 'Lorem Ipsum is simply dummy text...',
      'time': '15:00',
      'avatar': 'S',
      'color': '0xFF10B981',
    },
    {
      'name': 'Plum phrase',
      'msg': 'Lorem Ipsum is simply dummy text...',
      'time': '16:00',
      'avatar': 'P',
      'color': '0xFF6366F1',
    },
    {
      'name': 'Facebook',
      'msg': 'Lorem Ipsum is simply dummy text...',
      'time': '17:00',
      'avatar': 'F',
      'color': '0xFF1877F2',
    },
  ];

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
                  const Text(
                    'Message',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.edit_outlined,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),

            // ── Chat List ──
            Expanded(
              child: ListView.separated(
                itemCount: _chats.length,
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                  indent: 76,
                  color: Color(0xFFEEEEEE),
                ),
                itemBuilder: (context, i) {
                  final chat = _chats[i];
                  final color = Color(int.parse(chat['color']!));
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatRoomScreen(name: chat['name']!),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: color.withOpacity(0.15),
                            child: Text(
                              chat['avatar']!,
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat['name']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  chat['msg']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            chat['time']!,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
