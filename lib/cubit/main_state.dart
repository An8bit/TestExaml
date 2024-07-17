
 import '../enum/LoadStatus.dart';

class MainState {
  final LoadStatus loadStatus;
 
  MainState({required this.loadStatus});

 MainState.Init() : loadStatus = LoadStatus.Init;

  MainState copyWith({
    required LoadStatus loadStatus,
  }) {
    return MainState(
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MainState &&
      o.loadStatus == loadStatus;
  }

  @override
  int get hashCode => loadStatus.hashCode;

  @override
  String toString() => 'MainState(loadStatus: $loadStatus)';



 }


