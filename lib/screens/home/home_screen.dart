import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/providers/dataUniversityProvider.dart';
import 'package:university_helper/screens/home/components/custom_card.dart';
import 'package:university_helper/widgets/search_bar.dart';

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
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: SearchBar(
            hintText: 'Tìm trường',
          ),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildListItem(),
            ],
          ),
        ),
      ),
    );
  }

  Consumer<DataUniversityProvider> _buildListItem() {
    return Consumer<DataUniversityProvider>(
      builder: (context, dataUniversity, _) {
        return LazyLoadScrollView(
          isLoading: isLoading,
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: dataUniversity.listUniversity.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CustomCard(
                  dataUniversity: dataUniversity.listUniversity[index],
                  isSearchByMajors: isSearchByMajors);
            },
          ),
          onEndOfPage: () {
            setState(() {
              isLoading = true;
            });
            dataUniversity.fetchAndSetData();
            setState(() {
              isLoading = false;
            });
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
