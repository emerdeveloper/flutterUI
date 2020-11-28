import 'package:flutter/material.dart';


import 'package:ChatRoom/screens/detail_post_page.dart';
import 'package:ChatRoom/screens/post_page.dart';
import 'package:ChatRoom/screens/chat_list_page.dart';
import 'package:ChatRoom/screens/chat_room_page.dart';
import 'package:ChatRoom/screens/home/home_page.dart';
import 'package:ChatRoom/screens/view_image_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder> {
    '/'               : (BuildContext context) => HomePage(),
    'chatListPage'    : (BuildContext context) => ChatListPage(),
    'chatRoomPage'    : (BuildContext context) => ChatRoomPage(),
    'postPage'        : (BuildContext context) => PostPage(),
    'detailPostPage'  : (BuildContext context) => DetailPostPage(),
    //'viewImagePage'    : getBuilderViewimagePage(),
  };
}

Function getBuilderViewimagePage(String data) {
  return (BuildContext context, Animation<double>  firstanimation, Animation<double> secondAanimation) => ViewImagePage(data: data);
}