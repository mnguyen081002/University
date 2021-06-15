import 'package:flutter/material.dart';
import 'package:university_helper/app/utils/theme/text_theme.dart';

class MajorCard extends StatelessWidget {
  const MajorCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);
  final String title;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
      height: 360,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: LayoutBuilder(
        builder: (context, builder) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                height: builder.maxHeight * 0.6,
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
                      'Ngành công nghệ thông tin đang thiếu nhân lực trầm trọng, cùng với mức lương khủng như thằng em sinh năm 96',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Tìm hiểu thêm'),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
