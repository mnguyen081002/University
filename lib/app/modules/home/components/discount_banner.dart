import 'package:flutter/material.dart';

const String bannerUrl =
    'https://s3-ap-southeast-1.amazonaws.com/webikidsmontessorieduvnprod/wp-content/uploads/2020/09/04015854/le-khai-giang.jpg';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 180,
      width: double.infinity,
      padding: EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(bannerUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
