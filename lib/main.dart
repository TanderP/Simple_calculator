import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'TextControlFile.dart';

//

// simple calculator
// https://github.com/TanderP/Simple_calculator.git

//
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Calculator'),
      debugShowCheckedModeBanner: false, // to remove debug banner
      darkTheme: ThemeData.dark(),
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
  // var and funct
  void plusFunction() {
    setState(() {
      variable.hasil = variable.inp1 + variable.inp2;
    });
  }

  void minFunction() {
    setState(() {
      variable.hasil = variable.inp1 - variable.inp2;
    });
  }

  void multiFunction() {
    setState(() {
      variable.hasil = variable.inp1 * variable.inp2;
    });
  }

  void divideFunction() {
    setState(() {
      variable.hasil = variable.inp1 / variable.inp2;
    });
  }

  // Textfield inp
  void onTyped1(double inp1Val) {
    setState(() {
      variable.inp1 = inp1Val;
    });
  }

  void onTyped2(double inp2Val) {
    setState(() {
      variable.inp2 = inp2Val;
    });
  }

  // text controller
  var inp1Controller = TextEditingController();
  var inp2Controller = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          height: 600,
          child: Container(
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Simple Calculator",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                      inputFormatters: [CustomTextInputFormatter()],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Input 1',
                      ),
                      controller: inp1Controller,
                      onSubmitted: (value) {
                        onTyped1(double.parse(value));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                      inputFormatters: [CustomTextInputFormatter()],
                      // only nuumber
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Input 2',
                      ),
                      controller: inp2Controller,
                      onSubmitted: (value) {
                        onTyped2(double.parse(value));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                onTyped1(double.parse(inp1Controller.text));
                                onTyped2(double.parse(inp2Controller.text));
                                plusFunction();
                              });
                            },
                            backgroundColor: Colors.green,
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  onTyped1(double.parse(inp1Controller.text));
                                  onTyped2(double.parse(inp2Controller.text));
                                  minFunction();
                                });
                              },
                              backgroundColor: Colors.red,
                              child: Text("-",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ))),
                          SizedBox(
                            width: 30,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                onTyped1(double.parse(inp1Controller.text));
                                onTyped2(double.parse(inp2Controller.text));
                                multiFunction();
                              });
                            },
                            backgroundColor: Colors.teal,
                            child: Text("X",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                onTyped1(double.parse(inp1Controller.text));
                                onTyped2(double.parse(inp2Controller.text));
                                divideFunction();
                              });
                            },
                            backgroundColor: Colors.amberAccent,
                            child: Text(
                              "÷",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepOrange),
                    ),
                    onPressed: () {
                      setState(() {
                        inp1Controller.clear();
                        inp2Controller.clear();
                        variable.hasil = 0;
                      });
                    },
                    child: Text("Clear"),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 500,
                    child: Text("Result : ${variable.hasil} ",
                        style: TextStyle(
                          fontSize: 30,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// function V

class variable {
  static double inp1 = 0;
  static double inp2 = 0;
  static double hasil = 0;
}
