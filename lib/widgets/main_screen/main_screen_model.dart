import 'package:flutter/material.dart';
import 'package:strongnews/api/api_client.dart';
import 'package:strongnews/data/data_model_news/data_model_news.dart';
import 'package:strongnews/data/data_providers/auth_data_provider.dart';
import 'package:strongnews/resources/app_strings.dart';

class MainScreenModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _authDataProvider = AuthDataProvider();
  DataModelNews? objectNews = null;
  String? baerer;

  bool _enableRequest = true;
  bool get enableRequest => _enableRequest;

  String? _errorMessege;
  String? get errorMassege => _errorMessege;

  Future<void> readTokenAndSendGetRequest() async{
    baerer = await _authDataProvider.getBaererToken();
    if (baerer != null) {
      await sendGetRequestNews(baerer!);
      notifyListeners();
    }
  }

  Future<void> sendGetRequestNews(String baerer) async {
    _enableRequest = false;
      notifyListeners();
      try {
          objectNews = await _apiClient.getNews(baerer);
          _enableRequest = false;
      } on ApiClientException catch (e) {
        switch (e.type){
          case ApiClientExceptionType.Network:
            _errorMessege = AppErrors.network;
            break;
          case ApiClientExceptionType.Auth:
            _errorMessege = AppErrors.auth;
            break;
          case ApiClientExceptionType.Other:
            _errorMessege = AppErrors.other;
            break;
        } return;
      }
        if (_errorMessege != null){
          notifyListeners();
          return;
        }
      }
}