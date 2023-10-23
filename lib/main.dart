import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MultiProvider(
              providers: [
                ProxyProvider0<int>(
                  update: (context, _) => _counter,
                ),
                ProxyProvider<int, Translations>(
                    update: (_, counter, __) => Translations(counter)),
              ],
              child: const CounterNumber(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Translations {
  final int _value;

  Translations(this._value);

  String get title => "You clicked $_value times";
}

class CounterNumber extends StatelessWidget {
  const CounterNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final translation = Provider.of<Translations>(context);

    return Text(
      translation.title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
