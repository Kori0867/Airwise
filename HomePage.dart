import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'Pantallas.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with SingleTickerProviderStateMixin  {
  late TabController _tabController;
  int _selectedIndex = 0;
  bool _isLoading = false;

  final List<String> _titles = [
    'Home',
    'Notificaciones',
    'Monitoreo'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _isLoading = true;
        });
        // Simular una carga con un retraso
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            _isLoading = false;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _signOut(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: _ProfileIcon(onSignOut: () => _signOut(context))),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_isLoading)
            LinearProgressIndicator(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HomeScreen(),
                NotificacionScreen(),
                MonitoreoScreen(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificaciones'),
          BottomNavigationBarItem(icon: Icon(Icons.monitor), label: 'Monitoreo'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _tabController.index = index;
            _isLoading = true;
          });
          // Simular una carga con un retraso
          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _isLoading = false;
            });
          });
        },
      ),
    );
  }
}

class _ProfileIcon extends StatelessWidget {
  final VoidCallback onSignOut;

  const _ProfileIcon({Key? key, required this.onSignOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      icon: const Icon(Icons.person),
      offset: const Offset(0, 40),
      onSelected: (Menu item) {
        if (item == Menu.itemThree) {
          onSignOut();
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        const PopupMenuItem<Menu>(
          value: Menu.itemOne,
          child: Text('Account'),
        ),
        const PopupMenuItem<Menu>(
          value: Menu.itemTwo,
          child: Text('Settings'),
        ),
        const PopupMenuItem<Menu>(
          value: Menu.itemThree,
          child: Text('Sign Out'),
        ),
      ],
    );
  }
}

enum Menu { itemOne, itemTwo, itemThree }