import 'package:Artemisa/models/property.dart';
import 'package:flutter/material.dart';
import 'package:Artemisa/repositories/property_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Listing extends StatelessWidget {
  final String link, id;

  const Listing({this.link, this.id});

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
            tag: this.id,
            child: ClipRRect(
              child: Image.network(
                link,
                height: height * 0.6,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black38, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment(0, 0.02),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 30),
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
                  FontAwesomeIcons.heart,
                  color: Colors.white,
                  size: 25,
                ),
              ],
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
                                ),
                                _propertyDetailsBuilder(this.id)
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

Widget _propertyDetailsBuilder(String id) {
  return FutureBuilder(
    future: PropertyRepository().details(id),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text("ERROR WHILE RETRIEVING DATA");
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
      final DetailedProperty property = snapshot.data;
      return PropertyDetails(
        property: property,
      );
    },
  );
}

class PropertyDetails extends StatelessWidget {
  final DetailedProperty property;

  const PropertyDetails({this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.property.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xff53817f),
              fontSize: 24,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.property.neighborhood,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: const Color(0xff9aacaa),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Hosted by ${this.property.host['name']}",
                      style: TextStyle(
                        color: const Color(0xff9aacaa),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$${this.property.price}",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: <Widget>[
                Amenity(
                  icon: FontAwesomeIcons.home,
                  title: "1 cuarto particular con baño completo",
                  details: "4 cuartos en total, 3 baños y medio",
                ),
                Amenity(
                  icon: FontAwesomeIcons.userPlus,
                  title: "Compartiendo con 3 personas más",
                  details: "3 roomies hombres",
                ),
                Amenity(
                  icon: FontAwesomeIcons.shieldAlt,
                  title: "Ubicada dentro de coto con seguridad",
                  details: "Condominio cerrado",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Amenity extends StatelessWidget {
  final String title, details;
  final IconData icon;

  Amenity({this.icon, this.title, this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              this.icon,
              color: Theme.of(context).primaryColor,
              size: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.title,
                    style: TextStyle(
                      color: const Color(0xff53817f),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    this.details,
                    style: TextStyle(
                      color: const Color(0xff9aacaa),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
