import 'package:flutter/material.dart'; 

class location extends StatefulWidget {
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {

  Map data={};
  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
   String meaning=data['meaning'];
    String word=data['word'];
    String type=data['type'];
    return new Scaffold(
        appBar: new AppBar(
          title: Text('الترجمة'),
          centerTitle: true,
          elevation: 0.0,
        ),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(120, 40.0, 0, 0),
        child:SingleChildScrollView(
           child:SizedBox(
             width: 255,
           child:Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '$word',
                  textAlign:TextAlign.right,
                  style:TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
              'المعنى',
                  textAlign:TextAlign.right,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
                //letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 2.0),
        Text(
          '$meaning',
          textAlign:TextAlign.right,
        style:TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: Colors.grey[600],
          ),
        ),
            Divider(
              color: Colors.grey[800],
              height: 20.0,
            ),
           SizedBox(height: 30.0),
          Text(
            'النوع',
            textAlign:TextAlign.right,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 2.0),
          Text(
            '$type',
            textAlign:TextAlign.right,
            style:TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.grey[600],
            ),
          ),
          Divider(
            color: Colors.grey[800],
            height: 20.0,
          ),
        ],
      ),
           ),
        ),
      ),
    );
  }
}

