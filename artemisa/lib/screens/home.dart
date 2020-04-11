import 'package:Artemisa/classes/property.dart';
import 'package:Artemisa/repositories/property_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'listing.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List<String> casas = [
      "https://thumbnails.trvl-media.com/79tIkoSNkgRD-qVN43aR2E53T7I=/582x388/smart/filters:quality(60)/images.trvl-media.com/hotels/37000000/36170000/36165900/36165869/bba65cb5_z.jpg",
      "https://img10.naventcdn.com/avisos/18/00/53/55/97/00/720x532/144271181.jpg",
      "https://img10.naventcdn.com/avisos/18/00/56/13/44/38/1200x1200/126798462.jpg",
      "https://d3te2s0dmhk13a.cloudfront.net/27267/-2128040036.jpeg",
      "https://img10.naventcdn.com/avisos/18/00/57/63/44/92/720x532/149988896.jpg",
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
                    hintText: '¿Dónde estás buscando?',
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
            _localListingBuilder()
          ],
        ),
      ),
    );
  }
}

Widget _localListingBuilder() {
  return FutureBuilder(
    future: PropertyRepository().listing(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Text(
                "Ocurrió un error al obtener las propiedades :(",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            )
          ],
        );
      }
      if (!snapshot.hasData) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: CircularProgressIndicator())
          ],
        );
      }
      final List<LocalListing> properties =
          List.from(snapshot.data.map((Property property) => LocalListing(
                link: property.pictures[0],
                title: property.title,
                id: property.id,
                price: property.monthlyPrice,
              )));
      return Column(children: properties);
    },
  );
}

class LocalListing extends StatelessWidget {
  const LocalListing({this.id, this.link, this.title, this.price});

  final String link, title, id;
  final double price;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, a, b) =>
              Listing(link: link, tag: link + 'local'),
        ),
      ),
      child: Container(
        height: height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              spreadRadius: -20,
              blurRadius: 20,
              offset: Offset(0, 12),
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
                color: Colors.white,
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
                              Colors.black45,
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
                  color: Color(0xFFFFFFFF),
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
                        this.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "\$$price",
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
                      "Cuarto en renta",
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
                      "San Isidro, Zapopan",
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
