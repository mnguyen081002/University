import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/providers/dataMajorsProvider.dart';
import 'package:university_helper/services/majors/custom_search_majors.dart';

class SearchMajorsDelegate extends CustomSearchDelegate<String> {
  SearchMajorsDelegate({
    required this.itemList,
    required String? hintText,
    required this.scaffoldCtx,
  }) : super(
          searchFieldLabel: hintText,
        );
  final List<String> itemList;
  final BuildContext? scaffoldCtx;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [Container()];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print(scaffoldCtx);
    final suggestList = [
      ...itemList.where(
          (element) => element.toLowerCase().startsWith(query.toLowerCase()))
    ];
    return Card(
      child: Container(
        color: Colors.grey[100],
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return query.isNotEmpty
                ? ListTile(
                    onTap: () => buildShowInputMajors(
                      scaffoldCtx!,
                      suggestList[index],
                    ),
                    title: Text(suggestList[index]
                        // itemList[index]['majors'],
                        ),
                  )
                : Container();
          },
          itemCount: suggestList.length > 5 ? 5 : suggestList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 3,
            );
          },
        ),
      ),
    );
  }

  Future buildShowInputMajors(BuildContext scaffoldCtx, String nameMajors) {
    List<String> khoiDaChon = [];
    final idMajorsCtl = TextEditingController();
    final studyTimeMajorsCtl = TextEditingController();
    final khoiThiCtl = TextEditingController();

    void addListSelected(
        TextEditingController textEditCtl, List list, FocusNode focus) {
      if (textEditCtl.text.isNotEmpty) {
        list.add(textEditCtl.text);
        textEditCtl.clear();
        focus.unfocus();
      }
    }

    void submit() {
      Provider.of<DataMajorsProvider>(scaffoldCtx, listen: false).addMajors(
        grade: khoiDaChon,
        idMajors: idMajorsCtl.text,
        name: nameMajors,
        studyTime: studyTimeMajorsCtl.text,
      );
      Navigator.pop(scaffoldCtx);
    }

    return showModalBottomSheet(
      context: scaffoldCtx,
      builder: (context) {
        final focus = FocusNode();
        return Container(
          padding: EdgeInsets.all(20),
          height: 800,
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Điền thông tin ngành',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text('Tên Ngành : $nameMajors'),
                  TextFormField(
                    controller: idMajorsCtl,
                    decoration: InputDecoration(
                      labelText: 'Nhập mã ngành',
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          onSubmitted: (_) {
                            addListSelected(khoiThiCtl, khoiDaChon, focus);
                          },
                          focusNode: focus,
                          controller: khoiThiCtl,
                          decoration: InputDecoration(
                            labelText: 'Nhập khối thi',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => addListSelected(
                          khoiThiCtl,
                          khoiDaChon,
                          focus,
                        ),
                      )
                    ],
                  ),
                  _buildTags(khoiDaChon),
                  TextFormField(
                    controller: studyTimeMajorsCtl,
                    decoration: InputDecoration(
                      labelText: 'Nhập thời gian đào tạo',
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      submit();
                    },
                    child: Text('Nhập'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildTags(List<String> khoiDaChon) {
    return Container(
      constraints: BoxConstraints(maxHeight: 100),
      child: GridView.builder(
        itemBuilder: (context, index) {
          return _Chip(
            label: khoiDaChon[index],
            onDeleted: (index) {},
            index: index,
          );
        },
        itemCount: khoiDaChon.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 20,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
