import 'package:flutter/material.dart';

class LikeModel extends ChangeNotifier {
  List<int> testNumberOfComments = [4, 67, 43, 2, 8, 45, 56];
  List<int> testNumberOfLikes = [23, 456, 0, 34, 78, 0, 890];
  List<bool> liked = [false, false, false, false, false, false, false];

  void testNumberOfLikesIncr(int index) {
    if (liked[index])
      testNumberOfLikes[index]--;
    else
      testNumberOfLikes[index]++;
    liked[index] = !liked[index];
    notifyListeners();
  }
}
