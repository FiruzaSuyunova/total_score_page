import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:total_score_page/models/result/result_model.dart';



class ApiService {
  static const String baseUrl='https://api.mutolaa.com/api/v1/contests/ContestOverallResults/1/';
  final Dio _dio=Dio();

  Future<Results?>getModel()async{
    try{
      final response=await _dio.get(
        baseUrl,
        options: Options(headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzU1MjMzODkzLCJpYXQiOjE3NTI2NDE4OTMsImp0aSI6ImIyOWZlMTkwOWYwNTRiMDlhNDI3NDUxZjNkMTAyMTI4IiwidXNlcl9pZCI6MTY3Mzk3NiwiZGV2aWNlX2lkIjoiMzgxMDRCMkEtRkJGQi00QzFGLUIwQzgtRkM2QzFGN0U5MzhGIn0.9wkgtOVidgHjyhmlbfg57sY2W5UmT5iw8vUI8vc0VvU'}),
      );
      print(response.data);
      print(response.statusCode);
      return Results.fromJson(response.data);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}




