import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:university_helper/app/models/university.dart';
import 'package:university_helper/app/screens/detail/detail_screen.dart';

class ListSuggest extends StatelessWidget {
  final String query;
  const ListSuggest({
    Key? key,
    required this.suggestionList,
    required this.query,
  }) : super(key: key);

  final List<University> suggestionList;

  highlightWord(String query, String name) {
    String result = name.replaceFirst(
        '${query.toUpperCase()}', '<b>${query.toUpperCase()}</b>');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => Navigator.of(context).pushReplacementNamed(
            DetailScreen.routeName,
            arguments: suggestionList[index].id,
          ),
          leading: Icon(Icons.location_city),
          title: Html(data: highlightWord(query, suggestionList[index].name)),
        );
      },
      itemCount: suggestionList.length > 6 ? 6 : suggestionList.length,
    );
  }
}
