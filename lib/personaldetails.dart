import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PersonalDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PersonalDetails",
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
          title: Text('Personal Details'),
        ),
        body: StreamBuilder(
            stream:
                Firestore.instance.collection('personaldetails').snapshots(),
            // ignore: missing_return
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                const Text('Loading');
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot myDetails =
                          snapshot.data.documents[index];
                      return Column(
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 630.0,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Material(
                                  color: Colors.white,
                                  elevation: 14.0,
                                  shadowColor: Color(0x802196F3),
                                  child: Center(
                                    child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 200.0,
                                                child: Image.network(
                                                    '${myDetails['image']}',
                                                    fit: BoxFit.fill),
                                              ),
                                              SizedBox(height: 10.0),
                                              Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 70.0),
                                                    Text(
                                                      'Name: ',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    SizedBox(width: 10.0),
                                                    Text(
                                                      '${myDetails['name']}',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 70.0),
                                                    Text(
                                                      'Position: ',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    SizedBox(width: 10.0),
                                                    Text(
                                                      '${myDetails['position']}',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 70.0),
                                                    Text(
                                                      'Employee Id: ',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    SizedBox(width: 10.0),
                                                    Text(
                                                      '${myDetails['empid']}',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 70.0),
                                                    Text(
                                                      'Date of Joining: ',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    SizedBox(width: 10.0),
                                                    Text(
                                                      '${myDetails['dateofjoin']}',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 70.0),
                                                    Text(
                                                      'Entry Code: ',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    SizedBox(width: 10.0),
                                                    Text(
                                                      '${myDetails['entrycode']}',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 70.0),
                                                    Text(
                                                      'Salary: ',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    SizedBox(width: 10.0),
                                                    Text(
                                                      '${myDetails['salary']}',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 70.0),
                                                    Text(
                                                      'Seat No: ',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                    SizedBox(width: 10.0),
                                                    Text(
                                                      '${myDetails['seat']}',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 150.0,
                                                height: 150.0,
                                                child: Image.network(
                                                    '${myDetails['qrcode']}',
                                                    fit: BoxFit.fill),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              )),
                        ],
                      );
                    } // ignore: missing_return
                    );
              }
            }));
  }
/*StreamBuilder<QuerySnapshot>(
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
          leading: Text('hi'),
          subtitle: Text('dara'),
        ),
      ),
    );
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
}*/
}
