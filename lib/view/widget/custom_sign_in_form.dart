import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/util/function/show_toast.dart';
import 'package:task_manager_app/view/sign_up_view.dart';
import 'package:task_manager_app/view/widget/custom_button.dart';
import 'package:task_manager_app/view/widget/custom_row_text.dart';
import '../../controller/auth_cubit/auth_cubit.dart';
import '../../controller/auth_cubit/auth_state.dart';
import '../../util/function/navigator.dart';
import '../home_view.dart';
import 'custom_auth_text_field.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          navigatorPushReplacement(screen: const HomeView(), context: context);
        } else if (state is SigninFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: AuthCubit().get(context).signinFormKey,
          child: Column(
            children: [
              CustomAuthTextFormField(
                hintText: 'User Email',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required";
                  } else if (value.contains('@')) {
                    return "Not Valid Email";
                  } else {
                    return null;
                  }
                },
                onChange: (email) {
                  AuthCubit().get(context).emailAddress = email;
                },
              ),
              const SizedBox(height: 32),
              CustomAuthTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required";
                  } else if (value.length <= 8) {
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
              CustomRowText(
                text: 'Dont have an account ?',
                onPressed: () {
                  navigatorPushReplacement(
                      screen: const SignUpView(), context: context);
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
                      .signinFormKey
                      .currentState!
                      .validate()) {
                    await AuthCubit().get(context).sigInWithEmailAndPassword();
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
