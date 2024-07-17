
 import 'package:testmobile/model/product.dart';
import 'package:testmobile/model/student.dart';

import '../enum/LoadStatus.dart';

class MainState {
  final LoadStatus loadStatus;
  final List<Product> products;
 
  MainState({required this.loadStatus, required this.products});

  MainState copyWith({LoadStatus? loadStatus, List<Product>? products}) {
    return MainState(
      loadStatus: loadStatus ?? this.loadStatus,
      products: products ?? this.products,
    );
  }

  factory MainState.Init() {
    return MainState(loadStatus: LoadStatus.Init, products:const []);
  }

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
  int get hashCode {
    return loadStatus.hashCode ^
      products.hashCode;
  }



 }


