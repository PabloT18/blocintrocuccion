import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget(
      {Key? key,
      required this.title,
      this.imgTitlePath,
      required this.imgBackgorundPat,
      this.imgBackgrounSize = 20})
      : super(key: key);

  final String? title;
  final String? imgTitlePath;
  final String? imgBackgorundPat;
  final double imgBackgrounSize;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.chevronLeft),
        onPressed: () => Navigator.of(context).pop(),
        iconSize: 18,
        color: Colors.black,
      ),
      elevation: 10.0,
      backgroundColor: Colors.white,
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Row(
          children: [
            Text(
              title!,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        background: Image(
          image: NetworkImage(imgBackgorundPat!),
          fit: BoxFit.fill,
          // placeholder: AssetImage('assets/images/jar-loading.gif'),
          // fadeInDuration: Duration(milliseconds: 150),
        ),
      ),
    );
  }
}
