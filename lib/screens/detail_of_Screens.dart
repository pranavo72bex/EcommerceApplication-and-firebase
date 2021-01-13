import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    icon: Icon(Icons.add_shopping_cart_rounded),
                    onPressed: () {}),
              ],
            ),
          ),
          Container(
            height: size * 0.70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Stack(
              children: [
                Container(
                    height: size * 0.5,
                    child: new Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return new Image.network(
                          "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg",
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: 3,
                      autoplay: true,
                      viewportFraction: 0.8,
                      scale: 0.9,
                      pagination: SwiperPagination(),
                    )),
                textOnCard(
                    "Adidas shoes", 20.0, 90.0, Colors.black, FontWeight.bold),
                textOnCard(
                    "Rs 500", 20.0, 70.0, Colors.blue, FontWeight.normal),
                textOnCard(
                    "This product is excluded from all promotional.This product is excluded from all promotional.This product is excluded from all promotional",
                    20.0,
                    40.0,
                    Colors.black,
                    FontWeight.normal)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 40,
              margin: EdgeInsets.only(left: 40, right: 40),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[800],
                        offset: Offset(4.0, 4.0),
                        blurRadius: 20,
                        spreadRadius: 3),
                    BoxShadow(
                        color: Colors.grey[700],
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 20,
                        spreadRadius: 3)
                  ]),
              child: Center(child: Text("payment method"))),
        ],
      ),
    );
  }

  Widget textOnCard(text, double left, double bottom, colo, dynamic weights) {
    return Positioned(
        left: left,
        bottom: bottom,
        child: Text(
          "$text",
          style: TextStyle(fontWeight: weights, color: colo),
        ));
  }
}
