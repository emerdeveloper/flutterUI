import 'package:flutter/material.dart';

import 'package:ChatRoom/widgets/pictures_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostPage extends StatefulWidget {
  PostPage({Key key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _appBar() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        color: Colors.black,
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.store),
          color: Colors.black,
          onPressed: () {},
        )
      ],
    );
  }

  Widget _body() {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      itemBuilder: (BuildContext context, int index) {
        return Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                Container(
                    width: 55,
                    height: 55,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: WidgetUtils.pictureProfileRounded(
                        'https://picsum.photos/300/300?random=$index')),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rogelio Rodriguez',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w800, height: 1.0)),
                        Container(
                          margin: EdgeInsets.only(top: 2.0, left: 5.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue[700],
                            radius: 7.0,
                            child: Icon(
                              Icons.star,
                              size: 9.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text('Planeta Rica, Córdoba',
                        style: TextStyle(
                          height: 1.0,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                )
              ],
            ),
          ),
          Container(
          height: MediaQuery.of(context).size.height * 0.45,
          color: Colors.red,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: _pictureLarge('$index 0'),
                color: Colors.black,
              ),
              Column(
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: _picture('${index+1} 0'),
                      color: Colors.green,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: _picture('${index+2} 0'),
                      color: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: _picture('${index+3} 0'),
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            ],
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('3 días', style: TextStyle(fontSize: 16.0)),
                    IconButton(icon: Icon(FontAwesomeIcons.heart), onPressed: (){}),
                  ],
                ),
                _textInfoPost('Lote:', '00040'),
                _textInfoPost('Cantidad:', '10'),
                _textInfoPost('Peso total:', '1.000 kg'),
                WidgetUtils.dividerItem(context, 8.0, 5.0),
                _textInfoPost('Precio base:', '\$ 4.600'),
                _textInfoPost('Precio puja:', '\$ 4.600'),
              ],
            ),
          ),
        ]),
      );
      }
    );
  }

  Widget _textInfoPost(String principalText, String secundaryText) {
    return Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: WidgetUtils.customTextSubtitle(principalText)
            ),
          WidgetUtils.customTextSecundary(secundaryText)
        ],
      );
  }

  Widget _picture(String id) {
    return FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://picsum.photos/300/300?random=$id')
          );
  }

  Widget _pictureLarge(String id) {
    return FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://picsum.photos/300/500?random=$id')
          );
  }
}
