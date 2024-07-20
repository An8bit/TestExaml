import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testmobile/api/api.dart';
import 'package:testmobile/cubit/main_state.dart';
import 'package:testmobile/enum/LoadStatus.dart';



class MainCubit extends Cubit<MainState> {
  final Api api;
  MainCubit(this.api) : super(MainState.Init());
  
  Future<void> getListGame() async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      final data = await api.getListGame();
      emit(state.copyWith(loadStatus: LoadStatus.Done,products: data));
    } catch (e) {
      print(e);
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  } 

}
