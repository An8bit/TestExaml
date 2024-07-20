
 import 'package:testmobile/model/game.dart';
import 'package:testmobile/model/product.dart';
import 'package:testmobile/model/student.dart';

import '../enum/LoadStatus.dart';

class MainState {
  final LoadStatus loadStatus;
  final List<Game> products;
 
  MainState({required this.loadStatus, required this.products});

  MainState copyWith({LoadStatus? loadStatus, List<Game>? products}) {
    return MainState(
      loadStatus: loadStatus ?? this.loadStatus,
      products: products ?? this.products,
    );
  }

   MainState.Init()
      : loadStatus = LoadStatus.Init,
        products = [];
  
 @override
  String toString() {
    return 'MainState{loadStatus: $loadStatus, products: $products}';
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MainState &&
      other.loadStatus == loadStatus &&
      other.products == products;
  }
  @override
  int get hashCode => loadStatus.hashCode ^ products.hashCode;

 }


