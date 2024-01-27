import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widget/custom_backgound.dart';
import 'package:task_manager_app/view/sign_up_view.dart';

import 'widget/custom_auth_body.dart';
import 'widget/custom_button.dart';
import 'sign_in_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgoundWidget(
      child: Scaffold(
        body: CustomAuthBody(
          addedChildrenList: [
            CustomButton(
              onPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpView();
                    },
                  ),
                );
              },
              minWidth: double.infinity,
              height: 65,
              text: 'Sign Up',
            ),
            const SizedBox(height: 32),
            CustomButton(
              onPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignInView();
                    },
                  ),
                );
              },
              minWidth: double.infinity,
              height: 65,
              text: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }
}
