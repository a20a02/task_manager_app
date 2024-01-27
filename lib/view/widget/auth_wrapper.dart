import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../util/constant.dart';
import '../auth_view.dart';
import '../home_view.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return const AuthView();
          } else {
            return const HomeView();
          }
        }

        return const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
          color: kPrimaryColor,
        )));
      },
    );
  }
}
