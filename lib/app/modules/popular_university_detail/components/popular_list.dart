import 'package:flutter/material.dart';

import 'major_card.dart';

class PopularList extends StatelessWidget {
  const PopularList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, builder) {
          return MajorCard();
        },
      ),
    );
  }
}
