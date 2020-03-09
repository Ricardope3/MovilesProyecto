
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Listing extends StatelessWidget {
  String link;
  Listing({this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 7,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: link,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)),
                        child: Image.network(
                          link,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black45, Colors.transparent],
                          begin: Alignment.topCenter,
                          end: Alignment(0, 0.02),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 55, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          Icon(
                            FontAwesomeIcons.bookmark,
                            color: Colors.white,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 9,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Grand Hotel Palu",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "4,9",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 19),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tarano, Italy",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
