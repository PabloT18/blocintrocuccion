import 'package:delivery_app/src/models/store_model.dart';
import 'package:delivery_app/src/utils/responsive.dart';
import 'package:delivery_app/src/views/place/place_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NegocioCard extends StatelessWidget {
  const NegocioCard({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlacePage(place: store)));
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(10.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: responsive.diagonalP(35),
          // width: double.infinity,
          child: Column(
            children: <Widget>[
              FadeInImage(
                  height: responsive.diagonalP(13.5),
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(store.imageurl!)),
              Padding(
                padding: const EdgeInsets.all(
                  5.0,
                ),
                child: ListTile(
                  leading: Container(
                    height: responsive.diagonalP(5),
                    width: responsive.diagonalP(5),
                    color: Colors.amber,
                  ),
                  title: Text(store.name!),
                  subtitle: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.star,
                        size: 10.0,
                        color: Colors.blue[900],
                      ),
                      Text(
                        '${store.score}',
                        style: TextStyle(
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
