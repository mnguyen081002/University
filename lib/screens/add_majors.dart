import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddMajors extends StatefulWidget {
  const AddMajors({Key? key}) : super(key: key);

  @override
  _AddMajorsState createState() => _AddMajorsState();
}

class _AddMajorsState extends State<AddMajors> {
  final _form = GlobalKey<FormState>();
  int _itemCount = 1;
  List<String?> majorsList = [];
  List<Row> listRow = [];
  void _submit() async {
    _form.currentState!.save();
    try {
      majorsList.forEach((majors) async {
        await FirebaseFirestore.instance.collection('listMajors').add({
          'majors': majors,
        });
      });
      setState(() {
        majorsList.clear();
        _itemCount = 0;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm ngành'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _form,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final ctl = TextEditingController();
                    listRow.add(
                      _buildTextField(ctl, index),
                    );
                    return listRow[index];
                  },
                  itemCount: _itemCount,
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _itemCount++;
                  });
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text('Thêm ngành'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Gửi'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTextField(TextEditingController ctl, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextFormField(
            validator: (value) {
              if (ctl.text == null || ctl.text.trim().isEmpty)
                return 'Vui lòng nhập vào trường này';
              return null;
            },
            controller: ctl,
            decoration: InputDecoration(labelText: 'Tên ngành'),
            onSaved: (value) {
              majorsList.add(value);
            },
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _itemCount--;
              listRow.removeAt(index);
            });
          },
          icon: Icon(Icons.remove_circle_outline),
        )
      ],
    );
  }
}
