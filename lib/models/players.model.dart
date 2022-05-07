import 'package:mobx/mobx.dart';
import 'package:ptr_tracker/enums/player-color.enum.dart';
import 'package:ptr_tracker/models/player.model.dart';

class Players {
  @observable
  Player green = Player(PlayerColorEnum.green);
  @observable
  Player purple = Player(PlayerColorEnum.purple);
  @observable
  Player blue = Player(PlayerColorEnum.blue);
  @observable
  Player yellow = Player(PlayerColorEnum.yellow);
  @observable
  Player pink = Player(PlayerColorEnum.pink);

  @computed
  List<Player> get() => [green, purple, blue, yellow, pink];

  @action
  Player find(PlayerColorEnum color) {
    if (color == PlayerColorEnum.green) {
      return green;
    } else if (color == PlayerColorEnum.purple) {
      return purple;
    } else if (color == PlayerColorEnum.blue) {
      return blue;
    } else if (color == PlayerColorEnum.yellow) {
      return yellow;
    } else {
      return pink;
    }
  }
}
