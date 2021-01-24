import 'package:coingecko_api/data.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Data(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
