import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testmobile/sreen/sort/cubit/sort_state.dart';

import '../../../api/api.dart';
import '../../../enum/LoadStatus.dart';



class SortCubit extends Cubit<SortState> {
  final Api api;
  SortCubit(this.api) : super(SortState.Init());
 void getGamePlatform() async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      final data = await api.getPlatformGame("pc");
      emit(state.copyWith(loadStatus: LoadStatus.Done, gameplatform: data));
    } catch (e) {
      print(e);
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  } 

  void getNewGame() async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      final data = await api.getNewGame();
      emit(state.copyWith(loadStatus: LoadStatus.Done, gamenews: data));
    } catch (e) {
      print(e);
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }
}
