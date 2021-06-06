import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/screens/home/controllers/home_controller.dart';
import 'package:university_helper/app/utils/search_shared_preferences.dart';

import 'list_suggest.dart';

class UniversitySearchDelegate extends SearchDelegate<String> {
  final List recentUniversity = ['Nothings'];

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
    final name = SearchSharedPreferences.getHistory();
    print(query.capitalizeFirst);
    return FutureBuilder(
      future: Get.find<HomeScreenController>()
          .searchUniversity(query.trimLeft().capitalize!),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        late final suggestionList;
        if (snapshot.hasData && query.isNotEmpty) {
          suggestionList = snapshot.data;
        } else {
          suggestionList = name ?? recentUniversity;
        }
        return ListSuggest(
          suggestionList: suggestionList,
          query: query.capitalize!,
        );
      },
    );
  }
}
