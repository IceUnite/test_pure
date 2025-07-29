import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:pure_test/core/router/scaffold_with_nav_bar.dart';
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


