import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/auth/auth_model.dart';

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
          Center(heightFactor: 2, child: Text('', style: textStyle)),
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
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;
    final inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );

    final inputDecorationPassword = InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true,
        suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              _isObscure = !_isObscure;
              setState(() {});
            }));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(5)),
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ErrorMassege(),
            const Text('NickName', style: TextStyle(color: Colors.grey)),
            TextField(
              onChanged: (value) => {model?.checkingLoginAndPassword()},
              controller: model?.loginTextController,
              decoration: inputDecoration,
            ),
            SizedBox(height: 25),
            Text('Password', style: TextStyle(color: Colors.grey)),
            TextField(
              onChanged: (value) => {model?.checkingLoginAndPassword()},
              controller: model?.passwordTextController,
              decoration: inputDecorationPassword,
              obscureText: _isObscure,
            ),
            SizedBox(height: 50),
            _AuthButtonWidget(),
            SizedBox(height: 45),
            Text(
              'Регистрируясь вы принимаете наши условия:',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Text(
                'политику использования данных',
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
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
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator())
        : const Text('Sign in',
            style: TextStyle(fontSize: 20, color: Colors.white));

    return ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.hardEdge,
        style: ButtonStyle(
          enableFeedback: false,
          backgroundColor: model?.colorButton,
        ),
        child: Container(height: 60, child: Center(child: child)));
  }
}

class _ErrorMassege extends StatelessWidget {
  const _ErrorMassege({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMassege = AuthProvider.watch(context)?.model.errorMassege;
    if (errorMassege == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMassege,
        style: TextStyle(color: Colors.red, fontSize: 17),
      ),
    );
  }
}
