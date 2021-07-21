import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'package:strongnews/api/api_client.dart';
import 'package:strongnews/data/data_providers/auth_data_provider.dart';
import 'package:strongnews/resources/app_strings.dart';
import 'package:strongnews/ui/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _authDataProvider = AuthDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? _errorMessege;

  String? get errorMassege => _errorMessege;
  bool _isAuthProgress = false;
  bool _isCheckedLoginAndPassword = false;
  bool get canStartAuth => !_isAuthProgress && _isCheckedLoginAndPassword;
  bool get isAuthProgress => _isAuthProgress;
  var colorButton = MaterialStateProperty.all(Colors.pink.shade200);

  void checkingLoginAndPassword(){
    final login = loginTextController.text;
    final password = passwordTextController.text;
    final reg = RegExp("^[a-zA-Z_]+\$");
    if (password.length >= 3 && password.length <= 9 && reg.hasMatch(login)){
      _isCheckedLoginAndPassword = true;
      colorButton = MaterialStateProperty.all(Colors.pink);
      notifyListeners();
    }else{
      _isCheckedLoginAndPassword = false;
      colorButton = MaterialStateProperty.all(Colors.pink.shade200);
      notifyListeners();
    }
  }
  Future<void> auth(BuildContext context) async {
    if (canStartAuth) {
      _errorMessege = null;
      _isAuthProgress =true;
      notifyListeners();
      String? baererToken;
      try {
        baererToken = await _apiClient.auth();
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
        }
      }
      _isAuthProgress =false;

      if (_errorMessege != null){
        notifyListeners();
        return;
      }
       await _authDataProvider.setBaererToken(baererToken);
       unawaited(
            Navigator.of(context)
                .pushReplacementNamed(MainNavigationRouteNames.mainScreen));
    } else{
      _errorMessege = AppErrors.loginOrPasswordIncorrect;
      notifyListeners();
      return;
    }
  }
}