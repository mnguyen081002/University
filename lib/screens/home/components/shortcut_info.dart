import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_helper/models/university.dart';

class ShortCutInfo extends StatelessWidget {
  const ShortCutInfo({
    Key? key,
    required this.dataUniversity,
    required this.isSearchByMajors,
  }) : super(key: key);

  final University dataUniversity;
  final bool isSearchByMajors;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: SizedBox(
        height: size.height * 1 / 8,
        width: size.width - size.width * 1 / 3 - 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                dataUniversity.name,
                style: TextStyle(
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                softWrap: true,
              ),
            ),
            Spacer(),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16,
                ),
                Text(
                  '8.1',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 30),
                Text(
                  'Tốt ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '- 100 đánh giá',
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            isSearchByMajors
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Ngành:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
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
                            style: TextStyle(fontSize: 12),
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
                  )
                : Text('25 ngành'),
          ],
        ),
      ),
    );
  }
}
