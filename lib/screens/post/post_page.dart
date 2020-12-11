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
          WidgetUtils.headerPost(index),
          InkWell(
            child: _imageGrid(index),
            onTap: () => Navigator.of(context).pushNamed('detailPostPage'),
            ),
          _footerPost()
        ]),
      );
      }
    );
  }


  Widget _imageGrid(int index) {
    return Container(
          height: MediaQuery.of(context).size.height * 0.40,
          child: Row(
            children: [
              _imageLarge(index),
              _imagesSmall(index),
            ],
          )
          );
  }

    Widget _imageLarge(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: _pictureLarge('$index 0'),
    );
  }

  Widget _imagesSmall(int index) {
    return Column(
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: _picture('${index+1} 0'),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: _picture('${index+2} 0'),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: _picture('${index+3} 0'),
                    ),
                  ),
                ],
              );
  }

  Widget _footerPost() {
    return Container(
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
                WidgetUtils.textInfoPost('Lote:', '00040'),
                WidgetUtils.textInfoPost('Cantidad:', '10'),
                WidgetUtils.textInfoPost('Peso total:', '1.000 kg'),
                WidgetUtils.dividerItem(context, 8.0, 5.0),
                WidgetUtils.textInfoPost('Precio base:', '\$ 4.600'),
                WidgetUtils.textInfoPost('Precio puja:', '\$ 4.600'),
              ],
            ),
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
          image: NetworkImage('https://picsum.photos/300/450?random=$id')
          );
  }
}
