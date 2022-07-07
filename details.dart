import 'package:flutter/material.dart';
import 'package:swdnucleus/users.dart';
import 'package:swdnucleus/posts.dart';
import 'package:swdnucleus/albums.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Post> posts = [];
List<Album> albums = [];

Future<List<Post>> fetchPost() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  fetch1() async {
    posts = await fetchPost();
    albums = await fetchAlbum();
    setState(() {
      posts = posts;
      albums = albums;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch1();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details, Posts & Albums'),
        centerTitle: true,
      ),
      
    );
  }
}
