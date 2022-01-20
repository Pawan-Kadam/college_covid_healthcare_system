import 'package:flutter/material.dart';
import 'reusable_block.dart';
import 'block_data.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget(
      {Key? key,
      required this.sectionName,
      required this.sectionIcon,
      required this.onPress})
      : super(key: key);
  final VoidCallback onPress;
  final String sectionName;
  final IconData sectionIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: ReusableBlock(
          // onPress: () {},
          blockChild: BlockData(
            blockIcon: sectionIcon,
            blockText: sectionName,
          ),
        ),
      ),
    );
  }
}
