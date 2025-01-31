import 'package:flutter/material.dart';
import 'package:ma_voix_app/auth/services/authentication_service.dart';
import 'package:ma_voix_app/services/router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.currentRoute});

  final int currentRoute;

  void _onSelectTab(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, homePath);
        break;
      case 1:
        AuthenticationService.isUserConnected()
            ? Navigator.pushNamed(context, profilePath)
            : Navigator.pushNamed(context, loginPath);
        break;
    }
  }

  Widget _getNavigationBarIcon(
          BuildContext context, IconData icon, Color color, bool active) =>
      Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: active
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Icon(icon,
            color:
                active ? Colors.white : Theme.of(context).colorScheme.primary,
            size: 30),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.tertiary),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: _getNavigationBarIcon(
                context,
                Icons.home_outlined,
                Theme.of(context).colorScheme.primary,
                false,
              ),
              activeIcon: _getNavigationBarIcon(
                context,
                Icons.home_outlined,
                Colors.white,
                true,
              ),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: _getNavigationBarIcon(
                context,
                Icons.account_circle_outlined,
                Theme.of(context).colorScheme.primary,
                false,
              ),
              activeIcon: _getNavigationBarIcon(
                context,
                Icons.account_circle_outlined,
                Colors.white,
                true,
              ),
              label: 'Compte',
            ),
          ],
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: currentRoute,
          onTap: (int index) => _onSelectTab(context, index),
        ),
      ),
    );
  }
}
