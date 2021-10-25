import 'dart:math';

import 'package:animated_login/constants.dart';
import 'package:animated_login/core/app_colors.dart';
import 'package:animated_login/core/app_vectors.dart';
import 'package:animated_login/shared/widgets/login_form.dart';
import 'package:animated_login/shared/widgets/sign_up_form.dart';
import 'package:animated_login/shared/widgets/social_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  bool _showSignUp = false;

  late AnimationController _animationController;
  late Animation<double> _textRotateAnimation;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);

    _textRotateAnimation =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      _showSignUp = !_showSignUp;
    });
    _showSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Stack(
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
                  child: AnimatedSwitcher(
                    duration: defaultDuration,
                    child: SvgPicture.asset(
                      AppVectors.animatedLogo,
                      color:
                          _showSignUp ? AppColors.signupBg : AppColors.loginBg,
                    ),
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
              // Texto do login
              AnimatedPositioned(
                duration: defaultDuration,
                // altura/2 = metade da tela
                bottom:
                    _showSignUp ? _size.height / 2 - 80 : _size.height * 0.3,
                left: _showSignUp
                    ? 0
                    : _size.width * 0.44 -
                        80, //44%=88%/2 -> -80: tamanho da palavra é 160, então 160/2
                child: AnimatedDefaultTextStyle(
                  duration: defaultDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _showSignUp ? 20 : 32,
                    fontWeight: FontWeight.bold,
                    color: _showSignUp ? Colors.white : Colors.white70,
                  ),
                  child: Transform.rotate(
                    angle: -_textRotateAnimation.value * pi / 180,
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: updateView,
                      child: Container(
                        width: 160,
                        padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75,
                        ),
                        // color: Colors.red,
                        child: const Text(
                          "LOG IN",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Texto do cadastrar
              AnimatedPositioned(
                duration: defaultDuration,
                // altura/2 = metade da tela -80 -> menos a metade do container do texto
                bottom:
                    !_showSignUp ? _size.height / 2 - 80 : _size.height * 0.3,
                //44%=88%/2 -> -80: tamanho da palavra é 160, então 160/2
                right: !_showSignUp ? 0 : _size.width * 0.44 - 80,
                child: AnimatedDefaultTextStyle(
                  duration: defaultDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: !_showSignUp ? 20 : 32,
                    fontWeight: FontWeight.bold,
                    color: !_showSignUp ? Colors.white : Colors.white70,
                  ),
                  child: Transform.rotate(
                    angle: (90 - _textRotateAnimation.value) * pi / 180,
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: updateView,
                      child: Container(
                        width: 160,
                        padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75,
                        ),
                        // color: Colors.red,
                        child: const Text(
                          "SIGN UP",
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
