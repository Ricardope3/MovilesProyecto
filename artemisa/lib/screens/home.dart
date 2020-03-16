import 'package:artemisa/screens/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'listing.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> casas = [
      "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=80",
      "https://images.unsplash.com/photo-1475855581690-80accde3ae2b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
      "https://images.unsplash.com/photo-1430285561322-7808604715df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
      "https://images.unsplash.com/photo-1464146072230-91cabc968266?ixlib=rb-1.2.1&auto=format&fit=crop&w=2880&q=80",
      "https://images.unsplash.com/photo-1501635238895-63f29cfc06b3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80",
      "https://images.unsplash.com/photo-1572120360610-d971b9d7767c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50, right: 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  child: CircleAvatar(
                    child: Image.network(
                        "https://randomuser.me/api/portraits/men/20.jpg"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 10,
                bottom: 10,
              ),
              child: Text(
                "Hola Ricardo",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 40,
              ),
              child: Text(
                "Encuentra una casa",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 40,
                right: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: TextFormField(
                  onChanged: (val) {},
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Donde estas buscando?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Text(
                "Popular",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: height * 0.38,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: casas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PopularListing(
                      casas: casas,
                      index: index,
                    );
                  }),
            ),
            SizedBox(
              height: 6000 / height,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 35),
              child: Text(
                "Cerca de ti",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: _localListingBuilder(casas),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> _localListingBuilder(List<String> casas) {
  List<Widget> localListings = [];
  for (var i = 0; i < casas.length; i++) {
    localListings.add(
      LocalListing(
        link: casas[i],
      ),
    );
  }
  return localListings;
}

class LocalListing extends StatelessWidget {
  const LocalListing({this.link});

  final String link;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, a, b) => Listing(
            link: link,
            tag: link + "local",
          ),
        ),
      ),
      child: Container(
        height: height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: -20,
              blurRadius: 20,
              offset: Offset(0,20),              
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: height * 0.2055,
              width: height * 0.2055,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Hero(
                tag: link + "local",
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        link,
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment(0, -0.05),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(40),
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: height * 0.022,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.home,
                        color: Theme.of(context).accentColor,
                        size: 15,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Casa en San Isidro",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "\$5000",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Cuarto con baño propio",
                        style: TextStyle(),
                        overflow: TextOverflow.fade,
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

class PopularListing extends StatelessWidget {
  PopularListing({this.casas, this.index});

  final List<String> casas;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, a, b) => Listing(
            link: casas[index],
            tag: casas[index] + "popular",
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Stack(
          children: <Widget>[
            Hero(
              tag: casas[index] + "popular",
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                child: Image.network(
                  casas[index],
                  fit: BoxFit.cover,
                  width: 250,
                  height: double.infinity,
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.black87,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment(0, -0.05),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 25,
              child: Icon(
                FontAwesomeIcons.solidBookmark,
                color: Theme.of(context).primaryColor,
                size: 25,
              ),
            ),
            Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Luxury Hotel",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Salema, Portugal",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
