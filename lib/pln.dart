import 'package:flutter/material.dart';
import 'package:ovo_clone/pulsa.dart';
import 'package:ovo_clone/sql_helper.dart';

class PLN extends StatefulWidget {
  final int id;

  const PLN({super.key, required this.id} );

  @override
  State<PLN> createState() => _PLNState();
}

class _PLNState extends State<PLN> {

  List<Map<String, dynamic>> _cat = [];

  void _detailCat() async {
    final dataDetail = await SQLHelper.getItem(widget.id);
    setState(() {
      _cat = dataDetail;
    });
  }

  @override
  void initState() {
    super.initState();
    _detailCat();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _ageController = TextEditingController();

    if(widget.id != 0 && _cat.isNotEmpty) {
      _nameController.text = _cat[0]['name'];
      _ageController.text = _cat[0]['age'].toString();
    } else {
      setState(() {
        widget.id == 0;
      });
    }

    Future<void> _addCats() async {
      await SQLHelper.insertCat(_nameController.text, int.parse(_ageController.text));
    }
    
    Future<void> _updateCat() async {
      await SQLHelper.updateItem(widget.id, _nameController.text, int.parse(_ageController.text));
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nama',
                  labelText: 'Nama',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Umur',
                  labelText: 'Umur',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    widget.id == 0 ? _addCats() : _updateCat();

                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Pulsa();
                    }));
                  }, child: widget.id == 0 ? Text('Simpan') : Text('Ubah'))
            ],
          ),
        ),
      ),
    );
  }
}
