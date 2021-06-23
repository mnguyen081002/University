import 'package:flutter/material.dart';
import 'package:university_helper/app/utils/theme/text_theme.dart';

class MajorCard extends StatelessWidget {
  const MajorCard({
    Key? key,
    required this.description,
    required this.imageUrl,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(1, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: LayoutBuilder(
          builder: (context, builder) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: builder.maxHeight * 0.5,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: kTitleTextStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Text(
                          'Tìm hiểu thêm',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
