import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _selectGreetings = "Hello";
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Screen"),
        backgroundColor: const Color.fromARGB(255, 154, 241, 120),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              value: _selectGreetings,
              items: ["Hello", "Hi", "Welcome"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectGreetings = value!;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: Colors.primaries.take(5).map(
                (color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _color = color;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 30,
                      color: color,
                      child: _color == color
                          ? Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                },
              ).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/greetings',
                  arguments: {
                    'name': _nameController.text,
                    'greetings': _selectGreetings,
                    'color': _color,
                  },
                );
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
