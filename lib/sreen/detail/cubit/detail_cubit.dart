import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testmobile/sreen/detail/cubit/detail_state.dart';

import '../../../api/api.dart';
import '../../../enum/LoadStatus.dart';


class DetailCubit extends Cubit<DetailState> {
  final Api api;
  DetailCubit(this.api) : super(DetailState.Init());


Future<void> deleteProduct(String id) async{
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      final data = await api.deleteProduct(id);
      if(data == true){

       emit(state.copyWith(loadStatus: LoadStatus.Done ));
      }else{
        emit(state.copyWith(loadStatus: LoadStatus.Error));
      }
      
    } catch (e) {
      print(e);
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  } 
 
 Future<void> getProduct(int id) async{
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      final data = await api.getProduct(id);
      emit(state.copyWith(loadStatus: LoadStatus.Done,product: data));
    } catch (e) {
      print(e);
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

}


