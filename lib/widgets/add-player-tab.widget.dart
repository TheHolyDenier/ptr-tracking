import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ptr_tracker/models/player.model.dart';
import 'package:ptr_tracker/store/game.dart';

import '../utils/functions.utils.dart';

class AddPlayerTabWidget extends StatefulWidget {
  const AddPlayerTabWidget({Key? key}) : super(key: key);

  @override
  State<AddPlayerTabWidget> createState() => _AddPlayerTabWidgetState();
}

class _AddPlayerTabWidgetState extends State<AddPlayerTabWidget> {
  final game = Game();
  Player? selectedPlayer;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListTile(
        leading: selectedPlayer != null
            ? Icon(selectedPlayer!.icon,
                color: getPlayerColor(selectedPlayer!.color))
            : null,
        title: DropdownButton(
            value: selectedPlayer,
            items: [...game.notPlaying]
                .map<DropdownMenuItem<Player>>((Player value) {
              return DropdownMenuItem<Player>(
                  value: value, child: Text(value.name ?? value.color.name));
            }).toList(),
            onChanged: (Player? value) {
              setState(
                () {
                  selectedPlayer = value;
                },
              );
            }),
      ),
    );
  }
}
