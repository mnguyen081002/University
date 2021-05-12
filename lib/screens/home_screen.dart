import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/providers/dataUniversityProvider.dart';
import 'package:university_helper/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;

  @override
  void initState() {
    if (_isInit) {
      Provider.of<DataUniversityProvider>(context, listen: false)
          .fetchAndSetData();
    }
    _isInit = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SearchBar(
            hintText: 'Tìm trường',
          ),
        ),
        body: Column(
          children: [
            Consumer<DataUniversityProvider>(
              builder: (context, dataUniversity, _) {
                return dataUniversity.listUniversity.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        itemCount: dataUniversity.listUniversity.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Column(
                                children: [
                                  Image.network(dataUniversity
                                      .listUniversity[index].imageUrl),
                                  Text(dataUniversity
                                      .listUniversity[index].name),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
