import 'package:flutter/material.dart';
import 'package:ma_voix_app/services/router.dart';

import '../services/authentication_service.dart';
import '../validators.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = "";
  String _userPassword = "";
  bool _obscureText = true;
  bool _isLoading = false;

  Widget _getSignInButton(BuildContext ctx) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        textStyle: const TextStyle(fontSize: 20, color: Colors.white));

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        child: _isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                'Connexion'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            setState(() {
              _isLoading = true;
            });

            bool isConnected =
                await AuthenticationService.signInWithEmailAndPassword(
                    email: _userEmail.trim(), password: _userPassword.trim());

            if (!isConnected) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text("Login failed, Please try again."),
                backgroundColor: Theme.of(context).colorScheme.error,
              ));

              setState(() {
                _isLoading = false;
              });

              return;
            }

            Navigator.popAndPushNamed(context, homePath);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textFormFieldHintStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.6));

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: emailValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Adresse email",
              hintStyle: textFormFieldHintStyle,
            ),
            onSaved: (value) {
              _userEmail = value!;
            },
          ),
          const SizedBox(height: 16),

          // Password Field
          TextFormField(
            obscureText: _obscureText,
            validator: passwordValidator.call,
            decoration: InputDecoration(
              hintText: "Mot de passe",
              hintStyle: textFormFieldHintStyle,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: Color(0xFF868686))
                    : const Icon(Icons.visibility, color: Color(0xFF868686)),
              ),
            ),
            onSaved: (value) {
              _userPassword = value!;
            },
          ),
          const SizedBox(height: 16),

          // Forget Password
          /*
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ForgotPasswordScreen(),
              ),
            ),
            child: Text(
              "Forget Password?",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 16),
          */

          // Sign In Button
          _getSignInButton(context),
        ],
      ),
    );
  }
}
