import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ptr_tracker/store/game.dart';

import '../widgets/add-player-tab.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Paint the Roses track!'),
        ),
        body: Observer(
          builder: (context) => Column(
            children: [
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: game.playing.length,
                  itemBuilder: (_, index) =>
                      Text(game.playing[index].color.name),
                ),
              ),
              const AddPlayerTabWidget(),
            ],
          ),
        ));
  }
}
