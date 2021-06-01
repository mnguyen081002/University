import 'package:flutter/material.dart';
import 'package:university_helper/utils/widgets/search/search_bar.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key? key,
    this.hintText = 'Search',
  }) : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchBar(hintText: hintText),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.filter_list_alt,
                color: Theme.of(context).accentColor,
              ),
              Text(
                'Lọc',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
