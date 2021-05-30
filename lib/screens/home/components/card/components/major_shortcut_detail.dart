import 'package:flutter/material.dart';

class MajorShortcutDetail extends StatelessWidget {
  const MajorShortcutDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Ngành:',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                text: ' Công nghệ thông tin',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Row(
          children: [
            Text(
              'Điểm năm 2020: ',
              style: Theme.of(context).textTheme.bodyText1!,
            ),
            Text(
              '30',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            )
          ],
        )
      ],
    );
  }
}
