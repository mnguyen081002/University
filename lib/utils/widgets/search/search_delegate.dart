import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/models/university.dart';
import 'package:university_helper/providers/dataUniversityProvider.dart';

import 'list_suggest.dart';

class UniversitySearchDelegate extends SearchDelegate<String> {
  final List<University> recentUniversity = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchProduct =
        Provider.of<DataUniversityProvider>(context, listen: false)
            .searchUniversity(query);

    final List<University> suggestionList =
        query.isEmpty ? recentUniversity : searchProduct;

    return ListSuggest(suggestionList: suggestionList);
  }
}
