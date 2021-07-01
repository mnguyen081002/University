import 'package:flutter/material.dart';
import 'package:university_helper/app/utils/theme/text_theme.dart';

class Topic extends StatelessWidget {
  const Topic({
    required this.topic,
    Key? key,
  }) : super(key: key);
  final String topic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        topic,
        style: kTitleTextStyle,
      ),
    );
  }
}
