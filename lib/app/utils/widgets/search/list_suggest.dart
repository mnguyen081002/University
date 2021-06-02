import 'package:flutter/material.dart';
import 'package:university_helper/app/models/university.dart';
import 'package:university_helper/app/screens/detail/detail_screen.dart';

class ListSuggest extends StatelessWidget {
  const ListSuggest({
    Key? key,
    required this.suggestionList,
  }) : super(key: key);

  final List<University> suggestionList;

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
          title: Text(suggestionList[index].name),
        );
      },
      itemCount: suggestionList.length > 5 ? 5 : suggestionList.length,
    );
  }
}
