import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double age = 0.0;
  var selectedYear;

  void _showPicker() {
    showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((DateTime dt) {
      selectedYear = dt.year;
      calculateAge();
    });

  }


  void calculateAge() {
    setState(() {
      age = (2019 - selectedYear).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Age Calculator"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                    selectedYear != null ? selectedYear.toString() : "    Year   ",textScaleFactor: 2.0,),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                color: Colors.brown,
                onPressed: _showPicker,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
              ),
              Text(
                "Your age is ${age.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
