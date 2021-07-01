import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/data/models/university.dart';
import 'package:university_helper/app/global_widgets/search/search_shared_preferences.dart';
import 'package:university_helper/app/modules/detail/detail_screen.dart';
import 'package:university_helper/app/modules/search/controllers/search_controller.dart';
import 'package:university_helper/app/modules/suggest/controller/suggest_screen_controller.dart';
import 'package:university_helper/app/utils/custom_search.dart';

import 'list_suggest.dart';

class MySearchDelegate extends CustomSearchDelegate<dynamic> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return query.isEmpty
        ? [Container()]
        : [
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.clear),
              ),
              onTap: () {
                query = '';
              },
            ),
          ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: Icon(CupertinoIcons.back),
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
    Get.lazyPut(() => SearchScreenController());
    return FutureBuilder(
      future: Get.find<SuggestScreenController>()
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
