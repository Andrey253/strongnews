import 'package:flutter/material.dart';

class LikeModel extends ChangeNotifier {

  List<int> testNumberOfComments = [4,67,43,2,8,45,56];
  List<int> testNumberOfLikes = [23,456,0,34,78,0,890];

  void testNumberOfLikesIncr(int index) {
    testNumberOfLikes[index]++;
    notifyListeners();
  }

}