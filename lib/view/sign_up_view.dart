import 'package:flutter/material.dart';

import 'package:task_manager_app/view/widget/custom_auth_body.dart';
import 'package:task_manager_app/view/widget/custom_backgound.dart';
import 'package:task_manager_app/view/widget/custom_sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBackgoundWidget(
      child: Scaffold(
        body: CustomAuthBody(
          addedChildrenList: [
            CustomSignUpForm(),
          ],
        ),
      ),
    );
  }
}
