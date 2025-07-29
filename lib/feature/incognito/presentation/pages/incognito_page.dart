import 'package:flutter/material.dart';

class IncognitoPage extends StatelessWidget {
  const IncognitoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Режим инкогнито'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Режим инкогнито на 24 часа',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Связь невидимкой в ленте и чатах, скрой объявление и наслаждайся «Space» незамеченным',
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPlanCard('1 ♡♡', '99 ₽'),
                _buildPlanCard('3 ♡♡', '199 ₽'),
                _buildPlanCard('7 ♡♡', '399 ₽'),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Купить'),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Условия и положения',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(String hearts, String price) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(hearts, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}