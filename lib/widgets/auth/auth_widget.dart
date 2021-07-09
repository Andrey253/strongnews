import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';


class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text ('Login to your account')),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}
class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          SizedBox(height: 25),
          Text('Чтобы пользоваться правкой и возможностями рейтинга TMDb, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',
          style: textStyle
          ),
          SizedBox(height: 15),
          TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: (){},
              child: Text('Регистрация')),
          SizedBox(height: 25),
          Text('Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',
          style: textStyle,
          ),
          SizedBox(height: 15),
          TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: (){},
              child: Text('Отправить письмо')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}
class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'Login');
  final _passwordTextController = TextEditingController(text: 'Pas_sword');
  final _login = 'Login';
  final _passwords = 'Pas_sword';
  String? errorText = null;

  void _auth(){
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    errorText = null;

    if (login == this._login && password == this._passwords)
      Navigator.of(context).pushReplacementNamed('/main_screen');
    else
      errorText = 'Не верный логин или пароль';
    setState(() {

    });
  }

  void _reset_password(){
    print('reset password');
  }
  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    final inputDecoration = InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
        vertical: 15),
    isCollapsed: true);
    final color = Colors.blue;
    final errortext = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errortext != null) ...[
          Text(
            errortext,
            style: TextStyle(color: Colors.red, fontSize: 17),
          ),
          SizedBox(
            height: 20,
          )
        ],
        Text('Имя пользователя',
        style: textStyle),
        SizedBox(height: 5),
        TextField(
            controller: _loginTextController,
            decoration: inputDecoration,
        ),
        SizedBox(height: 20),
        Text('Пароль',
            style: textStyle),
        SizedBox(height: 5),
        TextField(
            controller: _passwordTextController,
            decoration: inputDecoration,
        obscureText: true),
        SizedBox(height: 15),
        Row(
          children: [
            ElevatedButton(onPressed: _auth,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    )
                  ),
                ),
                child: Text('Войти')),
            SizedBox(width: 30,),
            TextButton(
                style: AppButtonStyle.linkButton,
                onPressed: _reset_password,
                child: Text('Сбросить пароль'))
          ],
        )
      ],
    );
  }
}