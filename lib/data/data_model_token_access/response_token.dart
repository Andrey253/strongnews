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
class Result {
  String access;
  String refresh;

  Result ({
    required this.access,
    required this.refresh,
  });

  factory Result.fromJson( Map<String, dynamic> json){
    return Result(
        access: json['access'] as String,
        refresh: json['refresh'] as String);
  }

}