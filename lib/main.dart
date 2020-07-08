import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dashboard.dart';
import 'WeTheTeam.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(), // DB Auth + NO DB --> front end
      '/one': (context) => LetsDesignIt(), // NO DB --> Front End
      '/two': (context) => WowDesigns(), // Personal Details + Suggestions
      '/three': (context) => DashboardPage(), // DB (Display)
      '/four': (context) => Polling(), // DB
      '/five': (context) => WeTheTeam(),
    },
  ));
}

// 1
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Let's Design It",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.blue[300],
      ),
      home: Home(),
    );
  }
}

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    // Detects when user signed in
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) {
      print('Error signing in: $err');
    });
    // Reauthorize user when app is opened
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }).catchError((err) {
      print('Error signing in: $err');
    });
  }

  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      print('User signed in!: $account');
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            CircleAvatar(
              maxRadius: 50.0,
              backgroundImage: AssetImage(
                  'images/design-icon-idea-icon-design-thinking-icon-line-symbol-logo-emblem-png-clip-art.png'),
            ),
            Container(
              // Helps to leave space between two containers
              width: double.infinity,
              height: 60.0,
            ),
            Text(
              "Let's Design It",
              style: TextStyle(
                fontFamily: "SourceSansPro",
                fontSize: 55.0,
                color: Colors.white,
              ),
            ),
            Container(
              // Helps to leave space between two containers
              width: double.infinity,
              height: 150.0,
            ),
            GestureDetector(
              onTap: login,
              child: Container(
                width: 210.0,
                height: 40.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/download.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          LetsDesignIt(),
          WowDesigns(),
          DashboardPage(),
          Polling(),
          WeTheTeam(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}

class LetsDesignIt extends StatelessWidget {
  @override
  logout() {
    googleSignIn.signOut();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Design It"),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: logout,
          ),
        ],
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Image(
                image: AssetImage('images/job.jpg'),
                //height: 250,
                //width: 550,
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 10.0,
              ),
              Text(
                'Creativity is power!!!',
                style: TextStyle(
                  fontFamily: 'Galada',
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
              Text(
                'To win in the marketplace, you must first win in the workplace.',
                style: TextStyle(
                  fontFamily: 'Galada',
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 10.0,
              ),
              Text(
                'Our company has taken an initiative to provide all our workmates an oppurtunity to design their own workplace.',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 10.0,
              ),
              Text(
                'Features',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 10.0,
              ),
              Text(
                'Observe and Suggest changes to the existing designs, Design your own designs, book a design of your choice and can do much more.',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 20.0,
              ),
              Text(
                'Kickstart your awesome days of work, with your fav workplace.',
                style: TextStyle(
                  fontFamily: 'Galada',
                  fontSize: 12.0,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WowDesigns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Woah Designs"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Text(
                'Nature',
                style: TextStyle(
                  fontFamily: 'Galada',
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('images/office jpg.jpg'),
                    height: 100,
                    width: 180,
                  ),
                  Image(
                    image: AssetImage('images/office-plants_1024x1024.jpeg'),
                    height: 100,
                    width: 180,
                  ),
                ],
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 10.0,
              ),
              Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Galada',
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('images/download12.jpg'),
                    height: 100,
                    width: 180,
                  ),
                  Image(
                    image: AssetImage(
                        'images/Office-of-Circle-Line-Interiors-07.jpg'),
                    height: 100,
                    width: 180,
                  ),
                ],
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 10.0,
              ),
              Text(
                'Office',
                style: TextStyle(
                  fontFamily: 'Galada',
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage(
                        'images/Low-Modern-Office-Layout-Zones-upStage-1024x683.jpg'),
                    height: 100,
                    width: 180,
                  ),
                  Image(
                    image: AssetImage('images/Office-Workspace-Designs.jpg'),
                    height: 100,
                    width: 160,
                  ),
                ],
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 10.0,
              ),
              Text(
                'Horror',
                style: TextStyle(
                  fontFamily: 'Galada',
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('images/12.jpg'),
                    height: 100,
                    width: 180,
                  ),
                  Image(
                    image: AssetImage('images/12345.jpg'),
                    height: 100,
                    width: 180,
                  ),
                ],
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 10.0,
              ),
              Text(
                'Restaurant',
                style: TextStyle(
                  fontFamily: 'Galada',
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('images/123.jpg'),
                    height: 100,
                    width: 180,
                  ),
                  Image(
                    image: AssetImage('images/1234.jpg'),
                    height: 100,
                    width: 180,
                  ),
                ],
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Polling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        title: Text('Polling Time'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Cast your votes in choosing your fav theme for our office",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Galada",
                fontSize: 25.0,
                color: Colors.black,
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
      stream:
          Firestore.instance.collection("Themes").orderBy("votes").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children:
            snapshot.map((data) => _buildListItem(context, data)).toList(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () =>
              record.reference.updateData({'votes': FieldValue.increment(1)}),
        ),
      ),
    );
  }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
