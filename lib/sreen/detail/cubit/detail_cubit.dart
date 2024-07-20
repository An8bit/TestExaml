import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testmobile/sreen/detail/cubit/detail_state.dart';

import '../../../api/api.dart';
import '../../../enum/LoadStatus.dart';

class DetailCubit extends Cubit<DetailState> {
  final Api api;
  DetailCubit(this.api) : super(DetailState.Init());

  Future<void> getDetailGame(int id) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
       var data = await api.getDetailGame(id);
      if (data.id != null) {
        emit(state.copyWith(loadStatus: LoadStatus.Done, game: data));
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.Error));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }
}
