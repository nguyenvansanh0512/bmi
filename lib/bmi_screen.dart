import 'dart:math';

import 'package:flutter/material.dart';

import 'bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool _isMale = true;
  double _height = 120;
  double _age = 20;
  double _weight = 40;
  double? result;

  bool get isMale => _isMale;
  double get height => _height;
  double get age => _age;
  double get weight => _weight;

  set weight(double weight) {
    _weight = weight;
    setState(() {});
  }

  set age(double age) {
    _age = age;
    setState(() {});
  }

  set height(double height) {
    _height = height;
    setState(() {});
  }

  set isMale(bool isMale) {
    _isMale = isMale;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: Text(
          'BMI Calculator'.toUpperCase(),
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black12,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isMale ? Colors.blue : Colors.grey[400],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.male,
                                  size: 50,
                                  color: !isMale ? Colors.white : Colors.white,
                                ),

                                const SizedBox(height: 15),
                                Text(
                                  'MALE',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: isMale ? Colors.white : Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => isMale = true,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isMale ? Colors.grey[400] : Colors.red,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.female,
                                  size: 50,
                                  color: !isMale ? Colors.white : Colors.red,
                                ),

                                const SizedBox(height: 15),
                                Text(
                                  'FEMALE',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: !isMale ? Colors.white : Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => isMale = false,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Height'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 25,
                            color: isMale ? Colors.blueAccent : Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${height.round()}',
                              style: TextStyle(
                                fontSize: 40,
                                color: isMale
                                    ? Colors.blueAccent
                                    : Colors.redAccent,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'CM',
                              style: TextStyle(
                                fontSize: 10,
                                color: isMale
                                    ? Colors.blueAccent
                                    : Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          min: 100,
                          max: 220,
                          value: height,
                          thumbColor: isMale ? Colors.blue : Colors.red,
                          activeColor: isMale ? Colors.blueAccent : Colors.redAccent,
                          inactiveColor: Colors.white30,
                          onChanged: (value) => height = value,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400],
                          ),
                          child: Column(
                            children: [
                              Text(
                                'AGE',
                                style: TextStyle(
                                  color: isMale
                                      ? Colors.blueAccent
                                      : Colors.redAccent,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${age.round()}',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: isMale
                                      ? Colors.blueAccent
                                      : Colors.redAccent,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    elevation: 0,
                                    heroTag: 'age-',
                                    mini: true,
                                    backgroundColor:
                                    isMale ? Colors.blue : Colors.red,
                                    onPressed: () => age--,
                                    child: const Icon(Icons.remove),
                                  ),
                                  FloatingActionButton(
                                    elevation: 0,
                                    heroTag: 'age+',
                                    mini: true,
                                    backgroundColor:
                                    isMale ? Colors.blue : Colors.red,
                                    onPressed: () => age++,
                                    child: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400],
                          ),
                          child: Column(
                            children: [
                              Text(
                                'WEIGHT',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: isMale
                                      ? Colors.blueAccent
                                      : Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${weight.round()}',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: isMale
                                      ? Colors.blueAccent
                                      : Colors.redAccent,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    elevation: 0,
                                    heroTag: 'weight-',
                                    mini: true,
                                    backgroundColor:
                                    isMale ? Colors.blue : Colors.red,
                                    onPressed: () => weight--,
                                    child: const Icon(Icons.remove),
                                  ),
                                  FloatingActionButton(
                                    elevation: 0,
                                    heroTag: 'weight+',
                                    mini: true,
                                    backgroundColor:
                                    isMale ? Colors.blue : Colors.red,
                                    onPressed: () => weight++,
                                    child: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isMale ? Colors.blue : Colors.red,
                    ),
                    width: double.infinity,
                    child: TextButton(
                      child: const Text(
                        'CALCULATE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => calculateBNI(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  calculateBNI(BuildContext context) {
    result = weight / pow(height / 100, 2);
    print(result);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BMIResultScreen(
            height: height,
            isMale: isMale,
            result: result ?? 0,
            weight: weight,
            age: age,
          )),
    );
  }
}
