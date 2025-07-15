import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo1',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: const Color.fromARGB(255, 17, 35, 234),
        //   primary: Colors.deepPurple,
        //   secondary: Colors.amber,
        // ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white, // 글자·아이콘 색
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        // backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          TextField(),
          TextField(),
          TextButton(onPressed: () async {}, child: const Text('이메일 변경')),
          TextButton(onPressed: () async {}, child: const Text('회원가입')),
        ],
      ),
    );
  }
}
