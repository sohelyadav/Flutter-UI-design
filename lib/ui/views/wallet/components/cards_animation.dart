import 'package:flutter/material.dart';

class CardsAnimation {
  CardsAnimation(this.controller)
      : cardsScrollerXTranslation = new Tween(begin: 500.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              0.4,
              curve: Curves.ease,
            ),
          ),
        );
  final AnimationController controller;
  final Animation<double> cardsScrollerXTranslation;
}
