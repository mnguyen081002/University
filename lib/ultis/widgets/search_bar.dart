import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.hintText = 'Search',
  }) : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    const double actionSize = 100;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Container(
            height: 40,
            width: size.width - actionSize,
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
                fillColor: Color(0xFFF2F4F5),
                hintStyle: TextStyle(color: Colors.grey[600]),
                hintText: hintText,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.filter_list_alt,
                  color: Theme.of(context).accentColor,
                ),
                Text(
                  'Lọc',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
