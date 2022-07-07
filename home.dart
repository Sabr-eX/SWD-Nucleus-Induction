import 'package:flutter/material.dart';
import 'package:swdnucleus/users.dart';
import 'package:swdnucleus/posts.dart';
import 'package:swdnucleus/albums.dart';
import 'package:swdnucleus/details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

  List<User> users = [];

  Future<List<User>> fetchUser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<User>((json) => User.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
      throw Exception('Failed to load album');
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  fetch() async {
    users = await fetchUser();
    setState(() {
      users = users;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              //final item = users[index];
              return InkWell(
                child: Card(
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                  child: ListTile(
                    title: Text(users[index].username),
                    subtitle: Text(users[index].name),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                      '/details', arguments: users[index].userId);
                },
              );
            },
          ),
          ),
          OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/intro');
            },
            child: Text('Know the developer'),
          ),

        ],
      ),
    );
  }
  }
