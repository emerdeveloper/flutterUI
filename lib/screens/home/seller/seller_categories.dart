import 'package:ChatRoom/models/ui/Category.dart';
import 'package:flutter/material.dart';

class CategoriesSeller extends StatelessWidget {
  CategoriesSeller({Key key}) : super(key: key);

  final List<Category> categories = [
    Category("assets/images/fruta.png", "En Venta", Colors.purple[50]),
    Category("assets/images/verdura.png", "Vendido", Colors.deepOrange[50]),
    Category("assets/images/dulce.png", "No vendido", Colors.amber[50]),
    Category("assets/images/farmacia.png", "más", Colors.red[50]),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Wrap(
        children: [
          for (var category in categories)
            Container(
                width: 90.0,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: category.colorcard,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(0.0, 0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 2.0,
                                )
                              ]),
                          child: Image.asset(category.path)),
                          onTap: () {},
                    ),
                    Text(category.title, textAlign: TextAlign.center ,style: TextStyle(fontSize: 18.0, height: 1.0))
                  ],
                ))
        ],
      ),
    );
  }
}