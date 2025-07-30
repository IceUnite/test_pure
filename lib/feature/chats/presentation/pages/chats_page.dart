import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_test/core/resources/vectors_path.dart';
import '../../../../core/resources/pictures_path.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typhography.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Column(
        children: [
          Container(height: 135, color: AppColors.lightGrey),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.barrier, width: 1.0),
                color: AppColors.backGround,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              child: Column(
                children: [
                  // Заголовок "Чаты"
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      children: [
                        Text('ЧАТЫ', style: AppTypography.font24Regular.copyWith(color: AppColors.white)),
                        Spacer(),
                        Text('OFF', style: AppTypography.font16Regular.copyWith(color: AppColors.white)),
                        SizedBox(width: 12),
                        Container(
                          width: 40,
                          height: 20,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.grey100),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5, top: 4.5, bottom: 3.5),
                            child: SvgPicture.asset(VectorsPaths.icIncognito),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      // padding: EdgeInsets.zero,
                      children: [
                        _buildChatItem(
                            message: '44 человека тебя лайкнули', image: PicturesPaths.imLike, isUnread: true),
                        _buildChatItem(
                          message: 'Отлично выглядишь',
                          image: PicturesPaths.imAvatar,
                          time: '23 ч 43 мин',
                        ),
                        _buildChatItem(
                            message: 'Встретимся? Я рядом',
                            image: PicturesPaths.imAvatar1,
                            time: '20 ч 40 мин',
                            isUnread: true
                        ),
                        _buildChatItem(message: 'Встретимся?', image: PicturesPaths.imAvatar2, time: '18 ч 40 мин'),
                        _buildChatItem(message: 'Давно тебя хочу', image: PicturesPaths.imAvatar3, time: '09 ч 40 мин'),
                        _buildChatItem(
                          message: 'Я в ванной... Скинь фото...',
                          image: PicturesPaths.imAvatar4,
                          time: '03 ч 04 мин',
                        ),
                        _buildChatItem(message: 'Привет', image: PicturesPaths.imAvatar5, time: '01 ч 09 мин'),
                      ],
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

  Widget _buildChatItem({required String message, required String image, String? time, bool? isUnread}) {
    return GestureDetector(
      onTap: () => _openChatBottomSheet(message),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage(image), radius: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style:
                    time != null
                        ? AppTypography.font16Regular.copyWith(color: AppColors.white)
                        : AppTypography.font16Bold.copyWith(color: AppColors.white),
                  ),
                  if (time != null) ...[
                    const SizedBox(height: 4),
                    Text(time, style: AppTypography.font12Light.copyWith(color: AppColors.lightGrey)),
                  ],
                ],
              ),
            ),
            isUnread == true ? Container(width: 4,
              height: 4,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColors.white),)
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  void _openChatBottomSheet(String message) {
    // Реализация открытия чата
  }
}
