import 'package:animated_login/core/app_colors.dart';
import 'package:animated_login/core/app_vectors.dart';
import 'package:animated_login/shared/widgets/login_form.dart';
import 'package:animated_login/shared/widgets/sign_up_form.dart';
import 'package:animated_login/shared/widgets/social_buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // login form
          Positioned(
            width: _size.width * 0.88,
            height: _size.height,
            left: -_size.width * 0.76,
            child: Container(
              color: AppColors.loginBg,
              child: const LoginForm(),
            ),
          ),
          // sign up button
          Positioned(
            height: _size.height,
            width: _size.width * 0.88,
            left: _size.width * 0.12,
            child: Container(
              color: AppColors.signupBg,
              child: const SignUpForm(),
            ),
          ),
          Positioned(
            left: 0,
            right: _size.width * 0.06,
            top: _size.height * 0.1,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white60,
              child: SvgPicture.asset(
                AppVectors.animatedLogo,
              ),
            ),
          ),
          Positioned(
            width: _size.width,
            bottom: _size.height * 0.1,
            right: _size.width * 0.06,
            child: const SocialButtons(),
          ),
        ],
      ),
    );
  }
}
