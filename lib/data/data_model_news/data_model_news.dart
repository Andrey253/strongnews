import 'package:json_annotation/json_annotation.dart';

part 'data_model_news.g.dart';
@JsonSerializable()
class DataModelNews {
  int? statusCode;
  Result? result;

  DataModelNews({
      this.statusCode,
      this.result});
  factory DataModelNews.fromJson(Map<String, dynamic> json) => _$DataModelNewsFromJson( json);

  Map<String, dynamic> toJson (DataModelNews json) => <String, dynamic>{
    'statusCode' : json.statusCode,
    'result' : json.result,
  };
}
@JsonSerializable()
class Result {
  int? count;
  final List<Posts> posts;

  Result({
      required this.count,
      required this.posts});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

}
@JsonSerializable()
class Posts {
  int? id;
  Meta? meta;
  dynamic? caption;
  List<dynamic>? tags;
  dynamic? location;
  int? userId;
  String? photoId;
  String? createdAt;
  String? updatedAt;
  Photo? photo;
  User? user;

  Posts({
      required this.id,
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

  Map <String, dynamic> toJson(Posts posts) => <String, dynamic>{
    'id' : posts.id,
    'meta' : posts.meta?.toJson(),
    'caption' : posts.caption,
    'tags' : posts.tags?.map((dynamic? e) => e.toString()),
    'location' : posts.location,
    'userId' : posts.userId,
    'photoId' : posts.photoId,
    'createdAt' : posts.createdAt,
    'updatedAt' : posts.updatedAt,
    'photo' : posts.photo?.toJson(),
    'user' : posts.user?.toJson(),

  };
}
@JsonSerializable()
class User {
  int? id;
  String? username;
  dynamic? avatar;
  String? firstName;
  String? lastName;

  User({
      required this.id,
      required this.username,
      required this.avatar,
      required this.firstName,
      required this.lastName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map <String, dynamic> toJson() => <String, dynamic>{
    'id' : id,
    'username' : username,
    'avatar' : avatar,
    'firstName' : firstName,
    'lastName' : lastName,
  };
}
@JsonSerializable()
class Photo {
  int? height;
  int? width;
  String? id;

  Photo({
      this.height,
      this.width,
      this.id});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map <String, dynamic> toJson() => <String, dynamic>{
    'height' : height,
    'width' : width,
    'id' : id,
  };
}
@JsonSerializable()
class Meta {
  List<dynamic>? entries;

  Meta({this.entries});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map <String, dynamic> toJson() => <String, dynamic>{
      'entries' : entries?.map((dynamic e) => e.toString())
    };

}