import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyObject {
  int _value;

  MyObject(this._value);

  int get value => _value;
  set value(newValue) => _value = newValue;

  void increase() {
    _value++;
  }

  void decrease() {
    _value--;
  }

  void square() {
    _value = _value * _value;
  }

  void power(int exponent) {
    int base = _value;
    _value = 1;
    for (int i = 0; i < exponent; i++) {
      _value *= base;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyObject myObject = MyObject(0);
  int exponent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Object App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Value: ${myObject.value}',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  myObject.increase();
                });
              },
              child: const Text('Increase'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  myObject.decrease();
                });
              },
              child: const Text('Decrease'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  myObject.square();
                });
              },
              child: const Text('Square'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: "Nhập số mũ"),
                      onChanged: (value) {
                        exponent = int.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        myObject.power(exponent);
                      });
                    },
                    child: const Text('Tính'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
