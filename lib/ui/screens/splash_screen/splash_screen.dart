import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_provider/core/constants/colors.dart';
import 'package:for_provider/core/constants/images.dart';
import 'package:for_provider/core/constants/strings.dart';
import 'package:for_provider/logic/providers/loading_provider.dart';
import 'package:for_provider/ui/screens/splash_screen/widgets/splash_clipper.dart';
import 'package:provider/provider.dart';

import '../game_screen/game_screen.dart';
import 'widgets/mini_design.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double sizeY = MediaQuery.of(context).size.height;
    double sizeX = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.oxffffffff,
      body: Stack(alignment: Alignment.topCenter, children: [
        ClipPath(
          clipper: SplashClipper(),
          child: Container(
              height: sizeY * 0.85 + 4,
              width: sizeX,
              color: CustomColors.oxffD0D0D0),
        ),
        ClipPath(
          clipper: SplashClipper(),
          child: Container(
            height: sizeY * 0.85,
            width: sizeX,
            padding: EdgeInsets.symmetric(
                horizontal: sizeX * 0.05, vertical: sizeY * 0.03),
            color: CustomColors.oxff079FE0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(CustomImages.imgMath),
                  const Text(
                    CustomStrings.osonMat,
                    style: TextStyle(
                        fontSize: 20,
                        color: CustomColors.oxffD0D0D0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  FutureBuilder(
                    builder: (context, _) {
                      return Container(
                        height: 18,
                        width: sizeX * 0.7,
                        decoration: BoxDecoration(
                            color: CustomColors.oxffffffff,
                            borderRadius: BorderRadius.circular(50)),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          margin: EdgeInsets.only(
                              right:
                                  context.watch<LoadingProvider>().isEnd == true
                                      ? 0
                                      : sizeX * 0.7),
                          decoration: BoxDecoration(
                              color: CustomColors.oxffFFB800,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      );
                    },
                    future: Future.delayed(
                        const Duration(seconds: 2),
                        () => context
                            .read<LoadingProvider>()
                            .changeIsEnd(canEnd: true)).whenComplete(() async {
                      Timer(const Duration(milliseconds: 2500), () {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const GameScreen(),
                            ));
                      });
                    }),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    CustomStrings.yuklanmoqda,
                    style: TextStyle(
                        color: CustomColors.oxffD0D0D0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Image(image: Image.asset(CustomImages.illustration).image)
                ]),
          ),
        ),
        MiniDesignElement(
          sizeX: sizeX,
          alignment: const Alignment(-0.8, 0.9),
          color: CustomColors.oxff4CAF50,
          element: "-",
        ),
        MiniDesignElement(
          sizeX: sizeX,
          alignment: const Alignment(0.8, 0.65),
          color: CustomColors.oxffFFB800,
          element: "+",
        ),
        const Align(
          alignment: Alignment(0, 0.95),
          child: Text(
            CustomStrings.version,
            style: TextStyle(
                color: CustomColors.oxffD0D0D0,
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
