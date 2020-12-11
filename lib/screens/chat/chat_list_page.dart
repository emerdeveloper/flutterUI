import 'package:ChatRoom/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:ChatRoom/widgets/pictures_widget.dart';

class ChatListPage extends StatefulWidget {
  ChatListPage({Key key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final users = ["A", "B", "C", "D", "E", "F", "G", "H", "I"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _chatList());
  }

  AppBar _appBar() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 1,
      title: Text('Lista de chats'),
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(Icons.search_rounded),
            color: Colors.black,
            onPressed: () {})
      ],
    );
  }

  Widget _chatList() {
    return ListView.builder(
        itemCount: users.length,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () => Navigator.pushNamed(context, 'chatRoomPage'),
              child: _chatItem(index));
        });
  }

  Widget _chatItem(int index) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            children: [_userImage(index.toString()), _messagePreviewArea()],
          ),
        )
      ],
    );
  }

  Widget _userImage(String index) {
    String imageTag = 'TagImage$index';
    return Stack(
      children: [
        Container(
          height: 65.0,
          //padding: EdgeInsets.all(2.0),//To circular color
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32.5)),
              boxShadow: [WidgetUtils.boxShadow()],
              border: null //WidgetUtils.circularColor(context)
              ),
          child: WidgetUtils.pictureProfileRounded( 'https://picsum.photos/300/300?random=$index', tagImage: imageTag),
        ),
        Positioned.fill(
          child: WidgetUtils.makeCircular(Material(
            color: Colors.transparent,
            child: InkWell(
              //onTap: () => Navigator.pushNamed(context, 'viewImagePage', arguments: {'imageIndex' : index.toString()}),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                  opaque: false,
                  pageBuilder: getBuilderViewimagePage(index.toString()))
                  );
              },
            ),
          )),
        ),
      ],
    );
  }

  Expanded _messagePreviewArea() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          children: [
            _messagePreviewNameAndTime(),
            SizedBox(height: 5.0),
            _messagePreviewMessageAndBadge(),
          ],
        ),
      ),
    );
  }

  Row _messagePreviewMessageAndBadge() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, //Set elements at top of row
      children: [
        Expanded(
          child: Text(
            'Sabías que los seis puntos en la frente de Krilin son de quemaduras de incienso por haber entrenado en el tempo de Orin.',
            style: WidgetUtils.styleTextMessage(),
            overflow: TextOverflow.ellipsis, //to show continues dot
            maxLines: 2,
          ),
        ),
        CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 12.0,
            child:
                Text('8', style: TextStyle(fontSize: 14, color: Colors.black))),
      ],
    );
  }

  Row _messagePreviewNameAndTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text('Nombre',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start)),
        Text('12:30 pm', style: WidgetUtils.styleTextTime())
      ],
    );
  }
}
