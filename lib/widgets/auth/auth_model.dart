import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'package:themoviedb/api/api_client.dart';
import 'package:themoviedb/data/data_providers/auth_data_provider.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

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
      } catch (errorGetToken) {
        _errorMessege = 'Authorization failed';
      }
      _isAuthProgress =false;

      if (_errorMessege != null){
        notifyListeners();
        return;
      }
      if (baererToken == null){
        _errorMessege = 'Unknown Error';
        notifyListeners();
        return;
      }
        await _authDataProvider.setBaererToken(baererToken);
        unawaited(
            Navigator.of(context)
                .pushReplacementNamed(MainNavigationRouteNames.mainScreen));
    } else{
      _errorMessege = 'login or password incorrect';
      notifyListeners();
      return;
    }
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;
  const AuthProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }
  static AuthProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}