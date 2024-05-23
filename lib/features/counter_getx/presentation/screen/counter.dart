import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_kitchen_technical_assignment/features/counter_getx/data/counter_controller.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${counterController.count}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                counterController.increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
