import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  // ✅ Reusable function to generate chat bubbles
  Widget getChatBubble({
    required Alignment alignment,
    required String message,
    bool isImage = false,
    bool isSender = false,
  }) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isSender ? const Radius.circular(12) : Radius.zero,
            bottomRight: isSender ? Radius.zero : const Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            if (isImage)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.network(
                  "https://shorturl.at/PkTiO",
                  height: 120,
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
      appBar: AppBar(
        title: const Text("Welcome back!"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print("Logout pressed");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // 🟦 Flexible ListView for chat messages
          Expanded(
            flex: 1,
            child: ListView(
              padding: const EdgeInsets.only(top: 16),
              children: [
                getChatBubble(
                  alignment: Alignment.centerLeft,
                  message: "Hi there! 👋",
                  isSender: false,
                ),
                getChatBubble(
                  alignment: Alignment.centerRight,
                  message: "Hello! How are you?",
                  isSender: true,
                ),
                getChatBubble(
                  alignment: Alignment.centerLeft,
                  message: "I’m good, thanks!",
                  isSender: false,
                ),
                getChatBubble(
                  alignment: Alignment.centerRight,
                  message: "Check out this image 👇",
                  isSender: true,
                  isImage: true,
                ),
                getChatBubble(
                  alignment: Alignment.centerLeft,
                  message: "Wow, that’s cool!",
                  isSender: false,
                ),
              ],
            ),
          ),
          // ⬛ Fixed input bar
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
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
                  onPressed: () {
                    print("Send clicked");
                  },
                  icon: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
