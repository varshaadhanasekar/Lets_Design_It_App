import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dashboard.dart';
import 'WeTheTeam.dart';
import 'NewsFeeds.dart';
import 'poll.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(), // DB Auth + NO DB --> front end
      '/one': (context) => LetsDesignIt(), // NO DB --> Front End
      '/two': (context) => NewsFeeds(), // Personal Details + Suggestions
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
        primaryColor: Color(0xff543B7A),
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.pink[300],
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
          NewsFeeds(),
          Polling(),
          DashboardPage(),
          WeTheTeam(),
          //Maps(),
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
            icon: Icon(
              FontAwesomeIcons.home,
              size: 20.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.newspaper,
              size: 20.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.voteYea,
              size: 20.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.wpforms,
              size: 20.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.userAstronaut,
              size: 20.0,
            ),
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.map),
          ),*/
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
        /*leading: IconButton(
          icon: Icon(FontAwesomeIcons.bars),
          iconSize: 18.0,
          onPressed: () {},
        ),*/
        title: Container(
          //alignment: Alignment.center,
          child: Text("Let's Design It", style: TextStyle()),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
              size: 18.0,
              color: Colors.white,
            ),
            onPressed: logout,
          )
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
                  fontSize: 13.0,
                  color: Colors.black,
                ),
              ),
              Container(
                // Helps to leave space between two containers
                width: double.infinity,
                height: 10.0,
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
