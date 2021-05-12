import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const data = {
  'Tên đại học': 'Công nghệ thông tin',
  'Ngành': [
    {
      'tên': 'Công nghệ thông tin',
      'điểm': 21,
      'mã ngành': 'GTS',
      'khối thi': ['A00', 'A01', 'A02']
    },
    {
      'tên': 'Khoa học máy tính',
      'điểm': 30,
      'mã ngành': 'ATS',
      'khối thi': ['A00', 'A01', 'A02']
    },
    {
      'tên': 'Kiến trúc máy tính',
      'điểm': 26,
      'mã ngành': 'HCM',
      'khối thi': ['A00', 'A01', 'A02']
    },
  ],
  'Mã trường': 'HCMUTE',
  'Năm học': '4',
};

class Testtt extends StatefulWidget {
  const Testtt({Key? key}) : super(key: key);

  @override
  _TestttState createState() => _TestttState();
}

class _TestttState extends State<Testtt> {
  void pustDb() async {
    FirebaseFirestore.instance.collection('ListUniversity').add(data);
  }

  List _listUniversity = [];
  Future<void> setData() async {
    final ref =
        await FirebaseFirestore.instance.collection('ListUniversity').get();
    _listUniversity = ref.docs;
  }

  Future<void> getData() async {
    await setData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: _listUniversity.isEmpty
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    Container(child: Text(_listUniversity[0]['Mã trường'])),
                    Container(
                      child: Text(
                        _listUniversity[0]['Ngành'][0]['khối thi'][0],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
