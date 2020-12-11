import 'package:flutter/material.dart';

import 'package:ChatRoom/widgets/pictures_widget.dart';
import 'package:ChatRoom/widgets/slide_dots.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPostPage extends StatefulWidget {
  DetailPostPage({Key key}) : super(key: key);

  @override
  _DetailPostPageState createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  int _currentPage = 0;

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
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ));
  }

  Widget _body() {
    return Column(
      children: [Expanded(child: _post()), _footer()],
    );
  }

  Widget _post() {
    return ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/300/300?random=$index'));
            },
            onPageChanged: (int currentPage) {
              setState(() {
                _currentPage = currentPage;
              });
            },
          ),
        ),
        _slideDots(),
        WidgetUtils.headerPost(1),
        _actionIcons(),
        _textInfoPost('Lote:', '00040'),
        _textInfoPost('Lote:', '00040'),
        _textInfoPost('Cantidad:', '10'),
        _textInfoPost('Peso promedio:', '1.000 kg'),
        _textInfoPost('Peso total:', '1.000 kg'),
        _dividerItem(),
        _textInfoPost('Precio base:', '\$ 4.600'),
        _textInfoPost('Precio puja:', '\$ 4.600'),
        _dividerItem(),
        _textInfoPost('Veterinario:', 'Julian Monsalve'),
        _textInfoPost('Vacunas:', 'Todas'),
        _textInfoPost('Observacion:', 'Ninguna'),
        _dividerItem(),
        _textInfoPost('Observaciones', 'Observación general'),
      ],
    );
  }

  Widget _slideDots() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var i = 0; i < 4; i++) SlideDots(isActive: _currentPage == i)
        ],
      ),
    );
  }

  Widget _actionIcons() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('3 días', style: TextStyle(fontSize: 16.0)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(icon: Icon(FontAwesomeIcons.heart), onPressed: () {}),
            SizedBox(width: 1.0),
            IconButton(
                icon: Icon(FontAwesomeIcons.solidCommentDots),
                onPressed: () {}),
            SizedBox(width: 1.0),
            IconButton(icon: Icon(FontAwesomeIcons.phone), onPressed: () {}),
          ],
        ),
      ]),
    );
  }

  Widget _textInfoPost(String principalText, String secundaryText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: WidgetUtils.textInfoPost(principalText, secundaryText),
    );
  }

  Widget _dividerItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: WidgetUtils.dividerItem(context, 8.0, 5.0),
    );
  }

  Widget _footer() {
    return Container(
      //height: 50.0,
      padding: EdgeInsets.symmetric(vertical: 20.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bidLeft(), 
          _bidRigth()
          ],
      ),
    );
  }

  Widget _bidLeft() {
    return Container(
      height: 47.0,
      width: 155.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [ BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: Offset(0.0, 1.5),
          spreadRadius: 0.7,
          blurRadius: 2.0
        )]
      ),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.remove, color: Colors.black), onPressed: null),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: WidgetUtils.customTextSubtitle('4')
            ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.black), onPressed: null)
        ],
      ),
    );
  }

  Widget _bidRigth() {
    return Container(
      height: 47.0,
      width: 155.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [ BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: Offset(0.0, 1.5),
          spreadRadius: 0.7,
          blurRadius: 2.0
        )]
      ),
      child: Container(
            alignment: Alignment.center,
            //padding: EdgeInsets.symmetric(vertical: 10.0),
            child: WidgetUtils.customTextSubtitle('Pujar \$250.00')
            ),
    );
  }
  /*Widget _bidRigth() {
    return RaisedButton(
      child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: WidgetUtils.customTextSubtitle('4')
            ),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
      color: Colors.green, onPressed: null);
  }*/
}
