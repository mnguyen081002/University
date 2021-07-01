import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config.dart';

var kSub2HeadTextStyle =
    TextStyle(fontWeight: FontWeight.w500, color: Colors.black);
var kSub1HeadTextStyle = TextStyle(fontSize: 14, color: Colors.black);
var kSubTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(15),
  fontWeight: FontWeight.w600,
  color: Colors.grey[700],
);
var kTitleTextStyle = TextStyle(
  fontSize: 19,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);
var kSplashTextStyle = GoogleFonts.lato(
  textStyle: TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.w700,
    height: 1.2,
  ),
);
