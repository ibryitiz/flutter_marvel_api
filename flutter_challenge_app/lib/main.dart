import 'package:flutter/material.dart';
import 'package:flutter_challenge_app/providers/details_page_procider.dart';
import 'package:flutter_challenge_app/providers/page_view_provider.dart';
import 'package:flutter_challenge_app/views/page_view_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageViewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailsPageProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Jersey25Charted"),
        debugShowCheckedModeBanner: false,
        home: const PageViewScreen(),
      ),
    );
  }
}
