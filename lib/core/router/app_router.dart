import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../feature/chat/presentation/pages/chat_page.dart';
import '../../feature/chats/presentation/pages/chats_page.dart';
import '../../feature/incognito/presentation/pages/incognito_page.dart';
import '../../feature/profile/presentation/pages/profile_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/chats', // Указываем начальный маршрут
    routes: [
      // Главный экран с bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          // Чаты
          StatefulShellBranch(routes: [GoRoute(path: '/chats', builder: (context, state) => const ChatsPage())]),
          // Лента
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/feed',
                builder: (context, state) => const Placeholder(), // Заглушка
              ),
            ],
          ),
          // Сообщения
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/messages',
                builder: (context, state) => const Placeholder(), // Заглушка
              ),
            ],
          ),
          // Профиль
          StatefulShellBranch(routes: [GoRoute(path: '/profile', builder: (context, state) => const ProfilePage())]),
        ],
      ),

      // Другие экраны
      GoRoute(path: '/incognito', builder: (context, state) => const IncognitoPage()),
    ],
    errorBuilder:
        (context, state) => Scaffold(
          // Обработка ошибок маршрутизации
          body: Center(child: Text('Страница не найдена: ${state.uri.toString()}')),
        ),
  );
}

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, spreadRadius: 2)],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) => _onTap(context, index),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 10,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline),
                activeIcon: Icon(Icons.chat_bubble),
                label: 'Чаты',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: 'Лента',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined),
                activeIcon: Icon(Icons.email),
                label: 'Сообщения',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Профиль',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }
}
