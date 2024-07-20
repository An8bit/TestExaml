import 'package:dio/dio.dart';
import 'package:testmobile/api/api.dart';
import 'package:testmobile/api/log.dart';
import 'package:testmobile/model/game.dart';
import 'package:testmobile/model/gamedetail.dart';
import 'package:testmobile/model/gamenews.dart';
import 'package:testmobile/model/product.dart';
import 'package:testmobile/model/student.dart';

class ApiImpleMent extends Api{
  ApiImpleMent();
  final String baseUrl = "https://api.escuelajs.co/";
   Dio dio = Dio();
  
  @override
  Future<String> delete(String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> get(String url) {
  url = baseUrl + url;
  return
   dio.get(url).then((value) {
    List<Product> listPro = [];
    var responseData = value.data;

    for (var item in responseData) {
      listPro.add(Product.fromJson(item));
    }

    // // Kiểm tra nếu responseData là một List trực tiếp
    // if (responseData is List) {
    //   for (var item in responseData) {
    //     listPro.add(Product.fromJson(item));
    //   }
    // }
    // // Nếu responseData không phải là List, xử lý như là Map và trích xuất danh sách
    // else if (responseData is Map<String, dynamic> && responseData.containsKey('students')) {
    //   var studentsList = responseData['students'];
    //   if (studentsList is List) {
    //     for (var item in studentsList) {
    //       listPro.add(Product.fromJson(item));
    //     }
    //   }
    // } else {
    //   throw Exception('Unexpected data format');
    // }
    return listPro;
  });
}


  @override
  Future<bool> deleteProduct(int Idproduct) async {
    Response response = await dio.delete("https://api.escuelajs.co/api/v1/products/${Idproduct.toString()})");
    if(response.statusCode == 200){
      return true;
    }
    return false;
  }
  //get deatil product
  @override
  Future<Product> getProduct(int Idproduct) {
   
    return dio.get("https://api.escuelajs.co/api/v1/products/"+Idproduct.toString()).then((value) {
      return Product.fromJson(value.data);
    });
  }
  
  @override
  Future<String> postProduct(Product product) {
    // TODO: implement postProduct
    throw UnimplementedError();
  }
  
  @override
  Future<String> putProduct(Product product) {
    // TODO: implement putProduct
    throw UnimplementedError();
  }

  @override
  Future<GameDetail> getDetailGame(int id) {
    return dio.get("https://www.mmobomb.com/api1/game?id=$id").then((value) {
      return GameDetail.fromJson(value.data);
    });
  }
  
  @override
  Future<List<Game>> getListGame() {
    return
   dio.get("https://www.mmobomb.com/api1/games").then((value) {
    List<Game> listPro = [];
    var responseData = value.data;

    for (var item in responseData) {
      listPro.add(Game.fromJson(item));
    }
    return listPro;

  });
}

  @override
  Future<List<Game>> getPlatformGame(String platform) {
    return dio.get("https://www.mmobomb.com/api1/games?platform=$platform").then((value) {
      List<Game> listPro = [];
      var responseData = value.data;

      for (var item in responseData) {
        listPro.add(Game.fromJson(item));
      }
      return listPro;
    });
  }
  
  @override
  Future<List<GameNews>> getNewGame() {
    return dio.get("https://www.mmobomb.com/api1/latestnews").then((value) {
      List<GameNews> listPro = [];
      var responseData = value.data;

      for (var item in responseData) {
        listPro.add(GameNews.fromJson(item));
      }
      return listPro;
    });
  }

 
}