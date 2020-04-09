import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Details extends StatelessWidget {
  final String link, tag;

  const Details({this.link, this.tag});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
          ),
          Hero(
            tag: tag,
            child: ClipRRect(
              child: Image.network(
                link,
                height: height * 0.6,
                fit: BoxFit.cover,
              ),
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.65,
              expand: true,
              maxChildSize: 1,
              minChildSize: 0.65,
              builder: (context, scrollcontroller) {
                return SingleChildScrollView(
                  controller: scrollcontroller,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: height * 0.2,
                            width: width,
                            color: Colors.transparent,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                              ),
                            ),
                            height: height * 0.8,
                            width: width,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 45,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: height * 0.15,
                        right: width * 0.1,
                        child: Material(
                          elevation: 15,
                          shadowColor: Colors.black45,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Theme.of(context).primaryColor,
                          child: InkWell(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            splashColor: Colors.white,
                            onTap: () {
                              print("Property click");
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Icon(
                                FontAwesomeIcons.calendarCheck,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
