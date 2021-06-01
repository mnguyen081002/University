import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/university_provider.dart';
import '../../utils/widgets/search/search_appbar.dart';
import 'components/list/list_university.dart';
import 'components/slider_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

const sliderBarOptions = ['Điểm cao', 'Đánh giá', 'ĐHQG', 'Hot'];

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  final _animatedDuration = const Duration(milliseconds: 200);
  bool isLoading = false;
  bool isSearchByMajors = true;
  bool isScroll = false;
  var _scrollPosition = 0.0;

  @override
  void initState() {
    final provider = Provider.of<UniversityProvider>(context, listen: false);
    provider.fetchAndSetData();

    super.initState();
    _scrollController.addListener(() {
      final scrollPosition = _scrollController.position;
      if (scrollPosition.pixels == scrollPosition.maxScrollExtent)
        provider.fetchAndSetData();

      if (scrollPosition.pixels <= 130) {
        setState(() {
          _scrollPosition = -(scrollPosition.pixels / 2);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: SearchAppBar(
              hintText: 'Tìm trường',
            ),
            bottom: TabBar(
              tabs: List.generate(4, (index) {
                return Tab(
                  text: sliderBarOptions[index],
                );
              }),
            ),
          ),
          body: Stack(
            children: [
              TabBarView(children: [
                ListUniversity(
                  isSearchByMajors: isSearchByMajors,
                  scrollController: _scrollController,
                ),
                ListUniversity(
                  isSearchByMajors: isSearchByMajors,
                  scrollController: _scrollController,
                ),
                ListUniversity(
                  isSearchByMajors: isSearchByMajors,
                  scrollController: _scrollController,
                ),
                ListUniversity(
                  isSearchByMajors: isSearchByMajors,
                  scrollController: _scrollController,
                ),
              ]),
              AnimatedPositioned(
                top: _scrollPosition,
                duration: _animatedDuration,
                child: SliderBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
