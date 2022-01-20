import 'package:flutter/material.dart';

class ReusableBlock extends StatelessWidget {
  ReusableBlock({Key? key, required this.blockChild}) : super(key: key);

  final Widget blockChild;
  // final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: blockChild,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
