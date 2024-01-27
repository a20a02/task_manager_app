import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/view/sign_in_view.dart';
import 'package:task_manager_app/view/widget/custom_button.dart';
import 'package:task_manager_app/view/widget/custom_row_text.dart';

import '../../controller/auth_cubit/auth_cubit.dart';
import '../../controller/auth_cubit/auth_state.dart';
import '../../util/function/navigator.dart';
import '../../util/function/show_toast.dart';
import '../home_view.dart';
import 'custom_auth_text_field.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          navigatorPushReplacement(screen: const HomeView(), context: context);
        } else if (state is SignupFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: AuthCubit().get(context).signupFormKey,
          child: Column(
            children: [
              CustomAuthTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required";
                  } else if (!value.contains('@')) {
                    return "Not Valid Email";
                  } else {
                    return null;
                  }
                },
                hintText: 'User Email',
                onChange: (email) {
                  AuthCubit().get(context).emailAddress = email;
                },
              ),
              const SizedBox(height: 32),
              CustomAuthTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required";
                  } else if (value.length < 8) {
                    return "The Password should be more than 8 char";
                  } else {
                    return null;
                  }
                },
                onChange: (password) {
                  AuthCubit().get(context).password = password;
                },
                hintText: 'Password',
              ),
              const SizedBox(height: 32),
              CustomAuthTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required";
                  } else if (value.length < 8) {
                    return "The Password should be more than 8 char";
                  } else if (value != AuthCubit().get(context).password) {
                    return "The Password should be the same";
                  } else {
                    return null;
                  }
                },
                onChange: (p0) {},
                hintText: 'Confirm Password',
              ),
              CustomRowText(
                text: 'Already have an account ?',
                onPressed: () {
                  navigatorPushReplacement(
                      screen: const SignInView(), context: context);
                },
              ),
              const SizedBox(height: 32),
              CustomButton(
                minWidth: 220,
                height: 50,
                text: 'Enter',
                onPress: () async {
                  if (AuthCubit()
                      .get(context)
                      .signupFormKey
                      .currentState!
                      .validate()) {
                    await AuthCubit().get(context).signUpWithEmailAndPassword();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
