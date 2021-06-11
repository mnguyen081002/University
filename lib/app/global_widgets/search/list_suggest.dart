import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:university_helper/app/data/models/university.dart';

class ListSuggest extends StatelessWidget {
  final String query;
  const ListSuggest({
    Key? key,
    required this.suggestionList,
    required this.query,
    required this.onTap,
  }) : super(key: key);
  final Function(dynamic) onTap;
  final List suggestionList;

  String highlightWord(String query, String text) {
    String result = text.replaceFirst('$query', '<b>$query</b>');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return suggestionList[index] is University
            ? ListTile(
                onTap: () => onTap(suggestionList[index]),
                leading: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(suggestionList[index].imageUrl),
                    ),
                  ),
                  width: 80,
                ),
                title: Html(
                  data: highlightWord(
                    query,
                    suggestionList[index].name,
                  ),
                ),
              )
            : ListTile(
                leading: Icon(Icons.school),
                title: Html(
                  data: highlightWord(
                    query,
                    suggestionList[index],
                  ),
                ),
                onTap: () => onTap(suggestionList[index]),
              );
      },
      itemCount: suggestionList.length > 7 ? 7 : suggestionList.length,
    );
  }
}
