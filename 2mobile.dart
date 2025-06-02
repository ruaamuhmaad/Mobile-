import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  // ✅ قائمة الرسائل (بيانات وهمية)
  final List<Map<String, dynamic>> messages = const [
    {"message": "Hello!", "isSender": false},
    {"message": "Hi! How are you?", "isSender": true},
    {"message": "I'm good, thanks! What about you?", "isSender": false},
    {"message": "Great! Ready for class?", "isSender": true},
    {"message": "Yes, let’s go!", "isSender": false},
  ];

  // ✅ دالة لعرض فقاعة الدردشة
  Widget getChatBubble({
    required Alignment alignment,
    required String message,
    required bool isSender,
  }) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey[700],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isSender ? 12 : 0),
            bottomRight: Radius.circular(isSender ? 0 : 12),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CAP Chat"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ✅ قائمة الرسائل الديناميكية
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return getChatBubble(
                  alignment: msg['isSender']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  message: msg['message'],
                  isSender: msg['isSender'],
                );
              },
            ),
          ),

          // ✅ صندوق الإرسال السفلي
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.white,
                  onPressed: () {
                    // لا يوجد إرسال فعلي في هذا المثال
                    print("Send clicked");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
