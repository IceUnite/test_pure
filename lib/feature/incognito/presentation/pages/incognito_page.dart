import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resources/vectors_path.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typhography.dart';

class IncognitoPage extends StatelessWidget {
  const IncognitoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 21),
          child: SvgPicture.asset(VectorsPaths.icIncognitoLarge, width: 174, height: 68),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Center(
            child: Text('РЕЖИМ ИНКОГНИТО НА 24 ЧАСА', style: AppTypography.font16Bold.copyWith(color: AppColors.white)),
          ),
        ),

        // Основное содержимое с фиксированной высотой
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6, // Уменьшаем высоту
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Стань невидимкой в ленте и чатах, скрой объявление и наслаждайся <Space> незамеченным',
                  style: AppTypography.font14Regular.copyWith(color: AppColors.grey200),
                ),
                const SizedBox(height: 24),

                // Карточки тарифов
                _buildPlanCards(),
                const SizedBox(height: 24),

                // Кнопка покупки
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purpleLight,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text('Купить', style: AppTypography.font16Regular.copyWith(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),

        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 16), // Фиксированный отступ 16
          child: Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'УСЛОВИЯ И ПОЛОЖЕНИЯ',
                style: AppTypography.font16Regular.copyWith(
                  color: AppColors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlanCards() {
    return Row(
      children: [
        Expanded(child: _buildPlanCard('1', '99 ₽')),
        const SizedBox(width: 12),
        Expanded(child: _buildPlanCard('3', '199 ₽')),
        const SizedBox(width: 12),
        Expanded(child: _buildPlanCard('7', '399 ₽')),
      ],
    );
  }

  Widget _buildPlanCard(String hearts, String price) {
    return Card(
      color: AppColors.backGround,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.barrier, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(hearts, style: AppTypography.font18Bold.copyWith(color: AppColors.white)),
                const SizedBox(width: 7),
                SvgPicture.asset(VectorsPaths.icIncognito),
              ],
            ),
            const SizedBox(height: 8),
            Text(price, style: TextStyle(fontSize: 16, color: AppColors.white)),
          ],
        ),
      ),
    );
  }
}
