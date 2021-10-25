import 'package:animated_login/constants.dart';
import 'package:animated_login/core/app_colors.dart';
import 'package:animated_login/core/app_vectors.dart';
import 'package:animated_login/shared/widgets/login_form.dart';
import 'package:animated_login/shared/widgets/sign_up_form.dart';
import 'package:animated_login/shared/widgets/social_buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _showSignUp = false;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // login form
          AnimatedPositioned(
            duration: defaultDuration,
            width: _size.width * 0.88,
            height: _size.height,
            left: _showSignUp ? -_size.width * 0.76 : 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _showSignUp = !_showSignUp;
                });
              },
              child: Container(
                color: AppColors.loginBg,
                child: const LoginForm(),
              ),
            ),
          ),
          // sign up button
          AnimatedPositioned(
            duration: defaultDuration,
            height: _size.height,
            width: _size.width * 0.88,
            left: _showSignUp ? _size.width * 0.12 : _size.width * 0.88,
            child: Container(
              color: AppColors.signupBg,
              child: const SignUpForm(),
            ),
          ),
          AnimatedPositioned(
            duration: defaultDuration,
            left: 0,
            right: _showSignUp ? -_size.width * 0.06 : _size.width * 0.06,
            top: _size.height * 0.1,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white60,
              child: SvgPicture.asset(
                AppVectors.animatedLogo,
                color: _showSignUp ? AppColors.signupBg : AppColors.loginBg,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: defaultDuration,
            width: _size.width,
            bottom: _size.height * 0.1,
            right: _showSignUp ? -_size.width * 0.06 : _size.width * 0.06,
            child: const SocialButtons(),
          ),
        ],
      ),
    );
  }
}
