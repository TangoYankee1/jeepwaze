import 'package:flutter/material.dart';
import 'package:passenger_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  bool _isLogin = true; // To toggle between Login and Register

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isLogin ? 'Login' : 'Register')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (val) =>
                    val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: Text(_isLogin ? 'Sign In' : 'Register'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result;
                    if (_isLogin) {
                      result = await _authService.signInWithEmailAndPassword(
                        email,
                        password,
                      );
                    } else {
                      result = await _authService.registerWithEmailAndPassword(
                        email,
                        password,
                      );
                    }
                    if (result == null) {
                      setState(() => error = 'Please supply a valid email');
                    }
                  }
                },
              ),
              TextButton(
                child: Text(
                  _isLogin
                      ? 'Need an account? Register'
                      : 'Have an account? Sign In',
                ),
                onPressed: () {
                  setState(() => _isLogin = !_isLogin);
                },
              ),
              const SizedBox(height: 12.0),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
