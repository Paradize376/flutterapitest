import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/ListName_detail.dart';

class ListNameScreen extends StatefulWidget {
  const ListNameScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ListnameScreenState();
  }
}

class _ListnameScreenState extends State<ListNameScreen> {
  List<dynamic> _listname = [];

  @override
  void initState() {
    super.initState();
    _fetchListname();
  }

  Future<void> _fetchListname() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );
    setState(() {
      _listname = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listname')),
      body: ListView.builder(
        itemCount: _listname.length,
        itemBuilder: (context, index) {
          final listname = _listname[index];
          return ListTile(
            leading: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Image.network('https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-fall-path-by-a-pond-free-image.jpg?w=600&quality=80'),
            ),
            subtitle: Text(listname['title'], style: const TextStyle(
              fontSize: 15 ,
              fontWeight: FontWeight.w700
            ),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListnameDetail(id: listname['id']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
