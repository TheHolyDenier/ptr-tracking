import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../enums/player-color.enum.dart';
import '../store/game.dart';
import '../utils/functions.utils.dart';
import 'hard-sheet.widget.dart';
import 'medium-sheet.widget.dart';

class SheetWidget extends StatefulWidget {
  final PlayerColorEnum color;
  const SheetWidget(this.color, {Key? key}) : super(key: key);

  @override
  State<SheetWidget> createState() => _SheetWidgetState();
}

class _SheetWidgetState extends State<SheetWidget> {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    final player = game.players.find(widget.color);
    return Observer(
      builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(player.icon, color: getPlayerColor(player.color)),
                const SizedBox(width: 10.0),
                Text(player.name ?? 'Player ${player.color.name}',
                    style: Theme.of(context).textTheme.headline5),
              ]),
            ),
            if (!player.hard) MediumSheetWidget(widget.color),
            if (player.hard) HardSheetWidget(widget.color),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        game.newGame(widget.color);
                      });
                    },
                    child: const Text('MEDIUM SHEET'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        game.newGame(widget.color, hard: true);
                      });
                    },
                    child: const Text('HARD SHEET'),
                  )
                ],
              ),
            )
          ]),
    );
  }
}
