import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewsFeeds1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Designs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff543B7A),
      ),
      home: MyHomePage(title: 'Themed Designs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text("Themes", style: TextStyle()),
          ),
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('designs').snapshots(),
            // ignore: missing_return
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                const Text('Loading');
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot myDesign =
                          snapshot.data.documents[index];
                      return Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 350.0,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Material(
                                  color: Colors.white,
                                  elevation: 14.0,
                                  shadowColor: Color(0x802196F3),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 200.0,
                                            child: Image.network(
                                                '${myDesign['image']}',
                                                fit: BoxFit.fill),
                                          ),
                                          SizedBox(height: 10.0),
                                          Text(
                                            '${myDesign['title']}',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10.0),
                                          Text(
                                            '${myDesign['subtitle']}',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      );
                    } // ignore: missing_return
                    );
              }
            }));
  }
}
