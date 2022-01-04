import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageWorkoutController extends GetxController{
   var currentIndex = 0.obs;
  PageController? pageController = PageController(initialPage: 0);

  void changePage(index) {
    currentIndex.value = index;
    pageController!.jumpToPage(index);
  }
}