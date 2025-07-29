import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String? initialMessage;

  const ChatPage({
    super.key,
    this.initialMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF121212), // Тёмный фон
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // История сообщений
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (initialMessage != null)
                  _buildMessage(initialMessage!, false),
                _buildMessage('Привет! Как дела?', true),
                _buildMessage('Отлично выглядишь!', false),
                _buildMessage('Давно тебя хочу', false),
                _buildMessage('Встретимся?', false),
              ],
            ),
          ),
          // Поле ввода сообщения
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF4CAF50) : const Color(0xFF333333),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF4CAF50), width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Сообщение...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF4CAF50)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}