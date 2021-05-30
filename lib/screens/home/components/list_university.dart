import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/providers/dataUniversityProvider.dart';

import 'custom_card.dart';

class ListUniversity extends StatelessWidget {
  const ListUniversity({
    Key? key,
    required this.isSearchByMajors,
  }) : super(key: key);

  final bool isSearchByMajors;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<DataUniversityProvider>(
      builder: (context, dataUniversity, _) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: size.height / 1.3),
          child: ListView.builder(
            itemCount: dataUniversity.listUniversity.length,
            itemBuilder: (context, index) {
              return CustomCard(
                dataUniversity: dataUniversity.listUniversity[index],
                isSearchByMajors: isSearchByMajors,
              );
            },
          ),
        );
      },
    );
  }
}
