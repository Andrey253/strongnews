import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strongnews/Theme/app_colors.dart';
import 'package:strongnews/Theme/app_style.dart';
import 'package:strongnews/library/widgets/inherited/provider.dart';

import 'likes_model.dart';


class LikesCommentsWidget extends StatelessWidget {
  final int index;
  const LikesCommentsWidget({
    Key? key, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<LikeModel>(context);
    final testNumberOfComments = model?.testNumberOfComments[index];
    var testNumberOfLikes = model?.testNumberOfLikes[index];
    return Row(
      children: [
        IconButton(
            onPressed:(){model?.testNumberOfLikesIncr(index);},
            icon: Icon(Icons.favorite_outlined, color: testNumberOfLikes == 0 ? Colors.black26 : AppColors.mainColor2,)),
        //SizedBox(width: 10),
        Container( width: 40 ,child: Text('$testNumberOfLikes',style: AppStyle.numberStyle, )),
        SizedBox(width: 10),
        Icon(Icons.mode_comment_sharp, color : Colors.black26),
        SizedBox(width: 10),
        Text('$testNumberOfComments', style: AppStyle.numberStyle,),
      ],
    );
  }
}