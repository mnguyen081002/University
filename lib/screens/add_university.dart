import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/providers/dataMajorsProvider.dart';
import 'package:university_helper/services/majors/input_majors.dart';

import '../services/majors/custom_search_majors.dart';

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

  List<String> listDataMajors = [];

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
                _switch(),
                SearchPage(
                    delegate: SearchMajorsDelegate(
                  itemList: listDataMajors,
                  hintText: 'Chọn ngành',
                  scaffoldCtx: _scaffoldKey.currentContext,
                )),
                _buildListSelectedMajors(),
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

  Row _switch() {
    return Row(
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
    );
  }

  Consumer<DataMajorsProvider> _buildListSelectedMajors() {
    return Consumer<DataMajorsProvider>(builder: (context, majors, child) {
      return majors.listMajors.isNotEmpty
          ? Column(children: [
              Text('Ngành đã thêm :' + '${majors.listMajors.length}'),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}.' + majors.listMajors[index].name,
                      ),
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          majors.removeMajors(majors.listMajors[index]);
                        },
                      )
                    ],
                  ),
                ),
                itemCount: majors.listMajors.length,
              ),
            ])
          : Container();
    });
  }
}
