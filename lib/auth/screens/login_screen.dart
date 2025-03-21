import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ma_voix_app/design_system/components/buttons/social_button.dart';
import 'package:ma_voix_app/design_system/widgets/body.dart';
import 'package:ma_voix_app/design_system/widgets/header_app_bar.dart';
import 'package:ma_voix_app/routes/app_routes.dart';

import '../components/sign_in_form.dart';
import '../components/welcome_text.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Center kOrText = Center(
        child: Text("OU",
            style: TextStyle(
                color:
                    Theme.of(context).colorScheme.primary.withOpacity(0.7))));

    var primaryColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      appBar: const HeaderAppBar(title: 'Connexion'),
      body: Body(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WelcomeText(
                  title: "Bienvenue",
                  text:
                      "Entrez votre adresse e-mail \npour vous connecter. Bon votes :)",
                ),
                const SignInForm(),
                const SizedBox(height: 16),

                Center(
                  child: Text.rich(
                    TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                      text: "Vous n'avez pas de compte ? ",
                      children: <TextSpan>[
                        TextSpan(
                          text: "Créer un nouveau compte.",
                          style: TextStyle(color: primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                Navigator.pushNamed(context, AppRoutes.signup),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                kOrText,
                const SizedBox(height: 16),

                // Facebook
                SocialButton(
                  press: () {},
                  text: "Se connecter avec Facebook",
                  color: const Color(0xFF395998),
                  icon: SvgPicture.asset(
                    'assets/icons/facebook.svg',
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF395998),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Google
                SocialButton(
                  press: () {},
                  text: "Se connecter avec Google",
                  color: const Color(0xFF4285F4),
                  icon: SvgPicture.asset(
                    'assets/icons/google.svg',
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
