import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_provider/logic/providers/plus_provider.dart';
import 'package:provider/provider.dart';

class MinusGame extends StatefulWidget {
  final Color color;

  const MinusGame({super.key, required this.color});

  @override
  State<MinusGame> createState() => _PlusGameState();
}

class _PlusGameState extends State<MinusGame> {
  @override
  Widget build(BuildContext context) {
    int first = Random().nextInt(100);
    int second = Random().nextInt(100);
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: widget.color,
        title: const Text(
          "Ayirsh amalini bajaring",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          AnimatedContainer(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: context.watch<PlusProvider>().isTrue2 == false
                    ? widget.color
                    : context.watch<PlusProvider>().isTrue == false
                    ? Colors.red.withOpacity(0.6)
                    : Colors.green,
                borderRadius: BorderRadius.circular(12)),
            duration: const Duration(milliseconds: 500),
            child: Center(
              child: context.watch<PlusProvider>().isTrue2 == false
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${first> second? first:second} - ${first<second? first:second} = ?",
                    style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 65,
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      controller: controller,
                      style: TextStyle(
                          height: 0.8,
                          fontSize: 45,
                          color: widget.color,
                          fontWeight: FontWeight.bold),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  )
                ],
              )
                  : Text(
                context.watch<PlusProvider>().isTrue == true
                    ? "Togri"
                    : "Xato",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blue,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              onPressed: () {
                if (controller.text.isNotEmpty &&
                    int.parse(controller.text) == (first - second).abs()) {
                  context.read<PlusProvider>().addResult(true);
                } else {
                  context.read<PlusProvider>().addResult(false);
                }
                context.read<PlusProvider>().addStart();

                Future.delayed(
                  const Duration(milliseconds: 1200),
                      () {
                    context.read<PlusProvider>().addStart();
                    setState(() {});
                  },
                );
              },
              child: const Text(
                "Keyingisi",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          Center(child: Image.asset("assets/images/for_bot.png"),)
        ],
      ),
    );
  }
}
