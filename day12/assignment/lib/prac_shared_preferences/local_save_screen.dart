import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSaveScreen extends StatefulWidget {
  const LocalSaveScreen({super.key});

  @override
  State<LocalSaveScreen> createState() => _LocalSaveScreenState();
}

class _LocalSaveScreenState extends State<LocalSaveScreen> {
  int _counter = 0;
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();

    initPreferences();
  }

  initPreferences() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs != null) {
      _counter = prefs!.getInt('_counter') ?? 0;
      setState(() {});
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    if (prefs != null) prefs!.setInt('_counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Save Screen'),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
