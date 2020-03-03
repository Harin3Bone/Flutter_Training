import 'package:flutter/material.dart';

void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  final appTitle = 'Example Form';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      initialRoute: '/',
      routes: {
        // '/homepage': (context) => Homepage(),
      },
      home: MyApp(title: appTitle),
    );
  }
}

class MyApp extends StatelessWidget {
  final String title;
  MyApp({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
          child: ListView(children: <Widget>[
        MyRadio(),
      ])),
    );
  }
}


class MyRadio extends StatefulWidget {
  MyRadio({Key key}) : super(key: key);

  @override
  _MyRadioState createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  //! Checkbox widget create
  bool checkboxValueA = true;
  bool checkboxValueB = true;

  //! variable declare
  // int route;
  String sex;

  @override
  Widget build(BuildContext context) {
    return Container(
      //! EdgeInsets = padding 
        //? symmetric vertical    -> padding Top  Bottom
        //? symmetric horizontal  -> padding Left Right 
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [              
              //# Radio = Radio Button
              Radio(                
                // value: 1,
                value: 'Male',
                groupValue: sex,
                onChanged: (value) {
                  setState(() {
                    // route = value;
                    sex = value;
                  });
                },
              ),

              Text('Male'),

              //# Radio = Radio Button
              Radio(
                // value: 0,
                value: 'Female',
                groupValue: sex,
                onChanged: (value) {
                  // _handleTapboxChanged(value);
                  setState(() {
                    // route = value;
                    sex = value;
                  });
                },
              ),

              Text('Female'),
            ]),
            Row(children: [
              Checkbox(
                value: checkboxValueA, 

                //! onChange = method -> 
                onChanged: (bool value){

                  //? setState = change UI
                  setState(() {
                    checkboxValueA = value;
                    print(checkboxValueA);
                  });
                }),

                Text('Checkbox A'),

                Checkbox(
                value: checkboxValueB, 

                //! onChange = method -> 
                onChanged: (bool value){

                  //? setState = change UI
                  setState(() {
                    checkboxValueB = value;
                    print(checkboxValueB);
                  });
                }),
                
                Text('Checkbox B'),

            ]),
            Row(children: [
              Text('$sex'),
            ]),
          ]),
    );
  }
}