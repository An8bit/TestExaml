import 'package:dio/dio.dart';

abstract class Api {
   
  Future<String> get(String url);
  Future<String> post(String url, Map<String, dynamic> body);
  Future<String> put(String url, Map<String, dynamic> body);
  Future<String> delete(String url);
}