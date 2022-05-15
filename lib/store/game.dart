import 'package:mobx/mobx.dart';
import 'package:ptr_tracker/models/player.model.dart';
import 'package:ptr_tracker/models/players.model.dart';

import '../enums/card.enum.dart';
import '../enums/player-color.enum.dart';
import '../enums/sheet.enum.dart';
import '../models/pair.model.dart';

// Include generated file
part 'game.g.dart';

// This is the class used by rest of your codebase
class Game = _Game with _$Game;

// The store-class
abstract class _Game with Store {
  @observable
  Players players = Players();

  @computed
  ObservableList<Player> get all => ObservableList.of(players.get());

  @action
  void addPlayer(PlayerColorEnum color, {String? name}) {
    players.find(color).playing = true;
  }

  @action
  void removePlayer(PlayerColorEnum color, {String? name}) {
    players.find(color).playing = false;
  }

  @action
  void markAllPairs(PlayerColorEnum color,
      {required CardEnum card, required List<CardEnum> options}) {
    players.find(color).markAllPairs(card, options);
  }

  @action
  void switchPair(PlayerColorEnum color, {required Pair pair}) {
    players.find(color).switchPair(pair);
  }

  @action
  void renamePlayer(PlayerColorEnum color, {String? name}) {
    players.find(color).rename(name: name);
  }

  @action
  void resetPlayer(PlayerColorEnum color) {
    players.find(color).marked.clear();
  }

  @action
  void changeStatus(PlayerColorEnum color) {
    players.find(color).switchPlayStatus();
  }

  @action
  void newGame(PlayerColorEnum color, {SheetEnum sheet = SheetEnum.medium}) {
    players.find(color).newGame(sheet);
  }
}
