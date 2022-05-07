import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:ptr_tracker/enums/card.enum.dart';
import 'package:ptr_tracker/enums/player-color.enum.dart';

Color getColor(CardEnum element) {
  if (element == CardEnum.red) {
    return const Color.fromRGBO(195, 41, 20, 1);
  } else if (element == CardEnum.purple) {
    return const Color.fromRGBO(81, 29, 102, 1);
  } else if (element == CardEnum.yellow) {
    return const Color.fromRGBO(255, 182, 87, 1);
  } else if (element == CardEnum.pink) {
    return const Color.fromRGBO(236, 154, 163, 1);
  } else {
    return const Color.fromRGBO(44, 37, 38, 1);
  }
}

IconData getIcon(CardEnum element) {
  if (element == CardEnum.tiles) {
    return RpgAwesome.diamonds;
  } else if (element == CardEnum.heart) {
    return RpgAwesome.hearts;
  } else if (element == CardEnum.pikes) {
    return RpgAwesome.spades;
  } else if (element == CardEnum.clovers) {
    return RpgAwesome.clovers;
  } else {
    return Icons.spa;
  }
}

Color getPlayerColor(PlayerColorEnum color) {
  if (color == PlayerColorEnum.green) {
    return const Color.fromRGBO(183, 233, 193, 1);
  } else if (color == PlayerColorEnum.purple) {
    return const Color.fromRGBO(187, 120, 188, 1);
  } else if (color == PlayerColorEnum.blue) {
    return const Color.fromRGBO(183, 221, 237, 1);
  } else if (color == PlayerColorEnum.yellow) {
    return const Color.fromRGBO(243, 223, 95, 1);
  } else {
    return const Color.fromRGBO(252, 208, 218, 1);
  }
}
