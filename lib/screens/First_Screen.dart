import 'package:flutter/material.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/searchbar_firstscreen.dart';
import 'package:youtube_tutorial_ecommerce/screens/detail_of_Screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isOpenDrawer = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      color: Colors.grey[600],
      duration: Duration(milliseconds: 250),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isOpenDrawer
                  ? IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isOpenDrawer = false;
                        });
                      })
                  : IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          xOffset = 230;
                          yOffset = 150;
                          scaleFactor = 0.8;
                          isOpenDrawer = true;
                        });
                      }),
              Text(
                "Shope Name",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ],
          ),
          SEARCHBAR(),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Text(
              "Categories",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          //vertical card
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Container(
              margin: EdgeInsets.only(left: 5, top: 10),
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  card("Nike", "Rs200", "01"),
                  card("puma", "Rs300", "02"),
                  card("Shikhar", "Rs200", "03"),
                  card("Addidas", "Rs400", "04"),
                  card("jpt", "Rs400", "05")
                ],
              ),
            ),
          ),
          //horizontal card
          SizedBox(
            height: 20,
          ),
          horizontalContainers("Adidas", "5000"),
          SizedBox(
            height: 10,
          ),
          horizontalContainers("puma", "5000"),
          SizedBox(
            height: 10,
          ),
          horizontalContainers("Shikhar", "5000"),
          SizedBox(
            height: 10,
          ),
          horizontalContainers("jpt", "5000"),
          SizedBox(
            height: 10,
          ),
          horizontalContainers("puma", "5000"),
          SizedBox(
            height: 10,
          ),
          horizontalContainers("Shikhar", "5000"),
        ],
      ),
    );
  }

  Widget card(name, price, number) {
    return AspectRatio(
      aspectRatio: 2.3 / 3,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.black, Colors.white]),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[800],
                  offset: Offset(1, 1),
                  blurRadius: 3,
                  spreadRadius: 1),
              BoxShadow(
                  color: Colors.grey[900],
                  offset: Offset(1, 1),
                  blurRadius: 3,
                  spreadRadius: 1)
            ]),
        child: Stack(
          children: [
            //how to add image  ???
            positionOfTextOnCard("$name", 10.0, 40.0),
            positionOfTextOnCard("$price", 10.0, 10.0),
            positionOfTextOnCard("$number", 10.0, 150.0),
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
    );
  }

  Widget horizontalContainers(products, prices) {
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
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.black, Colors.white])),
        child: Stack(
          children: [
            positionOfTextOnCard("$products", 20, 45),
            positionOfTextOnCard("Rs $prices", 20, 10)
            //yesko side ma image halney
          ],
        ),
      ),
    );
  }

  Widget positionOfTextOnCard(textName, double left, double bottom) {
    return Positioned(
        bottom: bottom,
        left: left,
        child: Text(
          "$textName",
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
