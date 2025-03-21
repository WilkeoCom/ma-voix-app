import 'package:flutter/material.dart';
import 'package:ma_voix_app/auth/services/authentication_service.dart';
import 'package:ma_voix_app/routes/app_routes.dart';

import '../validators.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _userEmail = "";
  String _userPassword = "";
  bool _obscureText = true;
  bool _isLoading = false;

  Widget _getSignUpButton() {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                "S'inscrire".toUpperCase(),
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
                await AuthenticationService.registerWithEmailAndPassword(
                    name: _name.trim(),
                    email: _userEmail.trim(),
                    password: _userPassword.trim());

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

            Navigator.popAndPushNamed(context, AppRoutes.home);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyTextColor = Color(0xFF868686);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name Field
          TextFormField(
            validator: requiredValidator.call,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: "Nom"),
            onSaved: (value) {
              _name = value!;
            },
          ),
          const SizedBox(height: 16),

          TextFormField(
            validator: emailValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Adresse email"),
            onSaved: (value) {
              _userEmail = value!;
            },
          ),
          const SizedBox(height: 16),

          // Password Field
          TextFormField(
            obscureText: _obscureText,
            validator: passwordValidator.call,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: "Mot de passe",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: bodyTextColor)
                    : const Icon(Icons.visibility, color: bodyTextColor),
              ),
            ),
            onSaved: (value) {
              _userPassword = value!;
            },
          ),
          const SizedBox(height: 16),

          // Sign Up Button
          _getSignUpButton(),
        ],
      ),
    );
  }
}
