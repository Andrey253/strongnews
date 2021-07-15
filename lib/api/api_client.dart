import 'dart:convert';
import 'dart:io';
import 'package:strongnews/data/data_model_news/data_model_news.dart';
import 'package:strongnews/data/data_model_token_access/response_token.dart';
import 'package:strongnews/resources/app_strings.dart';

enum ApiClientExceptionType{ Network, Auth, Other }

class ApiClientException implements Exception{
  final ApiClientExceptionType type;
  ApiClientException(this.type);
}

class ApiClient {
  final _client = HttpClient();

  Future<String> auth() async {
    final url = Uri.parse(AppString.host_get_token);

    try {
      _client.connectionTimeout = Duration(seconds: 15);
      final request = await _client.postUrl(url);
      request.headers.set('authorization', AppString.bearer);
      final response = await request.close();
      if (response.statusCode == 401){
        throw ApiClientException( ApiClientExceptionType.Auth);
      }
      final json = await response
              .transform(utf8.decoder)
              .toList()
              .then((v) => v.join())
              .then((value) => jsonDecode(value) as Map<String, dynamic>);
      final bearerToken = ResponseToken.fromJson(json as Map<String, dynamic>).token.access;
      if (bearerToken == null){
        throw ApiClientException( ApiClientExceptionType.Auth);
      }
      return bearerToken;
    } on SocketException {
      throw ApiClientException( ApiClientExceptionType.Network);
    } on ApiClientException {
      rethrow;
    } catch (_){
      throw ApiClientException( ApiClientExceptionType.Other);
    }
  }

  Future<DataModelNews> getNews(String bearerToken) async {
    final url = Uri.parse(AppString.host_get_news);

    try {
      _client.connectionTimeout = Duration(seconds: 15);
      final request = await _client.getUrl(url);
      request.headers.set('Authorization', 'Bearer $bearerToken');
      final response = await request.close();
      if (response.statusCode == 401){
        throw ApiClientException( ApiClientExceptionType.Other);
      }
      final json = await response
              .transform(utf8.decoder)
              .toList()
              .then((v) => v.join())
              .then((value) => jsonDecode(value) as Map<String, dynamic>);

      final data_model_news =
              DataModelNews.fromJson(json as Map<String, dynamic>);
      if (data_model_news == null){
        throw ApiClientException( ApiClientExceptionType.Other);
      }
      return data_model_news;
    } on SocketException {
      throw ApiClientException( ApiClientExceptionType.Network);
    } on ApiClientException {
      rethrow;
    } catch (_){
      throw ApiClientException( ApiClientExceptionType.Other);
    }
  }
}
