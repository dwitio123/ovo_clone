import 'package:flutter/material.dart';
import 'package:ovo_clone/pln.dart';
import 'package:ovo_clone/sql_helper.dart';

class Pulsa extends StatefulWidget {
  const Pulsa({super.key});

  @override
  State<Pulsa> createState() => _PulsaState();
}

class _PulsaState extends State<Pulsa> {
  List<Map<String, dynamic>> _cat = [];

  void _refreshCat() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _cat = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshCat();
  }

  void _deleteCat(int id) async {
    await SQLHelper.deleteItem(id);
    _refreshCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _cat.length,
        itemBuilder: (context, index) => Card(
          color: Colors.lime,
          margin: EdgeInsets.all(15),
          child: ListTile(
            title: Text(_cat[index]['name']),
            subtitle: Text('Usia ${_cat[index]['age']} tahun'),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PLN(id: _cat[index]['id']);
                    }));
                  }, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {
                    _deleteCat(_cat[index]['id']);
                  }, icon: Icon(Icons.delete)),
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}
