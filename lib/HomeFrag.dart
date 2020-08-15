import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:khaleji_translator/searchservice.dart';
import 'package:khaleji_translator/location.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CollectionReference dictionaryCollection;
  @override
  void initState() {
    // TODO: implement initState
    dictionaryCollection= Firestore.instance.collection('dictionary');
  }

  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value){
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1) + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {

      SearchService().searchByName(value,dictionaryCollection).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['word'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('khaleji_translator'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              textAlign: TextAlign.right,
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(right: 25.0),
                  hintText: 'اكتب الكلمة',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: 10.0),
          GridView.count(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                return buildResultCard(context,element);
              }).toList())
        ]));
  }
}

Widget buildResultCard(context,data) {
  return Card(

    //  onPressed:(){data['searchKey'];}
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    elevation: 2.0,
    child: new InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/location',arguments: data);
        },
        child: Container(


            child: Center(
                child: Text(
                  data['word'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                )

            )
        )

    ),
  );
}