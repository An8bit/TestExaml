import 'package:dio/dio.dart';
import 'package:testmobile/model/student.dart';

abstract class Api {
   
  Future<List<Student>> get(String url);
  Future<String> post(String url, Map<String, dynamic> body);
  Future<String> put(String url, Map<String, dynamic> body);
  Future<String> delete(String url);
}