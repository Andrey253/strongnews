import 'package:json_annotation/json_annotation.dart';

part 'data_model_news.g.dart';

@JsonSerializable()
class DataModelNews {
  int statusCode;
  Result result;

  DataModelNews({required this.statusCode, required this.result});

  factory DataModelNews.fromJson(Map<String, dynamic> json) =>
      _$DataModelNewsFromJson(json);
}

@JsonSerializable()
class Result {
  int count;
  List<Posts> posts;

  Result({required this.count, required this.posts});
  factory Result.fromJson(dynamic json) => _$ResultFromJson(json);
}

@JsonSerializable()
class Posts {
  int id;
  Meta meta;
  String? caption;
  List<dynamic> tags;
  Null location;
  int userId;
  String? photoId;
  String createdAt;
  String updatedAt;
  Photo photo;
  User user;

  Posts(
      {required this.id,
      required this.meta,
      required this.caption,
      required this.tags,
      required this.location,
      required this.userId,
      required this.photoId,
      required this.createdAt,
      required this.updatedAt,
      required this.photo,
      required this.user});

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
}

@JsonSerializable()
class Meta {
  List<dynamic> entries;

  Meta({required this.entries});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@JsonSerializable()
class Photo {
  int height;
  int width;
  String id;

  Photo({required this.height, required this.width, required this.id});

  factory Photo.fromJson(dynamic json) => _$PhotoFromJson(json);
}

@JsonSerializable()
class User {
  int id;
  String username;
  Null avatar;
  String firstName;
  String lastName;

  User(
      {required this.id,
      required this.username,
      required this.avatar,
      required this.firstName,
      required this.lastName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
