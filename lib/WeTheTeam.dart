import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'personaldetails.dart';
import 'team.dart';

class WeTheTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Know It Page",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff543B7A),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Know It'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Know About',
                style: TextStyle(
                    color: Colors.white, fontSize: 30.0, fontFamily: "Galada"),
              ),
              decoration: BoxDecoration(
                color: Color(0xff543B7A),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/MNC-in-India.jpg')),
              ),
            ),
            ListTile(
              title: Text(
                'Personal Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: "SourceSansPro"),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalDetails()),
                );
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Team Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: "SourceSansPro"),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Teams()),
                );
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "News at Work",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Galada",
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
            Text(
              "Get all your day-to-day updates here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SourceSansPro",
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 280.0,
              child: Divider(
                // Helps to draw lines between the containers
                color: Colors.black,
                thickness: 1.0,
              ),
            ),
            Text(
              "Desks, Halls, Meetups Availability",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SourceSansPro",
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Name, Time and ID",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SourceSansPro",
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 50.0,
              child: Divider(
                // Helps to draw lines between the containers
                color: Colors.black,
                thickness: 0.5,
              ),
            ),
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("deskbook").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return LinearProgressIndicator();
        else
          return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 2.0),
        children:
            snapshot.map((data) => _buildListItem(context, data)).toList(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.deskname),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: ListTile(
          title: Text(record.deskname),
          subtitle: Text(record.day),
          trailing: Text(record.deskid.toString()),
        ),
      ),
    );
  }
}

class Record {
  final String deskname;
  final String deskid;
  final String day;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['deskname'] != null),
        assert(map['deskid'] != null),
        assert(map['day'] != null),
        day = map['day'],
        deskname = map['deskname'],
        deskid = map['deskid'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$deskname:$deskid>";
}
