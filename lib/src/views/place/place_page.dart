import 'package:delivery_app/src/models/store_model.dart';
import 'package:delivery_app/src/utils/responsive.dart';
import 'package:delivery_app/src/views/widgets/sliver_appbar.dart';
import 'package:flutter/material.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({Key? key, required this.place}) : super(key: key);

  final Store place;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    final Widget _sliverAppBar = SliverAppBarWidget(
      title: place.name,
      imgBackgorundPat: place.imageurl,
    );

    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        _sliverAppBar,
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Text("Olita"),
              SizedBox(
                height: responsive.alto,
              ),
              Text("Olita"),
            ],
          ),
        )
      ]),
    );
  }
}
