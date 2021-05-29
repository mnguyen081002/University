import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/providers/dataUniversityProvider.dart';
import 'package:university_helper/screens/home/components/slider_bar.dart';
import 'package:university_helper/ultis/widgets/search_bar.dart';

import 'components/custom_card2.dart';

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
    print(kToolbarHeight);
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
                _buildListItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Consumer<DataUniversityProvider> _buildListItem() {
    Size size = MediaQuery.of(context).size;
    return Consumer<DataUniversityProvider>(
      builder: (context, dataUniversity, _) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: size.height / 1.3),
          child: ListView.builder(
            itemCount: dataUniversity.listUniversity.length,
            itemBuilder: (context, index) {
              return CustomCard2(
                dataUniversity: dataUniversity.listUniversity[index],
                isSearchByMajors: isSearchByMajors,
              );
            },
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
