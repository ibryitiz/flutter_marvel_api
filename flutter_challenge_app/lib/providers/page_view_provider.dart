import 'package:flutter/material.dart';
import 'package:flutter_challenge_app/views/home_page_one.dart';
import 'package:flutter_challenge_app/views/home_page_three.dart';
import 'package:flutter_challenge_app/views/home_page_two.dart';

class PageViewProvider extends ChangeNotifier {
  PageController _pageController = PageController();
  PageController get pageController => _pageController;
  set pageController(PageController pageController) {
    _pageController = pageController;
    notifyListeners();
  }

  List<Widget> _pageList = [
    const HomePageOne(),
    const HomePageTwo(),
    const HomePageThree(),
  ];
  List<Widget> get pageList => _pageList;
  set pageList(List<Widget> pageList) {
    _pageList = pageList;
    notifyListeners();
  }

  void goNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void goPreviousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
