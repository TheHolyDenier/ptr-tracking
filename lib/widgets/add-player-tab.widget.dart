import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptr_tracker/models/player.model.dart';
import 'package:ptr_tracker/store/game.dart';

import '../utils/functions.utils.dart';

class AddPlayerTabWidget extends StatefulWidget {
  const AddPlayerTabWidget({Key? key}) : super(key: key);

  @override
  State<AddPlayerTabWidget> createState() => _AddPlayerTabWidgetState();
}

class _AddPlayerTabWidgetState extends State<AddPlayerTabWidget> {
  late List<Player?> selectedPlayers;
  final List<TextEditingController> _controllers = [];

  @override
  void dispose() {
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);

    for (int i = 0; i < game.all.length; i++) {
      _controllers.add(TextEditingController(text: game.all[i].name));
    }

    return Column(mainAxisSize: MainAxisSize.min, children: [
      for (var i = 0; i < game.all.length; i++)
        ListTile(
          leading:
              Icon(game.all[i].icon, color: getPlayerColor(game.all[i].color)),
          title: TextFormField(
            controller: _controllers[i],
            maxLength: 20,
            decoration: const InputDecoration(labelText: 'Name'),
            onChanged: (String value) {
              setState(() {
                game.renamePlayer(game.all[i].color, name: value);
              });
            },
          ),
          trailing: Checkbox(
            onChanged: (_) {
              setState(() {
                game.changeStatus(game.all[i].color);
              });
            },
            value: game.all[i].playing,
          ),
        ),
    ]);
  }
}
