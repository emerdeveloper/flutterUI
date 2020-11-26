import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:ChatRoom/utils/color_utlils.dart';
import 'package:ChatRoom/widgets/pictures_widget.dart';

class ChatRoomPage extends StatefulWidget {
  ChatRoomPage({Key key}) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {

  final messages = ["A", "B", "C", "D", "E", "F", "G", "H", "I"];
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    _scrollController = ScrollController();
    _myCallback(() {
      _scrollWithoutAnimation();
    });
    return Scaffold(
      backgroundColor: getBackgroundColor(),
      appBar: _appBar(),
      body: _body(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _appBar() {
    return AppBar(
        brightness: Brightness.dark, //change color of icons indicator at top screen
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: 'Emerson Javid',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            TextSpan(text: '\n'),
            TextSpan(
                text: 'En Linea',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black))
          ]),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ));
  }

  Widget _body() {
    return Column(children: [
      Expanded(
          //send messageArea section at screen bottom
          child: ListView.builder(
            padding: EdgeInsets.all(20.0),
            controller: _scrollController,
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _containerMessageBubble(index.toString()),
                _infoOwnerMessage()
              ],
            );
            })
          
          ),
          _sendMessageArea()
    ]);
  }

  Widget _containerMessageBubble(String message) {
    return Container(
      //set size container message bubble
      alignment: Alignment.topLeft,
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.80),
      child: Container(
        //container message bubble
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [WidgetUtils.boxShadow()]),
        child: Text(
            '$message Esto es un mensaje que es lo más de largo e incluso puede estar en varias lineas, como lo puedes ver',
            style: WidgetUtils.styleTextMessage()),
      ),
    );
  }

  Widget _infoOwnerMessage() {
    return Row(
      children: [
        _imageprofileUser(),
        SizedBox(width: 10),
        Text('Lunes 22 - 12:00 pm', style: WidgetUtils.styleTextTime())
      ],
    );
  }

  Widget _imageprofileUser() {
    return Container(
      height: 30.0,
      width: 30.0,
      decoration:
          BoxDecoration(shape: BoxShape.circle, boxShadow: [WidgetUtils.boxShadow()]),
      child: WidgetUtils.pictureProfileRounded(
          'https://i1.wp.com/www.bitme.gg/wp-content/uploads/2020/04/Dragon-Ball_-El-di%CC%81a-que-Goku-nin%CC%83o-conocio%CC%81-a-Goku-adulto-2.jpg?w=1280&ssl=1'),
    );
  }

  Widget _sendMessageArea() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 70.0,
        color: Colors.white,
        child: Row(children: [
          _buttonOnMessageArea(Icon(Icons.photo), () {}),
          _textFieldMessage(),
          _buttonOnMessageArea(Icon(Icons.send), _scrollAnimation),
        ]));
  }

  Widget _textFieldMessage() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: TextField(
          decoration:
              InputDecoration.collapsed(hintText: 'Escribir un mensaje'),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          showCursor: true,
          textCapitalization: TextCapitalization.sentences,
        ),
      ),
    );
  }

  Widget _buttonOnMessageArea(Icon icon, Function onPressedAction) {
    return Material(//to show ripple effect
      color: Colors.transparent,
      child: WidgetUtils.makeCircular(
        IconButton(
        icon: icon,
        color: Theme.of(context).primaryColor,
        iconSize: 25.0,
        onPressed: onPressedAction)
      )
    );
  }

  void _scrollAnimation() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _scrollWithoutAnimation() {
     _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  void _myCallback(Function callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}