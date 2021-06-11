import 'package:flutter/material.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            DiscountBanner(),
            SizedBox(height: 20),
            Categories(),
            SizedBox(height: 20),
            SpecialOffers(),
            PopularProducts(),
          ],
        ),
      ),
    );
  }
}
