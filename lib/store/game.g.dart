// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Game on _Game, Store {
  Computed<List<Player>>? _$playingComputed;

  @override
  List<Player> get playing => (_$playingComputed ??=
          Computed<List<Player>>(() => super.playing, name: '_Game.playing'))
      .value;
  Computed<List<Player>>? _$notPlayingComputed;

  @override
  List<Player> get notPlaying =>
      (_$notPlayingComputed ??= Computed<List<Player>>(() => super.notPlaying,
              name: '_Game.notPlaying'))
          .value;
  Computed<List<Player>>? _$allComputed;

  @override
  List<Player> get all => (_$allComputed ??=
          Computed<List<Player>>(() => super.all, name: '_Game.all'))
      .value;

  late final _$playersAtom = Atom(name: '_Game.players', context: context);

  @override
  Players get players {
    _$playersAtom.reportRead();
    return super.players;
  }

  @override
  set players(Players value) {
    _$playersAtom.reportWrite(value, super.players, () {
      super.players = value;
    });
  }

  late final _$_GameActionController =
      ActionController(name: '_Game', context: context);

  @override
  void addPlayer(PlayerColorEnum color, {String? name}) {
    final _$actionInfo =
        _$_GameActionController.startAction(name: '_Game.addPlayer');
    try {
      return super.addPlayer(color, name: name);
    } finally {
      _$_GameActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePlayer(PlayerColorEnum color, {String? name}) {
    final _$actionInfo =
        _$_GameActionController.startAction(name: '_Game.removePlayer');
    try {
      return super.removePlayer(color, name: name);
    } finally {
      _$_GameActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markAllPairs(PlayerColorEnum color,
      {required CardEnum card, required List<CardEnum> options}) {
    final _$actionInfo =
        _$_GameActionController.startAction(name: '_Game.markAllPairs');
    try {
      return super.markAllPairs(color, card: card, options: options);
    } finally {
      _$_GameActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchPair(PlayerColorEnum color, {required Pair pair}) {
    final _$actionInfo =
        _$_GameActionController.startAction(name: '_Game.switchPair');
    try {
      return super.switchPair(color, pair: pair);
    } finally {
      _$_GameActionController.endAction(_$actionInfo);
    }
  }

  @override
  void renamePlayer(PlayerColorEnum color, {String? name}) {
    final _$actionInfo =
        _$_GameActionController.startAction(name: '_Game.renamePlayer');
    try {
      return super.renamePlayer(color, name: name);
    } finally {
      _$_GameActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPlayer(PlayerColorEnum color) {
    final _$actionInfo =
        _$_GameActionController.startAction(name: '_Game.resetPlayer');
    try {
      return super.resetPlayer(color);
    } finally {
      _$_GameActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStatus(PlayerColorEnum color) {
    final _$actionInfo =
        _$_GameActionController.startAction(name: '_Game.changeStatus');
    try {
      return super.changeStatus(color);
    } finally {
      _$_GameActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
players: ${players},
playing: ${playing},
notPlaying: ${notPlaying},
all: ${all}
    ''';
  }
}
