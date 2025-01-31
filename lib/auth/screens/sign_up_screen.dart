import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ma_voix_app/design_system/components/buttons/social_button.dart';
import 'package:ma_voix_app/design_system/widgets/body.dart';
import 'package:ma_voix_app/projects/widgets/header_app_bar.dart';

import '../components/sign_up_form.dart';
import '../components/welcome_text.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double defaultPadding = 16;

    Center kOrText = Center(
        child: Text("OU",
            style: TextStyle(
                color:
                    Theme.of(context).colorScheme.primary.withOpacity(0.7))));

    return Scaffold(
      appBar: const HeaderAppBar(title: 'S\'inscrire'),
      body: Body(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WelcomeText(
                  title: "Créer un compte",
                  text:
                      "Entrez votre nom, adresse e-mail et mot de passe \npour vous inscrire. Profitez :)",
                ),
                const SignUpForm(),
                const SizedBox(height: defaultPadding),

                // Already have account
                Center(
                  child: Text.rich(
                    TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w500),
                      text: "Vous avez déjà un compte ? ",
                      children: <TextSpan>[
                        TextSpan(
                          text: "Connexion",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                kOrText,
                const SizedBox(height: defaultPadding),

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
                const SizedBox(height: defaultPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
