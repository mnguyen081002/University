import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/data/models/university.dart';
import 'package:university_helper/app/modules/detail/detail_screen.dart';
import 'package:university_helper/app/modules/search/components/search/search_shared_preferences.dart';
import 'package:university_helper/app/modules/search/controllers/search_controller.dart';

import 'list_suggest.dart';

class UniversitySearchDelegate extends SearchDelegate<String> {
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

  void onTapUniversity(dynamic university) async {
    if (university is University) {
      print(university.name);
      await SearchSharedPreferences.setHistory(university.name);
      Get.toNamed(
        DetailScreen.routeName,
        arguments: university.universityUrl,
      );
    } else {
      query = university;
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final name = SearchSharedPreferences.getHistory();
    print(query.capitalize!.trimLeft());
    return FutureBuilder(
      future: Get.find<SearchScreenController>()
          .searchUniversity(query.capitalize!.trimLeft()),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        List suggestionList = [];
        if (snapshot.hasData && query.isNotEmpty) {
          suggestionList = snapshot.data;
        } else if (name != null) {
          suggestionList.addAll(name);
        }
        return ListSuggest(
          onTap: onTapUniversity,
          suggestionList: suggestionList,
          query: query.capitalize!,
        );
      },
    );
  }
}
