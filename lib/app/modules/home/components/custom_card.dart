import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:university_helper/app/data/models/info.dart';
import 'package:university_helper/app/utils/size_config.dart';
import 'package:university_helper/app/utils/theme/text_theme.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.item,
  }) : super(key: key);

  final double width, aspectRetio;
  final Info item;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: item.imageUrl,
      imageBuilder: (context, imageProvider) {
        return Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
          child: SizedBox(
            width: getProportionateScreenWidth(width),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1.02,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(1, 4), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(item.imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.name,
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Visibility(
                    visible: item.rate != null,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 13,
                        ),
                        Text(
                          "${item.rate}",
                          style: kSubTextStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
