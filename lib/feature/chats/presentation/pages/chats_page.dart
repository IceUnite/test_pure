import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/resources/pictures_path.dart';
import '../../../../core/resources/vectors_path.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typhography.dart';
import '../../../incognito/presentation/pages/incognito_page.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.topGrey,
      body: Column(
        children: [
          // Верхний серый блок (уменьшенная высота)
          Container(
            height: 100, // Уменьшил высоту
            color: AppColors.topGrey,
          ),

          // Основной контент с заголовком
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.barrier, width: 1.0),
                color: AppColors.backGround,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)),
              ),
              child: Column(
                children: [
                  // Перенесенный заголовочный Row
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: [
                        Text(
                          'ЧАТЫ',
                          style: AppTypography.font24Regular.copyWith(color: AppColors.white),
                        ),
                        const Spacer(),
                        Text(
                          'OFF',
                          style: AppTypography.font16Regular.copyWith(color: AppColors.white),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () => _showIncognitoBottomSheet(context),
                          child: Container(
                            width: 40,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.grey100,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4.5),
                              child: SvgPicture.asset(VectorsPaths.icIncognito),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Список чатов
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: _chatItems.length,
                      itemBuilder: (context, index) => _ChatListItem(
                        item: _chatItems[index],
                        onTap: () => _openChatScreen(context, _chatItems[index].message, _chatItems[index].image),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showIncognitoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.grey100.withOpacity(0.3),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: AppColors.darkPurple,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: const IncognitoPage(),
        ),
      ),
    );
  }

  void _openChatScreen(BuildContext context, String message, String image) {
    context.push(
      '/chat',
      extra: {
        'initialMessage': message,
        'chatImage': image, // Передаем путь к картинке
      },
    );
  }
}

// Модель данных для чатов
class ChatItem {
  final String message;
  final String image;
  final String? time;
  final bool isUnread;

  ChatItem({
    required this.message,
    required this.image,
    this.time,
    this.isUnread = false,
  });
}

// Виджет элемента списка чатов
class _ChatListItem extends StatelessWidget {
  final ChatItem item;
  final VoidCallback onTap;

  const _ChatListItem({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(item.image),
              radius: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.message,
                    style: item.time != null
                        ? AppTypography.font16Regular.copyWith(color: AppColors.white)
                        : AppTypography.font16Bold.copyWith(color: AppColors.white),
                  ),
                  if (item.time != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.time!,
                      style: AppTypography.font12Light.copyWith(color: AppColors.lightGrey),
                    ),
                  ],
                ],
              ),
            ),
            if (item.isUnread)
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final List<ChatItem> _chatItems = [
  ChatItem(
    message: '44 человека тебя лайкнули',
    image: PicturesPaths.imLike,
    isUnread: true,
  ),
  ChatItem(
    message: 'Отлично выглядишь',
    image: PicturesPaths.imAvatar,
    time: '23 ч 43 мин',
  ),
  ChatItem(
    message: 'Встретимся? Я рядом',
    image: PicturesPaths.imAvatar1,
    time: '20 ч 40 мин',
    isUnread: true,
  ),
  ChatItem(
    message: 'Встретимся?',
    image: PicturesPaths.imAvatar2,
    time: '18 ч 40 мин',
  ),
  ChatItem(
    message: 'Давно тебя хочу',
    image: PicturesPaths.imAvatar3,
    time: '09 ч 40 мин',
  ),
  ChatItem(
    message: 'Я в ванной... Скинь фото...',
    image: PicturesPaths.imAvatar4,
    time: '03 ч 04 мин',
  ),
  ChatItem(
    message: 'Привет',
    image: PicturesPaths.imAvatar5,
    time: '01 ч 09 мин',
  ),
];