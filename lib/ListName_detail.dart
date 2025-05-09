import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListnameDetail extends StatefulWidget {
  final int id;

  const ListnameDetail({super.key, required this.id});

  @override
  State<StatefulWidget> createState() {
    return _ListnameDetailState();
  }
}

class _ListnameDetailState extends State<ListnameDetail> {
  Map<String, dynamic>? _ListnameDetail;

  @override
  void initState() {
    super.initState();
    _fetchListnameDetail();
  }

  Future<void> _fetchListnameDetail() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos/${widget.id}'),
    );
    setState(() {
      _ListnameDetail = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DetailListname')),
      body:
          _ListnameDetail == null
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-fall-path-by-a-pond-free-image.jpg?w=600&quality=80',
                    ),
                    Text(
                      _ListnameDetail!['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                       
                        
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}


