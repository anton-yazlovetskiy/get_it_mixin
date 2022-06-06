import 'package:flutter/material.dart';
import 'package:get_it_test/get_it.dart';
import 'package:get_it_test/model.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('${getIt<AppModel>().counter}'),
      ),
    );
  }
}
