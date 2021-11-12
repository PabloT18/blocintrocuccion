import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleIconCustom extends StatelessWidget {
  const CircleIconCustom({
    Key? key,
    required this.icon,
    this.size = 20,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final IconData icon;
  final double size;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        // shape: BoxShape.circle,
      ),
      child: FaIcon(
        icon,
        size: size,
      ),
    );
  }
}
