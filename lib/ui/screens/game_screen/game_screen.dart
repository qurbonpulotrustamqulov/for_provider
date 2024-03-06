import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'minus_game.dart';
import 'multiplay_game.dart';
import 'div_game.dart';
import 'plus_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> gameType = [
      "Yig'indi",
      "Ayirma",
      "Ko'paytma",
      "Bo'linma",
    ];
    List<Color> colors = const [
      Color(0xff4CAF50),
      Color(0xffE91E63),
      Color(0xffFFB800),
      Color(0xff079FE0),
    ];
    List<Widget> pages = [
      PlusGame(color: colors[0]),
      MinusGame(color: colors[1]),
      MultiplyGame(color: colors[2]),
      DivGame(color: colors[3])
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Matematik amalni tanlang",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color(0xff9D2BB1)),
        ),
      ),
      body: ListView.builder(
        itemCount: pages.length,
        padding: const EdgeInsets.all(25),
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => pages[index],
                  ));
            },
            child: Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: colors[index]),
              child: Text(
                gameType[index],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
