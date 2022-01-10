import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AthleteProfileController extends GetxController{
  var currentIndex = 0.obs;
  PageController pageController = PageController();
  changePage(int page){
    currentIndex.value = page;
    pageController.jumpToPage(page);
  }
}