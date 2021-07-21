import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strongnews/Theme/app_colors.dart';
import 'package:strongnews/Theme/app_style.dart';
import 'package:strongnews/data/data_model_news/data_model_news.dart';
import 'package:strongnews/library/widgets/inherited/provider.dart';
import 'package:strongnews/resources/app_images.dart';
import 'package:strongnews/widgets/likes_widget/likes_model.dart';
import 'package:strongnews/widgets/likes_widget/likes_widget.dart';
import 'package:strongnews/widgets/main_screen/main_screen_model.dart';

class NewsListWidget extends StatefulWidget {
  const NewsListWidget({Key? key}) : super(key: key);
  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  final box_decor_item_news = BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black.withOpacity(0.0)),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(40)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: Offset(0, 2),
          blurRadius: 2,
        )
      ]);

  @override
  void initState() {
    super.initState();
    final model = NotifierProvider.read<MainScreenModel>(context);
    model?.readTokenAndSendGetRequest();
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MainScreenModel>(context);
    final _objNews = model?.objectNews;
    final _error = model?.errorMassege;
    if (_error != null) {
      return Center(child: Text(_error));
    }
    if (_objNews is DataModelNews) {
      return ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _objNews.result?.count,
          //itemExtent: 160,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final news = _objNews.result?.posts[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: box_decor_item_news,
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(width: 40),
                                  Text(
                                    returnNoNullText(news?.user?.firstName, 'no FirsName'),
                                    style: AppStyle.firstLastNameStyle,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    returnNoNullText(news?.user?.lastName, 'no SecondName'),
                                    style: AppStyle.firstLastNameStyle,
                                  ),
                                ],
                              ),
                              SizedBox(height: 17),
                              Text(
                                  returnNoNullText(news?.caption, 'Здесь преставлено тестовое сообщение. Оно отображается если в ответе от сервера в поле caption установлено значение null. Здесь преставлено тестовое сообщение. Оно отображается если в ответе от сервера в поле caption установлено значение null.'),
                                  style: AppStyle.messageStyle),
                              SizedBox(height: 8),
                              NotifierProvider(
                                  model: LikeModel(),
                                  child: LikesCommentsWidget(
                                    index: index,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.mainColor2,
                    child: CircleAvatar(
                      radius: 19,
                      backgroundImage: AssetImage(AppImages.avatar),
                    ),
                  ),
                ],
              ),
            );
          });
    } else
      return Center(
          child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                strokeWidth: 8,
              )));
  }
}

String returnNoNullText(dynamic v, String defaultText){
  String s;
  if (v == null) s = defaultText;
  else s = v as String;
  return s;
}
