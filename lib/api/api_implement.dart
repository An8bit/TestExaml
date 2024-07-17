import 'package:dio/dio.dart';
import 'package:testmobile/api/api.dart';
import 'package:testmobile/api/log.dart';
import 'package:testmobile/model/student.dart';

class ApiImpleMent extends Api{
  ApiImpleMent();
  final String baseUrl = "https://huflit.id.vn:4321/";
   Dio dio = Dio();
  
  @override
  Future<String> delete(String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> get(String url) {
  url = baseUrl + url;
  return dio.get(url).then((value) {
    List<Student> listStudent = [];
    var responseData = value.data;
    // Kiểm tra nếu responseData là một List trực tiếp
    if (responseData is List) {
      for (var item in responseData) {
        listStudent.add(Student.fromJson(item));
      }
    }
    // Nếu responseData không phải là List, xử lý như là Map và trích xuất danh sách
    else if (responseData is Map<String, dynamic> && responseData.containsKey('students')) {
      var studentsList = responseData['students'];
      if (studentsList is List) {
        for (var item in studentsList) {
          listStudent.add(Student.fromJson(item));
        }
      }
    } else {
      throw Exception('Unexpected data format');
    }
    return listStudent;
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

}