import 'package:flutter/material.dart';
import 'package:ptr_tracker/store/game.dart';
import 'package:ptr_tracker/widgets/add-player-tab.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final game = Game();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: game.playing.length >= 4
          ? game.playing.length
          : game.playing.length + 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Paint the Roses Tracker!'),
          backgroundColor: const Color(0xff5808e5),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              for (var tab in game.playing)
                Tab(text: 'DOGS', icon: Icon(tab.icon)),
              if (game.playing.length < 4) const Tab(icon: Icon(Icons.add)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (var tab in game.playing) Center(child: Text(tab.color.name)),
            if (game.playing.length < 4) AddPlayerTabWidget(),
          ],
        ),
      ),
    );
  }
}
