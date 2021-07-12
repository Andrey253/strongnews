
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/data/data_providers/auth_data_provider.dart';
import 'package:themoviedb/data/model/data_model_news.dart';
import 'package:themoviedb/widgets/auth/auth_model.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_model.dart';

class NewsListWidget extends StatefulWidget {

  const NewsListWidget({Key? key}) : super(key: key);

  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {

  @override
  void initState() {
    super.initState();
    final model = MainScreenProvider.read(context)?.model;
    model?.readTokenAndSendGetRequest();
  }

  @override
  Widget build(BuildContext context) {
     final model = MainScreenProvider.watch(context)?.model;
// if (model?.baerer is String && model!.enableRequest){
//   model.getNews();
// }
    //print ('model?.baerer    ${model?.baerer}');

    final _objNews = model?.objectNews;
    if (_objNews is DataModelNews) {
      return Stack(
        children: [
          ListView.builder(
              padding: EdgeInsets.only(top: 70),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: _objNews.result.count,
              itemExtent: 163,
              itemBuilder: (BuildContext context, int index) {
                final news = _objNews.result.posts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black.withOpacity(
                              0.2)),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          children: [
                            Image(image: AssetImage('news?.photoId')),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20,),
                                  Text('news.caption',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 5,),
                                  Text('news.caption',
                                    style: TextStyle(color: Colors.grey),),
                                  SizedBox(height: 20,),
                                  Text(news.user.username,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                );
              }),
        ],
      );
    } else return Center(child: Text('fdddfsf'));
  }

}
