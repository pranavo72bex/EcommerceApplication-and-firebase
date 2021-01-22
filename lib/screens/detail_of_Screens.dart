import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/custom_login_buttons.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/start_rating.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final imageList = ["Assets/images/shoes1.png", "Assets/images/shoes2.png"];
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black87,
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
            height: size * 0.60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Stack(
              children: [
                Container(
                    height: size * 0.34,
                    child: new Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return new Image.asset(imageList[index]);
                      },
                      itemCount: 2,
                      autoplay: true,
                      viewportFraction: 0.8,
                      scale: 0.9,
                      pagination: SwiperPagination(),
                    )),
                textOnCard(
                    "Adidas shoes", 20.0, 130.0, Colors.black, FontWeight.bold),
                textOnCard(
                    "Rs 500", 20.0, 110.0, Colors.blue, FontWeight.normal),
                textOnCard(
                    "This product is excluded from all promotional.The \nleBron17 LMTD features a large Max Air unit in the\nheel and zoom Air curshioning for extra comfort.",
                    20.0,
                    55.0,
                    Colors.black,
                    FontWeight.normal),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: StarRating(
                    rating: rating,
                    onRatingChanged: (rating) =>
                        setState(() => this.rating = rating),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomBtn(
            text: "Payment Method",
            outlineBtn: false,
          ),
          CustomBtn(
            text: "Add To Basket",
            outlineBtn: true,
          )
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
