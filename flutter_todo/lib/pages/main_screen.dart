import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key});

  void _settingsOpen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Настройки'),
              backgroundColor: Colors.blueGrey,
            ),
            body: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/settings', (route) => false);
                  },
                  child: Text('На главную'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        title: Text('TodoList'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: () {
              _settingsOpen(context);
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 220,
            child: Text(
              'Добро пожаловать',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/todo');
              },
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              child: Text(
                'Перейти к делам',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            bottom: 300,
          ),
        ],
      ),
    );
  }
}

