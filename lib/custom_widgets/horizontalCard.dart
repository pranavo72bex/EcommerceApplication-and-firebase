import 'package:flutter/material.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/text_on_card.dart';
import 'package:youtube_tutorial_ecommerce/screens/detail_of_Screens.dart';

class HorizontalCard extends StatelessWidget {
  final String name;
  final String price;

  HorizontalCard({this.name, this.price});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // gradient: LinearGradient(
            //     begin: Alignment.bottomLeft,
            //     end: Alignment.topRight,
            //     colors: [Colors.blue, Colors.red])
            color: Colors.white),
        child: Stack(
          children: [
            Positioned(
                child: Image.asset(
              "Assets/images/shoes1.png",
            )),
            TextOnCard(text: "$name", left: 280.0, bottom: 45.0),
            TextOnCard(text: "$price", left: 280.0, bottom: 10.0),
          ],
        ),
      ),
    );
  }
}
