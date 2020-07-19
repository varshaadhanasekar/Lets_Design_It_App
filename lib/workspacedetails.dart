import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WorkspaceDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Workspace Details Page",
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
          title: Text('Workspace Details'),
        ),
        body: StreamBuilder(
            stream:
                Firestore.instance.collection('workspacedetails').snapshots(),
            // ignore: missing_return
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                const Text('Loading');
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot WorkSpaceDetails =
                          snapshot.data.documents[index];
                      return Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1100.0,
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
                                                '${WorkSpaceDetails['image']}',
                                                fit: BoxFit.fill),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Name',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['name']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Projects done',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['projects']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Assets',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['asset']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Area',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['area']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Departments',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['depts']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Budget(Design)',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['budget']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Start Date',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['date']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Employees',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['employees']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Meeting Rooms',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['halls']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Rooms',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['rooms']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Working Hours',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['timing']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                'Meeting Hours',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                              trailing: Text(
                                                '${WorkSpaceDetails['hours']}',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
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
/*Center(
        child: Column(
          children: <Widget>[
            Text(
              "Office ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Galada",
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
            Text(
              "Get all your office reminders here.",
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
              "Desks Available Today",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SourceSansPro",
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Name and ID",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SourceSansPro",
                fontSize: 10.0,
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
            Text(
              "Name and ID",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SourceSansPro",
                fontSize: 10.0,
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
          ],
        ),
      ),*/

/*
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
          trailing: Text(record.deskid.toString()),
        ),
      ),
    );
  }
}

class Record {
  final String deskname;
  final String deskid;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['deskname'] != null),
        assert(map['deskid'] != null),
        deskname = map['deskname'],
        deskid = map['deskid'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$deskname:$deskid>";
}
*/
}
