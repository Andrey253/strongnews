import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      // appBar: AppBar(title: Text ('Login to your account')),
      body: SingleChildScrollView(
        child: _HeaderWidget(),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 20,
      color: Colors.white,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          Text('Login', style: textStyle),
          Center(heightFactor: 4, child: Text('', style: textStyle)),
          _FormWidget(),
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
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _login = 'l';
  final _passwords = 'pas';
  String? errorText = null;
  Color colordisable = Colors.grey;
  bool enableAuth = false;

  @override
  Widget build(BuildContext context) {
    final textStyleButton = const TextStyle(
      fontSize: 20,
      color: Colors.white,
    );
    final inputDecoration = InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);

    final errortext = this.errorText;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(5)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(1),
        //     offset: Offset(0,4),
        //     blurRadius: 8,
        //   )
        // ]
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (errortext != null) ...[
              Text(
                errortext,
                style: TextStyle(color: Colors.red, fontSize: 17),
              )
            ],
            SizedBox(
              height: 10,
            ),
            Text('NickName', style: TextStyle(color: Colors.grey)),
            TextField(
              onChanged: _chekAndAuth,
              controller: _loginTextController,
              decoration: inputDecoration,
            ),
            SizedBox(height: 25),
            Text('Password', style: TextStyle(color: Colors.grey)),
            TextField(
                onChanged: _chekAndAuth,
                controller: _passwordTextController,
                decoration: inputDecoration,
                obscureText: true),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: _auth,
                clipBehavior: Clip.hardEdge,
                style: ButtonStyle(
                  enableFeedback: false,
                  backgroundColor: MaterialStateProperty.all(colordisable),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  )),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Sign in',
                      style: textStyleButton,
                    ),
                  ),
                )),
            SizedBox(height: 45),
            Text(
              'Регистрируясь вы принимаете наши условия:',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Text(
                'политику использования данных',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
              onTap: () {
                print("sdfdsf");
              },
            ),
            SizedBox(height: 6),
            GestureDetector(
                child: Text(
                  'политику в отношении файлов cookie',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  print("sdfdsf");
                }),
          ],
        ),
      ),
    );
  }

  void _chekAndAuth(String value) {
    final reg = RegExp("^[a-zA-Z_]+\$");

    if (_passwordTextController.text.length >= 3 &&
        _passwordTextController.text.length <= 9 &&
        reg.hasMatch(_loginTextController.text)) {
      setState(() {
        colordisable = Colors.pink;
        enableAuth = true;
        errorText=null;
      });
    } else {
      setState(() {
        colordisable = Colors.grey;
        enableAuth = false;
      });
    }
  }
  void _auth() {
    if (!enableAuth) return null;
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    errorText = null;

    if (login == this._login && password == this._passwords)
      Navigator.of(context).pushReplacementNamed('/main_screen');
    else
      errorText = 'login or password incorrect';
    setState(() {});
  }
}
