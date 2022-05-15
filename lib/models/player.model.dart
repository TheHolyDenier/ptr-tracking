import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ptr_tracker/enums/card.enum.dart';
import 'package:ptr_tracker/enums/player-color.enum.dart';
import 'package:ptr_tracker/models/pair.model.dart';

import '../enums/sheet.enum.dart';

class Player {
  @observable
  PlayerColorEnum color;

  @observable
  String? name;

  @observable
  IconData icon = Icons.circle;

  @observable
  ObservableList<Pair> marked = ObservableList<Pair>();

  @observable
  bool playing = false;

  @observable
  SheetEnum sheet = SheetEnum.medium;

  Player(this.color);

  @action
  void newGame(SheetEnum sheet) {
    marked.clear();
    this.sheet = sheet;
  }

  @action
  bool existsInList(Pair pair) {
    return _findPairIndex(pair) != -1;
  }

  @action
  void switchPlayStatus() {
    playing = !playing;
  }

  @action
  void switchPair(Pair pair) {
    existsInList(pair) ? _removePair(pair) : _addPair(pair);
  }

  @action
  void markAllPairs(CardEnum card, List<CardEnum> options) {
    for (var value in options) {
      final pair = Pair(card, value);
      if (!existsInList(pair)) {
        _addPair(pair);
      }
    }
  }

  @action
  void _addPair(Pair pair) {
    marked.add(pair);
  }

  @action
  void _removePair(Pair pair) {
    marked.removeAt(_findPairIndex(pair));
  }

  @action
  int _findPairIndex(Pair pair) {
    return marked.indexWhere((storedPair) =>
        (storedPair.a == pair.a && storedPair.b == pair.b) ||
        (storedPair.b == pair.a && storedPair.a == pair.b));
  }

  @action
  void rename({String? name}) {
    this.name = name;
  }
}
