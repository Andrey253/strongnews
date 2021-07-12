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