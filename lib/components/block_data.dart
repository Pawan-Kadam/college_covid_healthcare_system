import 'package:flutter/material.dart';

class BlockData extends StatelessWidget {
  BlockData({Key? key, required this.blockText, required this.blockIcon})
      : super(key: key);
  final String blockText;
  final IconData blockIcon;
  TextStyle kBlockTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          blockIcon,
          size: size.aspectRatio * 160,
        ),
        SizedBox(
          // height: 15,
          height: size.height * 0.015,
        ),
        Text(
          blockText,
          style: kBlockTextStyle,
        ),
      ],
    );
  }
}
