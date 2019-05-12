import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: [
              emailField(),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              submitButton(),
            ])));
  }
}

Widget emailField() {
  return TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: 'you@example.com',
      labelText: 'Email Address',
    ),
  );
}

Widget passwordField() {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
      hintText: 'Password',
      labelText: 'Password'
    )
  );
}

Widget submitButton() {
  return RaisedButton(
    child: Text('Login'),
    color: Colors.blue,
    onPressed: (){
      print('hello');
    },
  );
}