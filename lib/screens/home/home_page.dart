import 'package:ChatRoom/screens/home/buyer/buyer_categories.dart';
import 'package:ChatRoom/screens/home/seller/seller_categories.dart';
import 'package:flutter/material.dart';

import 'package:ChatRoom/models/ui/Contact.dart';
import 'package:ChatRoom/screens/home/buyer/buyer_bottomNavigationBar.dart';
import 'package:ChatRoom/screens/home/seller/seller_bottomNavigationBar.dart';
import 'package:ChatRoom/widgets/custom_text.dart';
import 'package:ChatRoom/widgets/pictures_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Contact> contacts = [
    Contact("assets/images/veterinaria.png", "Veterinarios", "Profesional que te dará un concepto del estado de salud de tus bovinos", Colors.purple[50]),
    Contact("assets/images/currier.png", "Transportadores", "profesional con transporte adecuado para llevar a tus bovinos a su destino", Colors.deepOrange[50]),
  ];
  
  final List<Contact> profiles = [
    Contact("assets/images/dulce.png", "Comprador", "Puedes ver publicaciones", Colors.purple[50]),
    Contact("assets/images/bebida.png", "Vendedor", "Crea una publicación de venta", Colors.deepOrange[50]),
  ];

  bool isBuyer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: !isBuyer ? BuyerBottomNavigationBar() : SellerBottomNavigationBar(),
    );
  }

  Widget _appBar() {
    return AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                borderRadius: BorderRadius.circular(15.0),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () => _changeProfile(context),
                  child: Row(children: [
                    Icon(Icons.account_circle_outlined, color: Colors.black87),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        'Perfil',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w800),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down_rounded, color: Colors.black87)
                  ]),
                ),
              ),
              IconButton(
                icon: Icon(Icons.notifications_none),
                color: Colors.black87,
                onPressed: () {
                  //Navigator.of(context).pushNamed(RoutePaths.AddressScreen);
                },
              )
            ],
          ),
        ));
  }

  Widget _body() {
    return SafeArea(
          child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: _locationSection(),
            ),
            SliverToBoxAdapter(
              child: !isBuyer ? CategoriesBuyer() : CategoriesSeller(),
            ),
            SliverToBoxAdapter(
              child: _contactsHeader(),
            ),
            _contactsSection()
          ],
        ),
    );
  }

  Widget _locationSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200].withOpacity(0.85),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20.0),
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CustomText('Mi ubicación', 20, Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.location_on_rounded,
              color: Colors.black54,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactsSection() {
    return SliverList(
      delegate: SliverChildListDelegate(
        contacts.map((contact) => _contactItem(contact, 80.0, Container(), false)).toList(),
      ));
  }

  Widget _contactsHeader() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
            height: 0.5, 
            width: MediaQuery.of(context).size.width * 0.9, 
            color:  Colors.grey[400]
            ),
          Text('Contactar', style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }

  Widget _contactItem(Contact contact, double cardSize, Widget divider, bool isFinalItem) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          divider,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                          height: cardSize,
                          width: cardSize,
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(right: 15.0),
                          decoration: BoxDecoration(
                            color: contact.colorcard,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          child: Image.asset(contact.path)
                        ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contact.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800)),
                          SizedBox(height: 3.0,),
                          Text(contact.description,
                          style: TextStyle(
                            height: 1.0,
                            fontSize: 18.0, 
                            fontWeight: FontWeight.w500,
                            )),
                        ],
                      ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
          isFinalItem ? divider : Container()
        ],
      ),
    );
  }

  void _changeProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical:20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text('Selecciona un perfil', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w800))
                ),
              Column(
                children: [
                  for (int i = 0; i < profiles.length; i++ )
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: _contactItem(profiles[i], 55.0, WidgetUtils.dividerItem(context, 5.0, 8.0), (i == profiles.length-1)),
                      onTap: () => _selecteProfile(i),
                      ),
                  )
                ],
              )
            ],
          ),
        );
      }
      );
  }

  void _selecteProfile(int index) {
    if ((index == 0 && isBuyer) || (index == 1 && !isBuyer)) {
      setState(() {
        Navigator.pop(context);
        isBuyer = !isBuyer;
      });
    } else {

    }
  }
   
}
