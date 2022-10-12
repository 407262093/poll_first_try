import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double spacing_height = 20.0;
  // int _player1_faction = 0;
  // int _player2_faction = 0;
  // final TextEditingController _inputName1 = TextEditingController();
  // final TextEditingController _inputName2 = TextEditingController();
  DateTime _selectime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            SizedBox(height: spacing_height),
            Container(
              height: 200,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: 200,
                        child: TextFormField(
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 20),
                            decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: 'Player1',
                            ))),
                    SizedBox(width: 70),
                    Text(
                      'vs',
                      style: TextStyle(
                          color: Color.fromARGB(97, 46, 112, 156),
                          fontSize: 30),
                    ),
                    SizedBox(width: 70),
                    SizedBox(
                        width: 200,
                        child: TextFormField(
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 20),
                            decoration: InputDecoration(
                              icon: const Icon(Icons.person),
                              hintText: 'Player2',
                            ))),
                  ]),
            ),
            SizedBox(height: spacing_height),
            Container(
              height: 100,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'point',
                      style: TextStyle(
                          color: Color.fromARGB(97, 46, 112, 156),
                          fontSize: 30),
                    ),
                    SizedBox(width: 30),
                    SizedBox(
                        width: 150,
                        child: TextFormField(
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 20),
                            decoration: InputDecoration(
                              hintText: 'Player1',
                            ))),
                    SizedBox(width: 50),
                    Text(
                      ' : ',
                      style: TextStyle(
                          color: Color.fromARGB(97, 46, 112, 156),
                          fontSize: 30),
                    ),
                    SizedBox(width: 50),
                    SizedBox(
                        width: 150,
                        child: TextFormField(
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 20),
                            decoration: InputDecoration(
                              hintText: 'Player2',
                            ))),
                    SizedBox(width: 100),
                  ]),
            ),
            Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        '${_selectime.year}/${_selectime.month}/${_selectime.day}'),
                    SizedBox(width: 15),
                    ElevatedButton(
                      child: Text('Select Date'),
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2060));
                        if (newDate != null && newDate != _selectime) {
                          setState(() {
                            _selectime = newDate;
                          });
                        }
                      },
                    )
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => nextPage()));
          },
          tooltip: 'NextPage',
          child: const Icon(Icons.arrow_forward)),
    );
  }
}

class nextPage extends StatelessWidget {
  const nextPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'using SQL',
      // home: const SearchPage(),
    );
  }
}

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});
//   @override
//   State <SearchPage> createState() => _SearchPage();
// }

// class __SearchPage extends State <SearchPage>{
//   var db = await openDatabase(path)
// }