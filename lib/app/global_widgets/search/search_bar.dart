import 'package:flutter/material.dart';
import 'package:university_helper/app/global_widgets/search/search_delegate.dart';
import 'package:university_helper/app/utils/custom_search.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.hintText,
  }) : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => showCustomSearch(
          delegate: MySearchDelegate(),
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          height: 50,
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Colors.grey[600]),
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
