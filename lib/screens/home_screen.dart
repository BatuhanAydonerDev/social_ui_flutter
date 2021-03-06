import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_ui_flutter/data/data.dart';
import 'package:social_ui_flutter/screens/login_screen.dart';
import 'package:social_ui_flutter/screens/profile_screen.dart';
import 'package:social_ui_flutter/widgets/trending_field.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "SOCIALLY",
          style: TextStyle(
              color: Theme.of(context).primaryColor, letterSpacing: 10.0),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        bottom: TabBar(
          tabs: [
            Tab(
              child: Text(
                "Trending",
              ),
            ),
            Tab(
              child: Text(
                "Latest",
              ),
            ),
          ],
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          isScrollable: false,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: [
          TrendingField(),
          Text("data"),
        ],
        controller: _tabController,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(currentUser.backgroundImageUrl),
                      fit: BoxFit.cover)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2.0, color: Colors.blue)),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(currentUser.profileImageUrl),
                      radius: 60.0,
                    ),
                  ),
                  Text(
                    currentUser.name,
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text("Home"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.chat),
                    title: Text("Chat"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text("Map"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Account"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                    user: currentUser,
                                  )));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.directions_run),
              title: Text("Logout"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
