import 'package:dio/dio.dart';
import 'package:testmobile/api/api.dart';
import 'package:testmobile/api/log.dart';
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
  Future<String> post(String url, Map<String, dynamic> body) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<String> put(String url, Map<String, dynamic> body) {
    // TODO: implement put
    throw UnimplementedError();
  }
  
  @override
  Future<bool> deleteProduct(String Idproduct) async {
    Response response = await dio.delete("https://api.escuelajs.co/api/v1/products/"+Idproduct);
    if(response.statusCode == 200){
      return true;
    }
    return false;
  }
  
  @override
  Future<Product> getProduct(int Idproduct) {
    return dio.get("https://api.escuelajs.co/api/v1/products/"+Idproduct.toString()).then((value) {
      return Product.fromJson(value.data);
    });
  }

}