import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ptr_tracker/store/game.dart';

import '../utils/functions.utils.dart';

class AddPlayerTabWidget extends StatefulWidget {
  AddPlayerTabWidget({Key? key}) : super(key: key);

  @override
  State<AddPlayerTabWidget> createState() => _AddPlayerTabWidgetState();
}

class _AddPlayerTabWidgetState extends State<AddPlayerTabWidget> {
  final game = Game();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Observer(
      builder: (_) => Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var player in game.all)
              ListTile(
                leading: InkWell(
                    child:
                        Icon(player.icon, color: getPlayerColor(player.color)),
                    onTap: () {}),
                title: TextFormField(
                  initialValue: player.name,
                ),
                trailing: Checkbox(
                  onChanged: (_) => {setState(() => player.switchPlayStatus())},
                  value: player.playing,
                  activeColor: const Color(0xFF6200EE),
                ),
              ),
          ]),
    ));
  }
}
