import 'package:flutter/material.dart';

import 'package:ChatRoom/routes/routes.dart';
import 'package:ChatRoom/screens/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat List APP',
      theme: AppTheme().theme,
      //home: ChatListPage()
      initialRoute: 'homePage',
      routes: getAplicationRoutes(),
    );
  }
}