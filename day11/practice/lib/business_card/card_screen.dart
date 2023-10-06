import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:practice/business_card/front_view.dart';

import 'back_view.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.FRONT, // The side to initially display.
      front: FrontView(),
      back: BackView(),
    );
  }
}
