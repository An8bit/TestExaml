
 import 'package:testmobile/enum/LoadStatus.dart';
import 'package:testmobile/model/game.dart';
import 'package:testmobile/model/gamedetail.dart';
import 'package:testmobile/model/product.dart';

class DetailState {
  final LoadStatus loadStatus;
  final GameDetail game;
  
 
  DetailState({required this.loadStatus, required this.game});

  DetailState copyWith({LoadStatus? loadStatus, GameDetail? game}) {
    return DetailState(
      loadStatus: loadStatus ?? this.loadStatus,
      game: game ?? this.game,
    );
  }

   DetailState.Init()
      : loadStatus = LoadStatus.Init,
        game = GameDetail(id: null, title: 'non', thumbnail: '', releaseDate: '', status:'', description: '');

  @override
  String toString() {
    return 'DetailState{loadStatus: $loadStatus, game: $game}';
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DetailState &&
      other.loadStatus == loadStatus &&
      other.game == game;
  }

  @override
  int get hashCode => loadStatus.hashCode ^ game.hashCode;

 
  
 }

