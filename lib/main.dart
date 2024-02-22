import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(),
              ),
            ).then((value) {
              // Получаем данные с второго экрана и выводим их на главном экране
              if (value != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data from second screen: $value')),
                );
              }
            });
          },
          child: Text('Перейти к следующему экрану'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Возвращаем данные на предыдущий экран при помощи Navigator.pop
            Navigator.pop(context, 'Hello from second screen');
          },
          child: Text('Вернуться'),
        ),
      ),
    );
  }
}
