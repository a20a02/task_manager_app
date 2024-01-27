import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../util/constant.dart';

class CustomAuthBody extends StatelessWidget {
  const CustomAuthBody({
    super.key,
    required this.addedChildrenList,
  });

  final List<Widget> addedChildrenList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                svgImage,
                height: MediaQuery.of(context).size.width * 0.35,
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome,',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 32),
              ...addedChildrenList,
            ],
          ),
        ),
      ),
    );
  }
}
