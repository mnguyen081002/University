import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/models/university.dart';
import 'package:university_helper/app/screens/home/controllers/home_controller.dart';

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
        Get.find<HomeScreenController>().searchUniversity(query);

    final List<University> suggestionList =
        query.isEmpty ? recentUniversity : searchProduct;

    return ListSuggest(
      suggestionList: suggestionList,
      word: query,
    );
  }
}
