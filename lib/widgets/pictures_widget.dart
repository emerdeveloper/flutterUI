import 'package:flutter/material.dart';

class WidgetUtils {

  //'https://i1.wp.com/www.bitme.gg/wp-content/uploads/2020/04/Dragon-Ball_-El-di%CC%81a-que-Goku-nin%CC%83o-conocio%CC%81-a-Goku-adulto-2.jpg?w=1280&ssl=1'
  static Widget pictureProfileRounded(String imageURL, {String tagImage = ''}) {
    return AspectRatio(
      aspectRatio: 1/1,
      child: ClipOval(
        child: (tagImage.isNotEmpty) ?  pictureProfileHero(imageURL, tagImage) : _pictureProfile(imageURL)
      ),
    );
  }

  static FadeInImage _pictureProfile(String imageURL) {
    return FadeInImage(
        placeholder: AssetImage('assets/picture-profile.png'),
        image: NetworkImage(imageURL),
        fit: BoxFit.cover
      );
  }

  static Hero pictureProfileHero(String imageURL, String tagImage) {
    return Hero(
      tag: tagImage,
        child: _pictureProfile(imageURL)
    );
  }

  static Widget makeCircular(Widget widget) {
    return AspectRatio(
      aspectRatio: 1/1,
      child: ClipOval(
        child: widget
      )
    );
  }

  static BoxShadow boxShadow() {
    return BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2.0,
        blurRadius: 5.0);
  }

  static Border circularColor(BuildContext context) {
    return Border.all(
      color: Theme.of(context).primaryColor,
      width: 2.0
    );
  }

  static TextStyle styleTextTime() {
    return TextStyle(fontSize: 12.0, color: Colors.black45);
  }

  static TextStyle styleTextMessage() {
    return TextStyle(fontSize: 14.0, color: Colors.black54);
  }

  static Text customTextSubtitle(String text) {
    return Text(text, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800, height: 1.2));
  }

  static Text customTextSecundary(String text) {
    return Text(text, style: TextStyle(fontSize: 18.0, color: Colors.black54, fontWeight: FontWeight.w700, height: 1.2));
  }

  static Widget dividerItem(BuildContext context, double marginTop, double marginBottom) {
    return Container(
            margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
            height: 0.5, 
            width: MediaQuery.of(context).size.width * 0.9, 
            color:  Colors.grey[400]
            );
  }   

}