import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparencia/blocs/navbar/navbar_bloc.dart';
import 'package:transparencia/blocs/navbar/navbar_state.dart';
import 'package:transparencia/models/model.dart';
import 'package:transparencia/repository/portal_api_provider.dart';
import 'package:transparencia/ui/bottom_navy_bar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final String title;
  final int currentIndex;

  MainPage({@required this.title,@required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(currentIndex == 1){
      return FloatingActionButton(
        child: Icon(Icons.add)
      );
    } else 
    return Text("title" + title);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NavbarBloc _navbarBloc;

  @override
  void initState() {
    super.initState();
    _navbarBloc = NavbarBloc();
  }

  @override
  void dispose() {
    _navbarBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _navbarBloc,
      builder: (BuildContext context, NavbarState state) {
        if (state is ShowBlue)
          return buildHomepage(state.title, Colors.blue, state.itemIndex);
        if (state is ShowGreen)
          return buildHomepage(state.title, Colors.green, state.itemIndex);
        if (state is ShowRed)
          return buildHomepage(state.title, Colors.red, state.itemIndex);
      },
    );
  }

  Scaffold buildHomepage(String title, Color color, int currentIndex) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: color,
        child: Center(
          child: MainPage(title: title,currentIndex: currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) => setState(() {
              currentIndex = index;
            }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.purpleAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
              activeColor: Colors.pink),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue),
        ],
      ),
    );
  }
}

class BottomNavCustom extends StatelessWidget {
  final NavbarBloc navbarBloc;
  final int currentIndex;
  final List<BottomNavigationBarItem> options = [
    BottomNavigationBarItem(
      icon: Icon(Icons.looks_one),
      title: Text("Red"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.looks_two),
      title: Text("Blue"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.looks_3),
      title: Text("Green"),
    )
  ];

  BottomNavCustom({this.navbarBloc, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) navbarBloc.dispatch(NavbarItems.Red);
        if (index == 1) navbarBloc.dispatch(NavbarItems.Blue);
        if (index == 2) navbarBloc.dispatch(NavbarItems.Green);
      },
      items: options,
    );
  }
}
