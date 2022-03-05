import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  double celcius = 0;
  double kelvin = 0;
  double reamur = 0;

  void Convert() {
    setState(() {
      double celcius = double.parse(controller.text);
      reamur = 0.8 * celcius;
      kelvin = celcius + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobsheet 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration:
                    InputDecoration(hintText: "Masukkan Nilai Suhu Celcius"),
                keyboardType: TextInputType.number,
                controller: controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Suhu Dalam Kelvin",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        '$kelvin',
                        style: TextStyle(fontSize: 35),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Suhu Dalam Reamur",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        '$reamur',
                        style: TextStyle(fontSize: 35),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: Convert,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text('Konversi Suhu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
