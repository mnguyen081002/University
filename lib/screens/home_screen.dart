import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/providers/dataUniversityProvider.dart';
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
              BuildListItem(),
            ],
          ),
        ),
      ),
    );
  }

  Consumer<DataUniversityProvider> BuildListItem() {
    return Consumer<DataUniversityProvider>(
      builder: (context, dataUniversity, _) {
        return LazyLoadScrollView(
          isLoading: isLoading,
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: dataUniversity.listUniversity.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 105,
                          width: 105,
                          child: Image.network(
                            dataUniversity.listUniversity[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (true) BuildTag(),
                      ]),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dataUniversity.listUniversity[index].name,
                                style: TextStyle(
                                  fontFamily: 'Lora',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                softWrap: true,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                  ),
                                  Text(
                                    '8.1',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.amber,
                                      fontFamily: 'BreeSerif',
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Tốt (100 đánh giá)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                  ),
                                ],
                              ),
                              isSearchByMajors
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Công nghệ thông tin'),
                                        Text('Điểm năm 2020: 30'),
                                      ],
                                    )
                                  : Text('25 ngành'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
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

  Positioned BuildTag() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.orange,
            Colors.red,
          ]),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5),
          ),
        ),
        height: 20,
        width: 40,
        child: Text(
          'ĐHQG',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
// dataUniversity.listUniversity.isNotEmpty
// ? ListView.builder(
// padding: EdgeInsets.all(10),
// shrinkWrap: true,
// itemCount: dataUniversity.listUniversity.length,
// itemBuilder: (context, index) {
// return Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15)),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(15),
// child: Column(
// children: [
// Image.network(dataUniversity
//     .listUniversity[index].imageUrl),
// Text(dataUniversity
//     .listUniversity[index].name),
// ],
// ),
// ),
// );
// },
// )
// : Center(child: CircularProgressIndicator());
