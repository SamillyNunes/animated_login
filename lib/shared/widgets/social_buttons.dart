import 'package:animated_login/core/app_images.dart';
import 'package:flutter/material.dart';

/// Linha com botões de redes sociais
class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(AppImages.facebook),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(AppImages.linkedin),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(AppImages.twitter),
        ),
      ],
    );
  }
}
