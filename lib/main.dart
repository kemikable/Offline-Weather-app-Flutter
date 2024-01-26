import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black87),
          backgroundColor: const Color.fromARGB(255, 107, 179, 238),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _weatherDescription(),
                const Divider(),
                _temperature(),
                const Divider(),
                _temperatureForecast(),
                const Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
    image: NetworkImage(
        'https://img4.goodfon.ru/original/800x480/e/c5/priroda-oblaka-solnyshko-iasnaia-pogoda.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Tuesday may 22',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, con con  laoreet in in  in in in in in in in in in in in in in in in in Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, con',
        style: TextStyle(color: Colors.black54),
      ),
    ],
  );
}

Row _temperature() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '15 Clear',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'Murmanskaya oblast, Murmans',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 18,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          '${index + 15}*C',
          style: const TextStyle(fontSize: 14),
        ),
        avatar: const Icon(
          Icons.wb_cloudy,
          color: Colors.blue,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        backgroundColor: Colors.yellow.shade200,
      );
    }),
  );
}

Row _footerRatings() {
  const stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        size: 16,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 16,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 16,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 16,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 16,
        color: Colors.black,
      ),
    ],
  );
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'Info with kemikable weather',
        style: TextStyle(fontSize: 16),
      ),
      stars,
    ],
  );
}
