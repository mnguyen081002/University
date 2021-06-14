import 'package:flutter/material.dart';

class PopularAppbar extends StatelessWidget {
  const PopularAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 130,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://www.niche.com/blog/wp-content/uploads/2017/01/list-of-majors-1910px.png',
          fit: BoxFit.cover,
        ),
        title: Text('Các ngành hot'),
        centerTitle: true,
      ),
    );
  }
}
