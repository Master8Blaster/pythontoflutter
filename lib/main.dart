import 'package:chaquopy/chaquopy.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String output = "";

  String input = "import rembg"
      " from PIL import Image"
      " # Load the input image"
      "input_image = Image.open('input_image.png')"
      "# Use rembg to remove the background"
      "output_image = rembg.remove(input_image)"
      "# Save the output image"
      "output_image.save('output_image.png')";
  String _outputOrError = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You have pushed the button this many times: $output",
            ),
            ElevatedButton(
              onPressed: () async {
                final _result = await Chaquopy.executeCode(input);
                print(_result);
                setState(() {
                  output = _result['textOutputOrError'] ?? '';
                });
              },
              child: const Text("Run the code"),
            ),
          ],
        ),
      ),
    );
  }
}
