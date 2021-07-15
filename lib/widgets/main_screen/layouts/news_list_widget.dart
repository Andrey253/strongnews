import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strongnews/data/data_model_news/data_model_news.dart';
import 'package:strongnews/library/widgets/inherited/provider.dart';
import 'package:strongnews/resources/app_images.dart';
import 'package:strongnews/widgets/main_screen/main_screen_model.dart';

class NewsListWidget extends StatefulWidget {
  const NewsListWidget({Key? key}) : super(key: key);
  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  final box_decor_item_news = BoxDecoration(
    color: Colors.white,
    border:       Border.all(color: Colors.black.withOpacity(0.2)),
    borderRadius: BorderRadius.only(
        topLeft:    Radius.circular(40),
        topRight:   Radius.circular( 5),
        bottomLeft: Radius.circular( 5),
        bottomRight:Radius.circular(40)),
  );
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
    if (_objNews is DataModelNews) {
      return Stack(
        children: [
          ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: _objNews.result.count,
              itemExtent: 163,
              itemBuilder: (BuildContext context, int index) {
                final news = _objNews.result.posts[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        decoration: box_decor_item_news,
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(width: 30),
                                      Text(
                                        news.caption == null
                                            ? 'без заголовка'
                                            : news.caption as String,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text(news.updatedAt,
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    news.createdAt,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          onTap: () {},
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(AppImages.avatar),
                      ),
                    ],
                  ),
                );
              }),
        ],
      );
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
