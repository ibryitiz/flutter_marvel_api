import 'package:flutter/material.dart';
import 'package:flutter_challenge_app/constant/my_border_radius.dart';
import 'package:flutter_challenge_app/constant/my_colors.dart';
import 'package:flutter_challenge_app/constant/my_paddings.dart';
import 'package:flutter_challenge_app/constant/my_sized_box.dart';
import 'package:flutter_challenge_app/constant/my_texts.dart';

class MyListTile extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final String imageVaryant;
  final String imageExtension;
  final void Function()? onPressed;
  const MyListTile({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.imageVaryant,
    required this.imageExtension,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.containerPadding,
      child: _buildContainer,
    );
  }

  Widget get _buildContainer => Container(
        height: 215,
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.instance.whiteColor,
          borderRadius: MyBorderRadius.containerBorderRadius,
          boxShadow: [
            BoxShadow(
              color: MyColors.instance.blackColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: _buildRow,
      );

  Widget get _buildRow => Row(
        children: [
          _buildImage,
          MySizedBox.normalSizedBoxWidht,
          Expanded(
            child: _buildNameColumn,
          ),
        ],
      );

  Widget get _buildImage => ClipRRect(
        borderRadius: MyBorderRadius.imageBorderRadius,
        child: Image.network(
          "$imagePath/$imageVaryant.$imageExtension",
          fit: BoxFit.cover,
        ),
      );

  Widget get _buildNameColumn => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MySizedBox.normalSizedBoxHeight,
          _buildTitle,
          MySizedBox.normalSizedBoxHeight,
          _buildShortInfoColumn,
          const Spacer(),
          _buildPushDetailsRow,
        ],
      );

  Widget get _buildTitle => Text(
        name,
        style: const TextStyle(
          fontSize: 22,
        ),
      );

  Widget get _buildShortInfoColumn => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description.substring(
              0,
              description.length < 30 ? description.length : 30,
            ),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            description.substring(
              description.length < 30 ? 0 : 30, // Başlangıç indeksi olarak 0 veya 30 kullan
              description.length < 60 ? description.length : 60,
            ),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          Row(
            children: [
              Text(
                description.substring(
                  description.length < 60 ? 0 : 60, // Başlangıç indeksi olarak 0 veya 30 kullan
                  description.length < 80 ? description.length : 80,
                ),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const Text(
                "...",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      );

  Widget get _buildPushDetailsRow => Row(
        children: [
          const Text(
            MyTexts.moreInfoText,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          MySizedBox.xLargeSizedBoxWidht,
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      );
}
