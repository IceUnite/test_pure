import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/resources/pictures_path.dart';
import '../../../../core/resources/vectors_path.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typhography.dart';

class ChatPage extends StatelessWidget {
  final String? initialMessage;
  final String chatImage;

  const ChatPage({super.key, this.initialMessage, required this.chatImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.topGrey,
      body: Column(
        children: [
          // Верхняя панель с полоской соблазнов
          Container(
            height: 135,
            color: AppColors.topGrey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 12),
                  child: Row(
                    children: [
                      // Оберните IconButton в Material для улучшения области нажатия
                      Material(
                        type: MaterialType.transparency,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => GoRouter.of(context).pop(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      CircleAvatar(backgroundImage: AssetImage(chatImage), radius: 20),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: 40,
                  color: AppColors.purple,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(PicturesPaths.imFlame),
                      const SizedBox(width: 8),
                      Text('2 общих соблазна', style: AppTypography.font14Medium.copyWith(color: Colors.white)),
                      Spacer(),
                      SvgPicture.asset(VectorsPaths.icCross),
                      SizedBox(width: 11,),

                    ],
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          // Основное содержимое чата
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.barrier, width: 1.0),
                color: AppColors.backGround,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 51),
                  Expanded(
                    child: Text('Начни общение', style: AppTypography.font12Light.copyWith(color: AppColors.grey100)),
                  ),
                  _buildMessageInput(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Иконка плюса (слева, вне обводки)
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(VectorsPaths.icPlus),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            iconSize: 24,
          ),
          const SizedBox(width: 8),

          // Текстовое поле и иконка жабы в обводке
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.grey100, width: 1),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Сообщение...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        isDense: true,
                      ),
                    ),
                  ),
                  // Иконка жабы внутри обводки
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(VectorsPaths.icJaba),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 24,
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Иконка микрофона (справа, вне обводки)
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(VectorsPaths.icMicro),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}
