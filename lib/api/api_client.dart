import 'dart:convert';
import 'dart:io';
import 'package:themoviedb/data/model/data_model_news.dart';
import 'package:themoviedb/data/token_access/response_token.dart';

class ApiClient {
  final _client = HttpClient();
  static const _host_get_token =
      'https://app.ferfit.club/api/auth/refresh-tokens';
  static const _host_get_news =
      'https://app.ferfit.club/api/feed?limit=10&offset=0&maxDate=2021-05-06T18:26:42.820994';
  static const _baerer =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8';

  Future<String> auth() async {
    final url = Uri.parse(_host_get_token);
    final request = await _client.postUrl(url);
    request.headers.set('authorization', _baerer);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((v) => v.join())
        .then((value) => jsonDecode(value) as Map<String, dynamic>);
    final bearerToken =
        ResponseToken.fromJson(json as Map<String, dynamic>).token.access;
    return bearerToken;
  }

  Future<DataModelNews> getNews(String baererToken) async {
    final url = Uri.parse(_host_get_news);
    final request = await _client.getUrl(url);
    request.headers.set('Authorization', 'Bearer $baererToken');
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((v) => v.join())
        .then((value) => jsonDecode(value) as Map<String, dynamic>);

    final data_model_news =
        DataModelNews.fromJson(json as Map<String, dynamic>);
    return data_model_news;
  }
}
