import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/models/university.dart';
import 'package:university_helper/app/screens/detail/detail_screen.dart';
import 'package:university_helper/app/utils/search_shared_preferences.dart';

class ListSuggest extends StatelessWidget {
  final String query;
  const ListSuggest({
    Key? key,
    required this.suggestionList,
    required this.query,
  }) : super(key: key);
  final List suggestionList;

  String highlightWord(String query, String name) {
    String result = name.replaceFirst('$query', '<b>$query</b>');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () async {
            await SearchSharedPreferences.setHistory(
                suggestionList[index].name);
            Get.offAndToNamed(
              DetailScreen.routeName,
              arguments: suggestionList[index].id,
            );
          },
          leading: Icon(Icons.school),
          title: suggestionList[index] is University
              ? Html(data: highlightWord(query, suggestionList[index].name))
              : Text(suggestionList[index]),
        );
      },
      itemCount: suggestionList.length > 6 ? 6 : suggestionList.length,
    );
  }
}
