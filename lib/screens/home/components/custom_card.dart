import 'package:flutter/material.dart';
import 'package:university_helper/models/university_info.dart';
import 'package:university_helper/screens/home/components/tag_university.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key, required this.isSearchByMajors, required this.dataUniversity})
      : super(key: key);
  final UniversityInfo dataUniversity;
  final bool isSearchByMajors;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 105,
                width: 105,
                child: Image.network(
                  dataUniversity.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              TagUniversity(),
            ]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataUniversity.name,
                      style: TextStyle(
                        fontFamily: 'Lora',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      softWrap: true,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                        ),
                        Text(
                          '8.1',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.amber,
                            fontFamily: 'BreeSerif',
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Tốt (99 đánh giá)',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                        ),
                      ],
                    ),
                    isSearchByMajors
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Công nghệ thông tin'),
                              Text('Điểm năm 2020: 30'),
                            ],
                          )
                        : Text('25 ngành'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
