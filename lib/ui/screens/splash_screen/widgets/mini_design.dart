import 'dart:math';

import 'package:flutter/material.dart';
import 'package:for_provider/core/constants/colors.dart';

class MiniDesignElement extends StatelessWidget {
  const MiniDesignElement({
    super.key,
    required this.sizeX,
    required this.color,
    required this.element,
    required this.alignment
  });

  final double sizeX;
  final Color color;
  final String element;
  final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Transform.rotate(

        angle: pi/4,
        child: Container(
          height: sizeX * 0.12,
          width: sizeX * 0.12,
          alignment: Alignment.center,
          decoration:  BoxDecoration(
            color: color,
            boxShadow: [const BoxShadow(color: CustomColors.oxffD0D0D0, blurRadius: 4, spreadRadius: 2, offset: Offset(2, 0))],
          ),
          child: Transform.rotate(
            angle: -pi/4,
            child: Text(
              element,
              style: const TextStyle(color: CustomColors.oxffffffff, fontSize: 45, height: -0.1),
            ),
          ),
        ),
      ),
    );
  }
}
