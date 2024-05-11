import 'package:flutter/material.dart';
import 'package:flutter_challenge_app/constant/my_colors.dart';
import 'package:flutter_challenge_app/constant/my_texts.dart';
import 'package:flutter_challenge_app/providers/page_view_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.whiteColor,
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppbar => AppBar(
        backgroundColor: MyColors.instance.whiteColor,
        elevation: 0,
        title: _appbarTitle,
      );

  Widget get _appbarTitle => Text(
        MyTexts.marvel,
        style: TextStyle(
          color: MyColors.instance.logoColor,
          fontSize: 28,
          //fontWeight: FontWeight.bold,
        ),
      );

  Widget get _buildBody => Consumer<PageViewProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: value.pageController,
                  children: value.pageList,
                ),
              ),
              _buildBottomContainer(value),
            ],
          );
        },
      );

  Widget _buildBottomContainer(value) => Container(
        height: 70,
        color: MyColors.instance.whiteColor,
        alignment: const Alignment(0, 0.90),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLeftButton(value),
              _buildIndicator(value),
              _buildRightButton(value),
            ],
          ),
        ),
      );

  Widget _buildLeftButton(value) => IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: MyColors.instance.blackColor,
          size: 16,
        ),
        onPressed: () => value.goPreviousPage(),
      );

  Widget _buildIndicator(value) => SmoothPageIndicator(
        controller: value.pageController,
        count: value.pageList.length,
        effect: const ColorTransitionEffect(
          dotHeight: 10,
          dotWidth: 10,
        ),
      );

  Widget _buildRightButton(value) => IconButton(
        icon: Icon(
          Icons.arrow_forward_ios,
          color: MyColors.instance.blackColor,
          size: 16,
        ),
        onPressed: () => value.goNextPage(),
      );
}
