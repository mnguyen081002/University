import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_helper/models/university.dart';

class InfoUniversity extends StatelessWidget {
  const InfoUniversity({
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
            Text(
              dataUniversity.name,
              style: TextStyle(
                fontFamily: 'Lora',
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              softWrap: true,
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
                    fontFamily: 'BreeSerif',
                  ),
                ),
                SizedBox(width: 50),
                Text(
                  'Tốt - 100 đánh giá',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Lora',
                  ),
                ),
              ],
            ),
            isSearchByMajors
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ngành: Công nghệ thông tin',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Row(
                        children: [
                          Text('Điểm năm 2020: '),
                          Text(
                            '30',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
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
