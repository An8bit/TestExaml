import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testmobile/api/api.dart';
import 'package:testmobile/cubit/main_state.dart';
import 'package:testmobile/enum/LoadStatus.dart';



class MainCubit extends Cubit<MainState> {
  final Api api;
  MainCubit(this.api) : super(MainState.Init());
  
  Future<void> getData() async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      final data = await api.get("api/WWAdmin/ListUser");
      emit(state.copyWith(loadStatus: LoadStatus.Done,student: data));
    } catch (e) {
      print(e);
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  } 

}
