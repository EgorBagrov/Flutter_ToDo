import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _userToDo;
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(['Создать список дел']);
  }

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Меню'),
            ),
            body:Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context,'/', (route) => false);
                }, child: Text('На главную')),
                Padding(padding: EdgeInsets.only(left: 40)),
                Text('Наше простое меню'),
              ],

            )
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        title: Text('Список дел'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: _menuOpen,
          ),
        ],
      ),
      body:ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  trailing: IconButton(
                    icon:Icon(
                      Icons.delete_sharp,
                      color: Colors.black,
                    ),
                    onPressed: (){
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                //if(direction == DismissDirection.endToStart)
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Добавить элемент'),
                  content: TextField(
                    onChanged: (String value) {
                      _userToDo =  value;
                    },
                  ),
                  actions: [
                    ElevatedButton(onPressed: () {
                      setState(() {
                        todoList.add(_userToDo);
                      });

                      Navigator.of(context).pop();
                    }, child: Text('Добавить'))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}