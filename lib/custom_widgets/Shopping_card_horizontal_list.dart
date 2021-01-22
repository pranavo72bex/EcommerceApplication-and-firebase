import 'package:flutter/material.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/text_on_card.dart';
import 'package:youtube_tutorial_ecommerce/screens/detail_of_Screens.dart';

class ShoppingCardContainer extends StatelessWidget {
  final String name;
  final String price;
  final String number;
  ShoppingCardContainer({this.name, this.number, this.price});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage()));
      },
      child: AspectRatio(
        aspectRatio: 2.3 / 3,
        child: Container(
          height: 180,
          margin: EdgeInsets.only(
            left: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            // gradient: LinearGradient(
            //     begin: Alignment.bottomLeft,
            //     end: Alignment.topRight,
            //     colors: [Colors.purple, Colors.blue]),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            children: [
              Image.asset(
                "Assets/images/shoes1.png",
              ),
              TextOnCard(text: "$name", left: 10.0, bottom: 40.0),
              TextOnCard(text: "$price", left: 10.0, bottom: 10.0),
              TextOnCard(text: "$number", left: 10.0, bottom: 150.0),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    child: IconButton(
                      icon: Icon(Icons.add_shopping_cart_rounded),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
