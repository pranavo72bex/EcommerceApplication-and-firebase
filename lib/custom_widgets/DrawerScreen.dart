import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 7),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
              backgroundColor: Colors.transparent,
            ),
          ),
          sideNaviation_components("For Business"),
          sideNaviation_components("For Murchent"),
          sideNaviation_components("For partner"),
          sideNaviation_components("Products and Services"),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget sideNaviation_components(heading) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 30),
      child: InkWell(
        onTap: () {},
        child: Text(
          "$heading",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }
}
