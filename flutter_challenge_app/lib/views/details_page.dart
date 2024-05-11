import 'package:flutter/material.dart';
import 'package:flutter_challenge_app/constant/image_sizes.dart';
import 'package:flutter_challenge_app/constant/my_border_radius.dart';
import 'package:flutter_challenge_app/constant/my_colors.dart';
import 'package:flutter_challenge_app/constant/my_paddings.dart';
import 'package:flutter_challenge_app/constant/my_sized_box.dart';
import 'package:flutter_challenge_app/constant/my_texts.dart';
import 'package:flutter_challenge_app/models/marvel.dart';
import 'package:flutter_challenge_app/providers/details_page_procider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Marvel marvel;
  const DetailsPage({super.key, required this.marvel});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppbar => AppBar(
        title: Text(
          widget.marvel.name!,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      );

  Widget get _buildBody => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImage,
            Padding(
              padding: MyPaddings.containerPadding,
              child: _buildDescriptionColumn,
            ),
          ],
        ),
      );

  Widget get _buildImage => ClipRRect(
        borderRadius: MyBorderRadius.detailsImageBorderRadius,
        child: Image.network(
          "${widget.marvel.thumbnail!.path}/${ImageSizes.portraitIncredible}.${widget.marvel.thumbnail!.extension}",
          fit: BoxFit.cover,
        ),
      );

  Widget get _buildDescriptionColumn => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            MyTexts.descriptionTitle,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            widget.marvel.description!,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          MySizedBox.normalSizedBoxHeight,
          const Text(
            MyTexts.availableTitle,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Text(
            widget.marvel.comics!.available!.toString(),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          MySizedBox.normalSizedBoxHeight,
          const Text(
            MyTexts.comicsTitle,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          _comicsListView,
          MySizedBox.normalSizedBoxHeight,
          const Text(
            MyTexts.collectionURItitle,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Text(
            widget.marvel.comics!.collectionURI!,
            style: TextStyle(
              fontSize: 16,
              color: MyColors.instance.linkColor,
            ),
          ),
        ],
      );

  Widget get _comicsListView {
    DetailsPageProvider viewModel = Provider.of<DetailsPageProvider>(context);
    widget.marvel.comics!.items!.sort((a, b) {
      int yearA = viewModel.getYear(a.name!);
      int yearB = viewModel.getYear(b.name!);
      return yearB.compareTo(yearA);
    });
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.marvel.comics!.items!.length > 10 ? 10 : widget.marvel.comics!.items!.length,
      itemBuilder: (context, index) {
        var item = widget.marvel.comics!.items![index];
        String name = item.name!;
        int year = viewModel.getYear(name);
        if (year < 2005) return Container();
        // Trade Paperback kontrolü
        if (name.contains("Trade Paperback")) {
          return Container(
            decoration: BoxDecoration(
              color: MyColors.instance.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: MyColors.instance.blackColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            padding: MyPaddings.containerPadding,
            margin: MyPaddings.containerMargin,
            child: ListTile(
              leading: const Icon(Icons.arrow_right),
              title: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          );
        }

        // Diğer koşulları sağlayanlar için normal container döndür
        return Container(
          decoration: BoxDecoration(
            color: MyColors.instance.whiteColor,
            boxShadow: [
              BoxShadow(
                color: MyColors.instance.blackColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          padding: MyPaddings.containerPadding,
          margin: MyPaddings.containerMargin,
          child: ListTile(
            leading: const Icon(Icons.arrow_right),
            title: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
