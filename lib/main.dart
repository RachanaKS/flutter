import 'package:flutter/material.dart';
import 'package:simple/restapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Flutter with Express',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MyHomePage(title: 'Connect Flutter with Express JS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Restapi restapijs = Restapi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<List>(
          future: restapijs.getdata(),
          builder: (context, snapshot) {
            // print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data![i]['name'],
                        style: const TextStyle(fontSize: 30.0),
                      ),
                      subtitle: Text(
                        snapshot.data![i]['update'],
                        style: const TextStyle(fontSize: 30.0),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No Data Found'),
              );
            }
          },
        ));
  }
}
