import 'package:flutter/material.dart';
import 'package:swdnucleus/users.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

  List<User> users = [];

  Future<List<User>> fetchUser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/user'));
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
    }
      @override
  void initState() {
    super.initState();
    fetch();
  }

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('App'),

        ),
      );
    }
  }



/*class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/intro');
                  },child: Text('Know the developer'),
            //      icon: Icon(Icons.edit_location),
              //    label: Text('About Me'),
                ),
              ],
            )
        ),
    );

  }
}*/





/*class PostHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: PostScreen(),),);
  }
}

Future<User> fetchUser() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return User.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class User {
  final String username;
  final String name;

  User({ required this.username, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(

      username: json['username'],
      name: json['name'],
    );
  }
}

void main() => runApp(MyApp(user: fetchUser()));

class MyApp extends StatelessWidget {
  final Future<User> user;

  MyApp({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<User>(
            future: user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.username);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}*/




/*class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Future<List<User>> usersFuture = getUsers();

  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    final body = jsonDecode(response.body);
    return body.map<User>(User.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Users'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: usersFuture,
          builder: (context, snapshot) {
            return buildUsers(users);
          },
        ),
      ),
    );

    Widget buildUsers(List<User> users) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, i) {
        final user = users[i];

        return Card(
          child: Container(
            child: Text('${User[i].name}'),
          ),
        );
      },
    );
  }
}*/

