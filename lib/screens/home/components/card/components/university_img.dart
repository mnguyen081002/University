import 'package:flutter/material.dart';
import 'package:university_helper/models/university.dart';

class UniversityImg extends StatelessWidget {
  const UniversityImg({
    Key? key,
    required this.dataUniversity,
  }) : super(key: key);

  final University dataUniversity;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(10),
        ),
      ),
      height: size.height * 1 / 7,
      width: size.width / 1.5,
      child: Image.network(
        dataUniversity.imageUrl,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Image.asset(
            'assets/loading.gif',
            fit: BoxFit.cover,
          );
        },
        errorBuilder: (context, child, stackTrace) {
          return Image.asset(
            'assets/noImage.jpg',
            fit: BoxFit.cover,
          );
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
