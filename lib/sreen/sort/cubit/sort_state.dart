


 import 'package:testmobile/enum/LoadStatus.dart';
import 'package:testmobile/model/gamenews.dart';

import '../../../model/game.dart';

class SortState {
  final LoadStatus loadStatus;
  final List<Game> gameplatform;
  final List<GameNews> gamenews;

  SortState({required this.loadStatus, required this.gameplatform, required this.gamenews});

  SortState copyWith({LoadStatus? loadStatus, List<Game>? gameplatform, List<GameNews>? gamenews}) {
    return SortState(
      loadStatus: loadStatus ?? this.loadStatus,
      gameplatform: gameplatform ?? this.gameplatform,
      gamenews: gamenews ?? this.gamenews,
    );
  }

   SortState.Init()
      : loadStatus = LoadStatus.Init,
        gameplatform = [],
        gamenews = [];

  @override
  String toString() {
    return 'SortState{loadStatus: $loadStatus, gameplatform: $gameplatform, gamenews: $gamenews}';
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SortState &&
      other.loadStatus == loadStatus &&
      other.gameplatform == gameplatform &&
      other.gamenews == gamenews;
  }

  @override
  int get hashCode => loadStatus.hashCode ^ gameplatform.hashCode ^ gamenews.hashCode;
  
 


 }


