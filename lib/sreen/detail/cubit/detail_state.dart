
 import 'package:testmobile/enum/LoadStatus.dart';
import 'package:testmobile/model/product.dart';

class DetailState {
  final LoadStatus loadStatus;
  final Product product;

  DetailState({required this.loadStatus, required this.product});

  DetailState copyWith({LoadStatus? loadStatus, Product? product}) {
    return DetailState(
      loadStatus: loadStatus ?? this.loadStatus,
      product: product ?? this.product,
    );
  }

  factory DetailState.Init() {
    return DetailState(loadStatus: LoadStatus.Init, product: Product());
  }

  @override
  String toString() {
    return 'DetailState{loadStatus: $loadStatus, product: $product}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailState &&
        other.loadStatus == loadStatus &&
        other.product == product;
  }

  @override
  int get hashCode {
    return loadStatus.hashCode ^ product.hashCode;
  }
 }

