import 'package:flutter/material.dart';

class ChooseProf extends StatefulWidget {
  @override
  _ChooseProfState createState() => _ChooseProfState();
}

class _ChooseProfState extends State<ChooseProf> {
  String dropdownValue = "Choose your Prof";

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to Log Out?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Choose your Prof"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Center(
                      child: DropdownButton(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 8,
                        style: TextStyle(color: Colors.black, fontSize: 28.0),
                        underline: Container(
                          height: 2,
                          color: Colors.red,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          'Choose your Prof',
                          'Panitz',
                          'Staab',
                          'Ulges',
                          'Martin'
                        ].map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FlatButton(
                    color: Colors.red,
                    child: Text('Next', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (dropdownValue != "Choose your Prof") {
                        Navigator.pushNamed(
                          context,
                          '/profRating',
                          arguments: {"name": dropdownValue},
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => new AlertDialog(
                            title: new Text('Bitte einen Professor auswählen'),
                            actions: <Widget>[
                              new FlatButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: new Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
