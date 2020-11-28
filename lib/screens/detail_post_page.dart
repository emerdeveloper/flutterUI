import 'package:ChatRoom/widgets/slide_dots.dart';
import 'package:flutter/material.dart';

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
    return SafeArea(
        child: Container(
      child: Column(
        children: [
          Expanded(
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
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var i = 0; i < 4; i++) SlideDots(isActive: _currentPage == i)
            ],
          )
        ],
      ),
    ));
  }
}
