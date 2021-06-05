import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:university_helper/app/models/university.dart';
import 'package:university_helper/app/screens/detail/detail_screen.dart';

class ListSuggest extends StatelessWidget {
  final String word;
  const ListSuggest({
    Key? key,
    required this.suggestionList,
    required this.word,
  }) : super(key: key);

  final List<University> suggestionList;

  lineWord(String word, String name) {
    String result = name.replaceFirst('$word', '<b>$word</b>');
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
          title: Html(data: lineWord(word, suggestionList[index].name)),
        );
      },
      itemCount: suggestionList.length > 5 ? 5 : suggestionList.length,
    );
  }
}
