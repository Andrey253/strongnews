import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'package:themoviedb/api/api_client.dart';
import 'package:themoviedb/data/data_providers/auth_data_provider.dart';
import 'package:themoviedb/data/model/data_model_news.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

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
     // print ('objectNews.toString() ${objectNews.toString()}');
    }
    notifyListeners();
  }
  Future<void> sendGetRequestNews(String baerer) async {
    _enableRequest = false;
      notifyListeners();
      try {
          objectNews = await _apiClient.getNews(baerer);
          _enableRequest = false;
      } catch (errorGetNews) {
        _errorMessege = 'Error geting data';
        return;
      }

      if (_errorMessege != null){
        notifyListeners();
        return;
      }
     else{
      _errorMessege = 'request failed';
      notifyListeners();
      return;
    }
  }
}

class MainScreenProvider extends InheritedNotifier {
  final MainScreenModel model;
  const MainScreenProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static MainScreenProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainScreenProvider>();
  }
  static MainScreenProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<MainScreenProvider>()?.widget;
    return widget is MainScreenProvider ? widget : null;
  }
}