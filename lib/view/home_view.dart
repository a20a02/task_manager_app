import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/view/widget/custom_backgound.dart';
import 'package:task_manager_app/view/widget/custom_task_builder.dart';
import 'widget/custom_appbar.dart';
import 'widget/custom_float_action_button.dart';
import 'widget/custom_search_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgoundWidget(
      child: Scaffold(
        floatingActionButton: const CustomFloatActionButton(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomAppBar(
                  onPress: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  icon: Icons.login_outlined,
                  text: 'Welcome',
                ),
                const CustomSearchButton(),
                const CustomTaskBuilder()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
