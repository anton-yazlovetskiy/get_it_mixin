import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:get_it_test/get_it.dart';
import 'package:get_it_test/model.dart';

class SecondPage extends StatefulWidget with GetItStatefulWidgetMixin {
  SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    final myCounterRef = watchOnly((AppModel x) => x.counter);
    final myListRef = watchOnly((AppModel x) => x.list);
    final myListRefLisn = watchX((AppModel x) => x.listLisn);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$myCounterRef'),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myListRef.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(myListRef[index]),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myListRefLisn.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(myListRefLisn[index]),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getIt<AppModel>().addCounter();
          getIt<AppModel>().list.add('${DateTime.now()}');
          getIt<AppModel>().listLisn.value.add('${DateTime.now()}');
        },
        child: const Text('+'),
      ),
    );
  }
}
