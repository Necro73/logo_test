import 'package:flutter/material.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> with TickerProviderStateMixin {
  late List<AnimationController> controllerColorOpacityList = [];
  late List<Animation<double>> animationColorOpacityList = [];

  @override
  void initState() {
    for (int i = 0; i < 4; i++) {
      controllerColorOpacityList.add(AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
      ));
      controllerColorOpacityList[i].addListener(() => setState(() {}));
      animationColorOpacityList.add(CurvedAnimation(
        parent: controllerColorOpacityList[i],
        curve: Curves.linear,
      ));
    }
    controllerColorOpacityList.last.value = 1;
    playAnimation();
    super.initState();
  }

  Future<void> playAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    for (int i = 0; i < controllerColorOpacityList.length-1; i++) {
      await controllerColorOpacityList[i].animateTo(1);
    }
    await Future.delayed(const Duration(milliseconds: 1000));
    for (var controller in controllerColorOpacityList) {
      controller.animateTo(0);
    }
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
      color: const Color(0xFF1A1A18).withOpacity(animationColorOpacityList[3].value),
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
                'ХМЕЛЬНИЦКИЕ\nБУЛОЧНЫЕ',
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
