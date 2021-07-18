// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

part of 'data_model_news.dart';

DataModelNews _$DataModelNewsFromJson(Map<String, dynamic> json) {
  return DataModelNews(
    statusCode: json['statusCode'] as int?,
    result: json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataModelNewsToJson(DataModelNews instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    count: json['count'] as int?,
    posts: (json['posts'] as List<dynamic>)
        .map((dynamic e) => Posts.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'count': instance.count,
      'posts': instance.posts,
    };

Posts _$PostsFromJson(Map<String, dynamic> json) {
  return Posts(
    id: json['id'] as int?,
    meta: json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    caption: json['caption'],
    tags: json['tags'] as List<dynamic>?,
    location: json['location'],
    userId: json['userId'] as int?,
    photoId: json['photoId'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    photo: json['photo'] == null
        ? null
        : Photo.fromJson(json['photo'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostsToJson(Posts instance) => <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'caption': instance.caption,
      'tags': instance.tags,
      'location': instance.location,
      'userId': instance.userId,
      'photoId': instance.photoId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'photo': instance.photo,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int?,
    username: json['username'] as String?,
    avatar: json['avatar'],
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatar': instance.avatar,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    height: json['height'] as int?,
    width: json['width'] as int?,
    id: json['id'] as String?,
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'id': instance.id,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    entries: json['entries'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'entries': instance.entries,
    };
