import 'package:flutter/material.dart';
import 'package:flutter_challenge_app/components/my_list_tile.dart';
import 'package:flutter_challenge_app/constant/image_sizes.dart';
import 'package:flutter_challenge_app/constant/my_texts.dart';
import 'package:flutter_challenge_app/models/marvel.dart';
import 'package:flutter_challenge_app/services/marvel_service.dart';
import 'package:flutter_challenge_app/views/details_page.dart';

class HomePageThree extends StatefulWidget {
  const HomePageThree({super.key});

  @override
  State<HomePageThree> createState() => _HomePageThreeState();
}

class _HomePageThreeState extends State<HomePageThree> {
  final MarvelService _service = MarvelService();
  @override
  Widget build(BuildContext context) {
    return _buildFutureBuilder;
  }

  Widget get _buildFutureBuilder => FutureBuilder<List<Marvel>>(
        future: _service.getMarvels(limit: 100, offset: 60),
        builder: (context, AsyncSnapshot<List<Marvel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                return _buildListView(snapshot.data!);
              } else {
                return _notFoundWidget;
              }
            default:
              return _waitingWidget;
          }
        },
      );

  Widget _buildListView(List<Marvel> marvelList) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: marvelList.length,
      itemBuilder: (context, index) {
        return _myListTile(marvelList[index]);
      },
    );
  }

  Widget _myListTile(Marvel marvel) {
    return MyListTile(
      name: marvel.name!,
      description: marvel.description!,
      imagePath: marvel.thumbnail!.path!,
      imageExtension: marvel.thumbnail!.extension!,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                marvel: marvel,
              ),
            ));
      },
      imageVaryant: ImageSizes.portraitXLarge,
    );
  }

  Widget get _notFoundWidget => const Center(
        child: Text(MyTexts.notFound),
      );
  Widget get _waitingWidget => const Center(
        child: CircularProgressIndicator(),
      );
}
