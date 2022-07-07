import 'package:flutter/material.dart';
import 'package:swdnucleus/home.dart';
import 'package:swdnucleus/details.dart';
import 'package:swdnucleus/intro.dart';
import 'package:swdnucleus/users.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
initialRoute:'/',
  routes: {
    '/': (context) => Home(),
    '/details': (context) => Details(),
    '/intro': (context) => Intro(),
  },
));

