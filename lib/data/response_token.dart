import 'package:themoviedb/data/response_result.dart';

class ResponseToken {
  int statusCode;
  Result token;

  ResponseToken({
    required this.statusCode,
    required this.token,
  });

  factory ResponseToken.fromJson(Map<String, dynamic> json){

    return ResponseToken(
        statusCode: json['statusCode'] as int,
        token: Result.fromJson(json['result'] as Map<String, dynamic>)
    );
  }

}