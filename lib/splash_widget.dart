import 'package:flutter/material.dart';
import 'package:logo_test/main_bottom_navigation_bar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late List<AnimationController> controllerColorOpacityList = [];
  late List<Animation<double>> animationColorOpacityList = [];

  @override
  void initState() {
    for (int i = 0; i < 3; i++) {
      controllerColorOpacityList.add(AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
      ));
      animationColorOpacityList.add(CurvedAnimation(
        parent: controllerColorOpacityList[i],
        curve: Curves.linear,
      ));
    }
    controllerColorOpacityList[2].addListener(() => setState(() {}));
    playAnimation();
    super.initState();
  }

  Future<void> playAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    for (int i = 0; i < controllerColorOpacityList.length; i++) {
      await controllerColorOpacityList[i].animateTo(1);
    }
    if (mounted) {
      Navigator.of(context).pushReplacement(_createRoute());
    }
  }

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => const MainBottomNavigationBar(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const Offset begin = Offset(0.0, 1.0);
        const Offset end = Offset.zero;

        final Tween<Offset> tween = Tween(begin: begin, end: end);
        final Animation<double> curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.linear,
        );

        return FadeTransition(
          opacity: curvedAnimation,
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    for (var controller in controllerColorOpacityList) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1A1A18),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 4),
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/logo_part_1.png',
                    opacity: animationColorOpacityList[0],
                  ),
                  Image.asset(
                    'assets/images/logo_part_2.png',
                    opacity: animationColorOpacityList[1],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Тестовый\nТекст',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFFFFFFF).withOpacity(animationColorOpacityList[2].value),
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}