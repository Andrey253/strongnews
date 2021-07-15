// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model_news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModelNews _$DataModelNewsFromJson(Map<String, dynamic> json) {
  return DataModelNews(
    statusCode: json['statusCode'] as int,
    result: Result.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Result _$ResultFromJson(dynamic json) {
  return Result(
    count: json['count'] as int,
    posts: (json['posts'] as List<dynamic>)
        .map((dynamic value) => Posts.fromJson(value as Map<String, dynamic>))
        .toList(),
  );
}

Posts _$PostsFromJson(Map<String, dynamic> json) {
  return Posts(
    id: json['id'] as int,
    meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    caption: json['caption'] as String?,
    tags: json['tags'] as List<dynamic>,
    location: json['location'] as Null,
    userId: json['userId'] as int,
    photoId: json['photoId'] as String?,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    photo: Photo.fromJson(json['photo']),
    user: User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    entries: json['entries'] as List<dynamic>,
  );
}

Photo _$PhotoFromJson(dynamic json) {
  if (json == null)
    return Photo(
      height: 0,
      width: 0,
      id: '',
    );
  else
    return Photo(
      height: json['height'] as int,
      width: json['width'] as int,
      id: json['id'] as String,
    );
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    username: json['username'] as String,
    avatar: json['avatar'] as Null,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
  );
}