import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: bmi(),
    debugShowCheckedModeBanner: false,
  ));
}

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  var tf1 = TextEditingController();
  var tf2 = TextEditingController();
  var BMI = 0.0;
  var status = "";
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text("BMI CALCULATOR"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 200,
              child: Image.network(
                  "https://secretsofhealthyeating.com/wp-content/uploads/2018/09/BMI-Analysis-Pre-Obese.jpg"),
              color: Colors.blueGrey,
            ),
          ),
          Center(
            child: Text(
              status,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
          ),
          Center(
            child: Text(
              BMI.toStringAsFixed(1),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WEIGHT",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: tf1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Weight in Kilogram"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: tf2,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Height in Metres"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  var weight = double.parse(tf1.text);
                  var height = double.parse(tf2.text);
                  var result = (weight) / (height * height);
                  BMI = result;
                  if (BMI > 25.0) {
                    status = ("You are OBESE !!!");
                  } else if (BMI < 19.0) {
                    status = ("You are LEAN !!!");
                  } else {
                    status = ("You are FIT !!!!");
                  }
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black87)),
              child: Text("Calculate BMI",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
