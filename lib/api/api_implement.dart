import 'package:dio/dio.dart';
import 'package:testmobile/api/api.dart';

class ApiImpleMent extends Api{
  final String baseUrl = "https://jsonplaceholder.typicode.com";
   Dio dio = Dio();

   
  @override
  Future<String> delete(String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String> get(String url) {
    dio.get(url).then((value) => value.data);
    return Future.value("data");
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

}