import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:khaleji_translator/searchservice.dart';
import 'package:khaleji_translator/location.dart';
import 'package:khaleji_translator/HomeFrag.dart';

void main() {runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/location':(context) => location(),

    }

));}



