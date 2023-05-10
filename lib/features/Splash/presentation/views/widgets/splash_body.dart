import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    fadeInAnimationMethod();
    navigateTo();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff100B20), Color(0xff100B20)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipOval(
            child: FadeTransition(
              opacity: fadeAnimation,
              child: Image.asset(
                AssetsData.logo,
                width: 120,
                height: 120,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FadeTransition(
            opacity: fadeAnimation,
            child: const Text(
              'Read free Books',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void fadeInAnimationMethod() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  void navigateTo() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push('/homeView');
      },
    );
  }
}
