import 'package:flutter/material.dart';

class AppAlertDialog {
  static AlertDialog showAlert(BuildContext context, String polocy) {
    return AlertDialog(
      title: Text('Политика использования данных'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(polocy),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink)),
              child: Text('Я согласен'),
            )
          ],
        ),
      ),
    );
  }
}