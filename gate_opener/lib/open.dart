import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

class Open extends StatefulWidget {
  const Open({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Open> createState() => _OpenState();
}

class _OpenState extends State<Open> {
  TextEditingController numberPlateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open the Gate')
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
            child: Column(
                children: <Widget>[
                  TextField(
                controller: numberPlateController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number Plate',
                hintText: 'Enter car number plate'
              ),
              ),
              SizedBox(height: 25),
              // CustomTextField(
              //
              // ),
              ElevatedButton(
                   onPressed:  () async {
                  var noPlate = numberPlateController.text;

                  var url = Uri.parse('http://192.168.0.249:5000/open');
                  int response = (await http.get(url)) as int;
                  if (response == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('SUCCESS'),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Failed to connect to server')));
                    throw Exception('Failed to connect to server');
                  }
            },
                child: Text('Open the gate'),
    ),
              Padding(padding: EdgeInsets.all(80.0)),
    ],
            ),
        ),
    );

  }
}