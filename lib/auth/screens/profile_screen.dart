import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ma_voix_app/design_system/widgets/body.dart';
import 'package:ma_voix_app/design_system/widgets/bottom_nav_bar.dart';
import 'package:ma_voix_app/design_system/widgets/header_app_bar.dart';
import 'package:ma_voix_app/auth/services/authentication_service.dart';
import 'package:ma_voix_app/screens/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  final User _user = AuthenticationService.currentUser()!;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToHomeScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomeView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  Widget _getAvatar() => _user.photoURL != null
      ? ClipOval(
          child: Material(
            color: Colors.white,
            child: Image.network(
              _user.photoURL!,
              fit: BoxFit.fitHeight,
            ),
          ),
        )
      : ClipOval(
          child: Material(
            color: Theme.of(context).colorScheme.primary,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),
        );

  Widget _getSignoutButton() {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        textStyle: const TextStyle(fontSize: 20, color: Colors.white));

    return ElevatedButton(
      style: style,
      onPressed: () async {
        setState(() {
          _isSigningOut = true;
        });

        await AuthenticationService.signOut();

        setState(() {
          _isSigningOut = false;
        });
        Navigator.of(context).pushReplacement(_routeToHomeScreen());
      },
      child: Text(
        'Déconnexion',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.white),
      ),
    );
  }

  Widget _progressIndicator() => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).colorScheme.secondary),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderAppBar(),
      body: Body(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getAvatar(),
                const SizedBox(height: 16.0),
                Text(
                  'Hello',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  _user.displayName!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 26,
                  ),
                ),
                Text(
                  '(${_user.email!})',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 24.0),
                _isSigningOut ? _progressIndicator() : _getSignoutButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentRoute: 1),
    );
  }
}
