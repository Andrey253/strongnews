import 'dart:convert';
import 'dart:io';

import 'package:themoviedb/data/response_token.dart';

class ApiClient {
  final client = HttpClient();

  Future<dynamic?> getBearerToken() async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('https://app.ferfit.club/api/auth/refresh-tokens');
    final request = await client.postUrl(url);
    request.headers.set('authorization', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8');
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = await jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);
    try {
      //print(json.token.access);
      final respAccess = ResponseToken.fromJson(json as Map<String, dynamic>);
      print(respAccess.token.access);
    } catch (e) {
      print(e);
    }

    return null;
  }
}