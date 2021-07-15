import 'package:flutter/cupertino.dart';
import 'package:strongnews/resources/app_strings.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(AppWidgetName.alt_about));
  }
}
