import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../resources/vectors_path.dart';

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
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF191818),
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 10,
          items: [
             BottomNavigationBarItem(
              icon: SvgPicture.asset(VectorsPaths.icMenu, color: Color(0xFF7446AC)),
              activeIcon: SvgPicture.asset(VectorsPaths.icMenu, color: Color(0xFFF2C94C)),
              label: '',
            ),
             BottomNavigationBarItem(
              icon: SvgPicture.asset(VectorsPaths.icMessage, color: Color(0xFF7446AC)),
              activeIcon: SvgPicture.asset(VectorsPaths.icMessage, color: Color(0xFFF2C94C)),
              label: '',
            ),
             BottomNavigationBarItem(
              icon: SvgPicture.asset(VectorsPaths.icLike, color: Color(0xFF7446AC)),
              activeIcon: SvgPicture.asset(VectorsPaths.icLike, color: Color(0xFFF2C94C)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(VectorsPaths.icSettings, color: Color(0xFF7446AC)),
              activeIcon: SvgPicture.asset(VectorsPaths.icSettings, color: Color(0xFFF2C94C)),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }
}