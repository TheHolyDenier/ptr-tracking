import 'package:flutter/material.dart';

import '../enums/player-color.enum.dart';
import '../utils/functions.utils.dart';
import '../widgets/sheet.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    const colors = PlayerColorEnum.values;

    return DefaultTabController(
      length: colors.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Paint the Roses track!'),
          bottom: TabBar(tabs: [
            for (var color in colors)
              Tab(icon: Icon(Icons.circle, color: getPlayerColor(color))),
          ]),
        ),
        body: TabBarView(
          children: [
            for (var color in colors)
              SingleChildScrollView(child: SheetWidget(color)),
          ],
        ),
      ),
    );
  }
}
