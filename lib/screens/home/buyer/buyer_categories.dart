import 'package:ChatRoom/models/ui/Category.dart';
import 'package:flutter/material.dart';

class CategoriesBuyer extends StatelessWidget {
 CategoriesBuyer({Key key}) : super(key: key);

  final List<Category> categories = [
    Category("assets/images/to-bull.png", "Toro", Colors.purple[50]),
    Category("assets/images/ve-cow.png", "Vaca\nescotera", Colors.deepOrange[50]),
    Category("assets/images/hv-cow.png", "Hembra de\nvientre", Colors.amber[50]),
    Category("assets/images/vc-cow.png", "Vaca con\nCría", Colors.red[50]),
    Category("assets/images/hl-cow.png", "Hembra de\nlevante", Colors.blue[50]),
    Category("assets/images/ml-bull.png", "Macho de\nlevante", Colors.green[50]),
    Category("assets/images/mc-bull.png", "Macho de\nceba", Colors.pink[50]),
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
                          onTap: () => Navigator.of(context).pushNamed('postPage'),
                    ),
                    Text(category.title, textAlign: TextAlign.center ,style: TextStyle(fontSize: 18.0, height: 1.0))
                  ],
                ))
        ],
      ),
    );
  }
}