import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../custom_search.dart';
import '../providers/dataMajorsProvider.dart';

class AddUniversity extends StatefulWidget {
  const AddUniversity({Key? key}) : super(key: key);

  @override
  _AddUniversityState createState() => _AddUniversityState();
}

class _AddUniversityState extends State<AddUniversity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _form = GlobalKey<FormState>();
  late String _tenTruong;
  late String _maTruong;
  late String _hinhThucDaoTao;
  late double _minTuition;
  late double _maxTuition;
  late String _diaChi;
  late String _linkWeb;
  late String _linkAnh;
  late String _loaiTruong;
  bool isNationalUniversity = false;

  List<String> _values = [];
  List<String> listDataMajors = [];

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  Future<void> getData() async {
    try {
      final docRef =
          await FirebaseFirestore.instance.collection('listMajors').get();
      docRef.docs.forEach((element) {
        listDataMajors.add(element['majors']);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> setData() async {
    _form.currentState!.save();
    final listMajors =
        Provider.of<DataMajorsProvider>(context, listen: false).listMajors;
    final mapMajors = listMajors
        .map((majors) => {
              'nameMajors': majors.name,
              'idMajors': majors.idMajors,
              'studyTime': majors.studyTime,
              'grade': majors.grade,
            })
        .toList();
    final university = {
      'name': _tenTruong,
      'imageUrl': _linkAnh,
      'formsOfTraining': _hinhThucDaoTao,
      'idUniversity': _maTruong,
      'isNationalUniversity': isNationalUniversity,
      'listMajors': mapMajors,
      'location': _diaChi,
      'maxTuition': _maxTuition,
      'minTuition': _minTuition,
      'universityType': _loaiTruong,
      'universityUrl': _linkWeb,
    };
    await FirebaseFirestore.instance
        .collection('ListUniversity')
        .add(university);
    print('Done');
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Thêm thông tin trường'),
      ),
      body: Column(children: [
        Form(
          key: _form,
          child: Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nhập tên trường'),
                  onSaved: (value) => _tenTruong = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nhập mã trường'),
                  onSaved: (value) => _maTruong = value!,
                ),
                Row(
                  children: [
                    Text('Là đại học quốc gia ?'),
                    Switch(
                        value: isNationalUniversity,
                        onChanged: (value) {
                          setState(() {
                            isNationalUniversity = value;
                          });
                        }),
                  ],
                ),
                SearchPage(
                    delegate: Data(
                  itemList: listDataMajors,
                  hintText: 'Chọn ngành',
                  scaffoldCtx: _scaffoldKey.currentContext,
                )),
                Consumer<DataMajorsProvider>(
                  builder: (context, majors, child) {
                    return majors.listMajors.isNotEmpty
                        ? Column(
                            children: [
                              Text('Ngành đã thêm :' +
                                  '${majors.listMajors.length}'),
                              ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        '${index + 1}.' +
                                            majors.listMajors[index].name,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          majors.removeMajors(
                                              majors.listMajors[index]);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                itemCount: majors.listMajors.length,
                              ),
                            ],
                          )
                        : Container();
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Hình thức đào tạo (Tư,Công,...'),
                  onSaved: (value) => _hinhThucDaoTao = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Loại trường (Đại học, Cao đẳng,...'),
                  onSaved: (value) => _loaiTruong = value!,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Học phí tối thiểu'),
                  onSaved: (value) => _minTuition = double.parse(value!),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Học phí tối đa'),
                  onSaved: (value) => _maxTuition = double.parse(value!),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Địa chỉ'),
                  onSaved: (value) => _diaChi = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Nhập link website của trường'),
                  onSaved: (value) => _linkWeb = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nhập link ảnh'),
                  onSaved: (value) => _linkAnh = value!,
                ),
                SizedBox(height: 30),
                ElevatedButton(onPressed: setData, child: Text('Xong')),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

const _dsKhoiThi = [
  'A00',
  'A01',
  'A02',
];

class Data extends CustomSearchDelegate<String> {
  Data({
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
      print(khoiDaChon);
      print(idMajorsCtl.text);
      print(nameMajors);
      print(studyTimeMajorsCtl.text);
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
                  Container(
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
                  ),
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
// Row(
// children: [
// DropdownButton(
// value: _dsKhoiThi[0],
// onChanged: (newVal) {},
// items: _dsKhoiThi.map((khoiThi) {
// return DropdownMenuItem<String>(
// value: khoiThi,
// child: Text(khoiThi),
// );
// }).toList(),
// ),
// ],
// ),
