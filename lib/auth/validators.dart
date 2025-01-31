// Validator
import 'package:form_field_validator/form_field_validator.dart';

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'L\'email est requis'),
  EmailValidator(errorText: 'Saisir une adresse email valide')
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Le mot de passe est requis'),
  MinLengthValidator(8,
      errorText: 'Le mot de passe doit être composé d\'au moins 8 chiffres'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-/])',
      errorText:
          'Les mots de passe doivent contenir au moins un caractère spécial')
]);

final requiredValidator =
    RequiredValidator(errorText: 'Ce champ est obligatoire');

final matchValidator =
    MatchValidator(errorText: 'les mots de passe ne correspondent pas');

final phoneNumberValidator = MinLengthValidator(10,
    errorText: 'Le numéro de téléphone doit comporter au moins 10 chiffres.');
