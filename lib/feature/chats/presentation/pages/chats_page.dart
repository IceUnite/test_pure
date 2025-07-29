import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../chat/presentation/pages/chat_page.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Чаты')),
      body: ListView(
        children: [ListTile(title: const Text('44 человека тебя лайкнули'), onTap: () {}), ..._buildChatItems(context)],
      ),
    );
  }

  List<Widget> _buildChatItems(BuildContext context) {
    return [
      _buildChatItem(context, '23 ч 43 мин', 'Отлично выглядишь'),
      _buildChatItem(context, '29 ч 40 мин', 'Встретимся? Я рядом'),
      _buildChatItem(context, '18 ч 40 мин', 'Встретимся?'),
      _buildChatItem(context, '09 ч 40 мин', 'Давно тебя хочу'),
      _buildChatItem(context, '03 ч 04 мин', 'Я в ванной... Скинь фото...'),
      _buildChatItem(context, '01 ч 09 мин', 'Привет'),
    ];
  }

  Widget _buildChatItem(BuildContext context, String time, String message) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(message),
      subtitle: Text(time),
      onTap: () => _openChatBottomSheet(context, message),
    );
  }

  void _openChatBottomSheet(BuildContext context, String message) {
    final mediaQuery = MediaQuery.of(context);
    final fullHeight = mediaQuery.size.height;
    final topOffset = 135.0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(top: topOffset),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: ChatPage(initialMessage: message),
          ),
        );
      },
    );
  }
}
