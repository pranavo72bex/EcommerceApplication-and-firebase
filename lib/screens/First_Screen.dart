import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:youtube_tutorial_ecommerce/contents.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/Shopping_card_horizontal_list.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/horizontalCard.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/searchbar_firstscreen.dart';

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
      color: Colors.black87,
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
                        size: 40,
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
                style: Constants.shopeName,
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
              style: Constants.shopeName,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, top: 10),
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ShoppingCardContainer(
                  name: "Nike",
                  price: "200",
                  number: "01",
                ),
                ShoppingCardContainer(
                  name: "Puma",
                  price: "200",
                  number: "01",
                ),
                ShoppingCardContainer(
                  name: "Addidas",
                  price: "200",
                  number: "01",
                ),
                ShoppingCardContainer(
                  name: "Goldstar",
                  price: "200",
                  number: "01",
                ),
                ShoppingCardContainer(
                  name: "Goldensh",
                  price: "200",
                  number: "01",
                ),
              ],
            ),
          ),

          //vertical card
          SizedBox(
            height: 20,
          ),
          HorizontalCard(
            name: "Nike",
            price: "5000",
          ),
          SizedBox(
            height: 10,
          ),
          HorizontalCard(
            name: "Puma",
            price: "5000",
          ),
          SizedBox(
            height: 10,
          ),
          HorizontalCard(
            name: "Addias",
            price: "5000",
          ),
          SizedBox(
            height: 10,
          ),
          HorizontalCard(
            name: "GoldStar",
            price: "5000",
          ),
          SizedBox(
            height: 10,
          ),
          HorizontalCard(
            name: "shikhar",
            price: "5000",
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
