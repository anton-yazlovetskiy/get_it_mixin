import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:get_it_test/get_it.dart';
import 'package:get_it_test/model.dart';
import 'package:get_it_test/second_page.dart';

void main() {
  initialGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget with GetItMixin {
  MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final myCounterRef = watchOnly((AppModel x) => x.counter);
    final myListRef = watchOnly((AppModel x) => x.list);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get It'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$myCounterRef'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ));
              },
              child: const Text('Second page'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myListRef.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(myListRef[index]),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getIt<AppModel>().addCounter();
          getIt<AppModel>().list.add('${DateTime.now()}');
          //setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
