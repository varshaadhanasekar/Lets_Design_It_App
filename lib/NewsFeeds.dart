import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'designs.dart';
import 'workspacedetails.dart';

class NewsFeeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsFeeds',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff543B7A),
      ),
      home: MyHomePage(title: 'News Feeds'),
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
        /*leading: IconButton(
            icon: Icon(FontAwesomeIcons.bars),
            onPressed: () {},
          ),*/
        title: Container(
          child: Text("Feed It", style: TextStyle()),
        ),
        /*actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.calendarCheck,
                size: 20.0,
                color: Colors.white,
              ),
              onPressed: null,
            )
          ],*/
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Feeds On',
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
                'Worskspace Themes',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: "SourceSansPro"),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsFeeds1()),
                );
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Worskspace Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: "SourceSansPro"),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkspaceDetails()),
                );
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: Text("HI",
              style: TextStyle(color: Colors.black, fontSize: 20.0))),
    );
  }
}
