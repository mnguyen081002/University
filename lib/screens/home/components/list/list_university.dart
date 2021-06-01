import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/providers/university_provider.dart';

import '../card/custom_card.dart';

class ListUniversity extends StatelessWidget {
  const ListUniversity({
    Key? key,
    required this.isSearchByMajors,
    this.scrollController,
  }) : super(key: key);

  final ScrollController? scrollController;
  final bool isSearchByMajors;

  @override
  Widget build(BuildContext context) {
    return Consumer<UniversityProvider>(
      builder: (context, dataUniversity, _) {
        return dataUniversity.listUniversity.isEmpty
            ? Center(child: Text('Something Wrong'))
            : ListView.builder(
                controller: scrollController,
                primary: false,
                padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                itemCount: dataUniversity.listUniversity.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    dataUniversity: dataUniversity.listUniversity[index],
                    isSearchByMajors: isSearchByMajors,
                  );
                },
              );
      },
    );
  }
}
