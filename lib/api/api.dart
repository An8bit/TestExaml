import 'package:dio/dio.dart';
import 'package:testmobile/model/product.dart';
import 'package:testmobile/model/student.dart';

abstract class Api {
   
  Future<List<Product>> get(String url);
  Future<Product> getProduct(int Idproduct);
  Future<String> post(String url, Map<String, dynamic> body);
  Future<String> put(String url, Map<String, dynamic> body);
  Future<String> delete(String url);
  Future<bool> deleteProduct(String Idproduct);
}