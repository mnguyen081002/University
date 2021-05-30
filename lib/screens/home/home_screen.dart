import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/providers/dataUniversityProvider.dart';
import 'package:university_helper/screens/home/components/slider_bar.dart';
import 'package:university_helper/utils/widgets/search_bar.dart';

import 'components/list_university.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  bool isLoading = false;
  bool isSearchByMajors = true;
  @override
  void initState() {
    Provider.of<DataUniversityProvider>(context, listen: false)
        .fetchAndSetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orangeAccent[100],
          title: SearchBar(
            hintText: 'Tìm trường',
          ),
        ),
        body: Container(
          height: size.height,
          color: Colors.grey[100],
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SliderBar(),
                ListUniversity(isSearchByMajors: isSearchByMajors),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
