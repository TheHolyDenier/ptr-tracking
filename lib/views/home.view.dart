import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ptr_tracker/store/game.dart';

import '../widgets/add-player-tab.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Paint the Roses track!'),
          actions: [
            IconButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => const AlertDialog(
                    content: AddPlayerTabWidget(),
                  ),
                ).then((_) => setState(() {}));
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Observer(
          builder: (_) => ListView.builder(
            itemCount: game.all.length,
            itemBuilder: (_, index) {
              print('página anterior ${game.all.length}');
              return game.all[index].playing
                  ? Text(game.all[index].color.name)
                  : Container();
            },
          ),
        ));
  }
}
