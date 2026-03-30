import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passenger_app/screens/auth/login_screen.dart';
import 'package:passenger_app/screens/home/home_screen.dart';
import 'package:passenger_app/services/auth_service.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        // User is logged in
        if (snapshot.hasData) {
          return const HomeScreen();
        }

        // User is logged out
        return const LoginScreen();
      },
    );
  }
}
