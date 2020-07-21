import 'dart:async';
import 'package:flutter/material.dart';
import 'services/crud.dart';

class DashboardPage extends StatefulWidget {
  // done
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String name, idno;
  String breaks, favs, rating, remarks, type;
  String addition, alterdesign, newdesign;
  String choice;
  String book;
  String coll;
  String deskid, deskid1, deskname1, day;

  CrudMethods crudObj = new CrudMethods();

  /*@override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        cars = results;
      });
    });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    // done
    return new Scaffold(
      appBar: AppBar(
        title: Text('Design It'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Galada",
                  fontSize: 40.0,
                  color: Colors.black,
                ),
              ),
              Container(
                width: double.infinity,
                height: 10.0,
              ),
              Text(
                'Book your desk',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                child: Text('Here'),
                onPressed: () {
                  addDialogDB(context);
                },
              ),
              Container(
                width: double.infinity,
                height: 10.0,
              ),
              Text(
                'Enter your Personal Data',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                child: Text('Here'),
                onPressed: () {
                  addDialogPD(context);
                },
              ),
              Container(
                width: double.infinity,
                height: 20.0,
              ),
              Text(
                'Attend the quiz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                child: Text('Here'),
                onPressed: () {
                  addDialogQ(context);
                },
              ),
              Container(
                width: double.infinity,
                height: 20.0,
              ),
              Text(
                'Leave your suggestions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                child: Text('Here'),
                onPressed: () {
                  addDialogS(context);
                },
              ),
              Container(
                width: double.infinity,
                height: 20.0,
              ),
              Text(
                'Confirm your seat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                child: Text('Here'),
                onPressed: () {
                  addDialogC(context);
                },
              ),
              Container(
                width: double.infinity,
                height: 20.0,
              ),
              Text(
                'Book your fav place',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                child: Text('Here'),
                onPressed: () {
                  addDialogB(context);
                },
              ),
              /*Container(
                width: double.infinity,
                height: 20.0,
              ),
              Text(
                'Form Check',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                child: Text('Here'),
                onPressed: () {
                  FormApp();
                },
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> addDialogDB(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Book your desk', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 125.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter Desk ID'),
                    onChanged: (value) {
                      this.deskid1 = value;
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('Book'),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                    crudObj.deleteData(this.deskid, 'deskbook');
                  })
            ],
          );
        });
  }

  Future<bool> addDialogPD(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter Data', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 125.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter your name'),
                    onChanged: (value) {
                      this.name = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter your Id'),
                    onChanged: (value) {
                      this.idno = value;
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObj.addData({'name': this.name, 'idno': this.idno},
                      'personaldetails').then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> addDialogQ(BuildContext context) async {
    // done
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter Data', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 300.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration:
                        InputDecoration(hintText: 'No or Short Breaks?'),
                    onChanged: (value) {
                      this.breaks = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Fav Genre?'),
                    onChanged: (value) {
                      this.favs = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Rating for the designs(0-5)?'),
                    onChanged: (value) {
                      this.rating = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Work/life balance?'),
                    onChanged: (value) {
                      this.remarks = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration:
                        InputDecoration(hintText: 'Introvert / Extrovert?'),
                    onChanged: (value) {
                      this.type = value;
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObj.addData({
                    'breaks': this.breaks,
                    'favs': this.favs,
                    'rating': this.rating,
                    'remarks': this.remarks,
                    'type': this.type
                  }, 'quiz').then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> addDialogS(BuildContext context) async {
    // done
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter Data', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 200.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Any alterations?'),
                    onChanged: (value) {
                      this.alterdesign = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'New Designs?'),
                    onChanged: (value) {
                      this.newdesign = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Any add-ons?'),
                    onChanged: (value) {
                      this.addition = value;
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObj.addData({
                    'alterdesign': this.alterdesign,
                    'newdesign': this.newdesign,
                    'addition': this.addition
                  }, 'suggestions').then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> addDialogC(BuildContext context) async {
    // done
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter Data', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 125.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Your Choice?'),
                    onChanged: (value) {
                      this.choice = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObj.addData({'choice': this.choice}, 'choose').then(
                      (result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> addDialogB(BuildContext context) async {
    // done
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter Data', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 125.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Seat name'),
                    onChanged: (value) {
                      this.book = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObj
                      .addData({'book': this.book}, 'booking').then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    // done
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Job Done', style: TextStyle(fontSize: 15.0)),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
