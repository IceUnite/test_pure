import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:pure_test/core/router/scaffold_with_nav_bar.dart';
import '../../feature/chat/presentation/pages/chat_page.dart';
import '../../feature/chats/presentation/pages/chats_page.dart';
import '../../feature/incognito/presentation/pages/incognito_page.dart';
import '../../feature/profile/presentation/pages/profile_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/chats',
    routes: [
      // Основные экраны с нижней навигацией
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/feed',
                builder: (context, state) => const Placeholder(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/chats',
                builder: (context, state) => const ChatsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/messages',
                builder: (context, state) => const Placeholder(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),

      // Отдельные экраны БЕЗ нижней навигации
      GoRoute(
        path: '/incognito',
        builder: (context, state) => const IncognitoPage(),
      ),
      GoRoute(
        path: '/chat',
        pageBuilder: (context, state) {
          final args = state.extra as Map<String, dynamic>?;
          return MaterialPage(
            child: Scaffold(
              body: ChatPage(
                initialMessage: args?['initialMessage'],
                chatImage: args?['chatImage'] ?? '',
              ),
            ),
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Страница не найдена: ${state.uri.toString()}')),
    ),
  );
}