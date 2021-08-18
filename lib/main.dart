import 'package:flutter/material.dart';
import 'package:xylophone_app/widgets/build_list_tile.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlaying = false;

  String currenttiitle = "";
  String currentsinger = "";
  String currentcover = "";

  List myMusic = [
    "asset/Sm3na_com_50178.mp3",
    "asset/Sm3na_com_50179.mp3",
    "asset/Sm3na_com_50180.mp3",
    "asset/Sm3na_com_50182.mp3",
    "asset/Sm3na_com_51317.mp3",
    "asset/Sm3na_com_51335.mp3",
    "asset/Sm3na_com_55461.mp3",
    "asset/Sm3na_com_56906.mp3"
  ];
  int counter = 0;

  void counterstate() {
    if (counter == 2) {
      counter = -1;
    }
    setState(() {
      counter++;
    });
  }

  List listaudios = [
    {
      'title': "First Song",
      'singer': "Manar Ali Gomaa",
      'song': "asset/Sm3na_com_50178.mp3",
      'cover': "asset/manar_photo.jpg"
    },
    {
      'title': "Second Song",
      'singer': "Asmaa ",
      'song': "asset/Sm3na_com_50179.mp3",
      'cover': "asset/lol.jpg"
    },
    {
      'title': "Thired Song",
      'singer': "Amina",
      'song': "asset/Sm3na_com_50180.mp3",
      'cover': "asset/lol.jpg"
    },
    {
      'title': "fourth Song",
      'singer': "nahed",
      'song': "asset/Sm3na_com_50182.mp3",
      'cover': "asset/lol.jpg"
    },
    {
      'title': "Fifth Song",
      'singer': "elham",
      'song': "asset/Sm3na_com_51317.mp3",
      'cover': "asset/lol.jpg"
    },
    {
      'title': "Sixth Song",
      'singer': "aliaa ",
      'song': "asset/Sm3na_com_51335.mp3",
      'cover': "asset/lol.jpg"
    },
    {
      'title': "seventh Song",
      'singer': "afaf",
      'song': "asset/Sm3na_com_55461.mp3",
      'cover': "asset/lol.jpg"
    },
    {
      'title': "eighth Song",
      'singer': "mariam",
      'song': "asset/Sm3na_com_56906.mp3",
      'cover': "asset/lol.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Songs"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => buildListTile(
                  function: () {
                    setState(() {
                      currenttiitle = listaudios[index]['title'];
                      currentsinger = listaudios[index]['singer'];
                      currentcover = listaudios[index]['cover'];
                    });
                  },
                  title: listaudios[index]['title'],
                  singer: listaudios[index]['singer'],
                  cover: listaudios[index]['cover']),
              itemCount: listaudios.length,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white12,
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Slider.adaptive(value: 0, onChanged: (value) {}),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(currentcover),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          currenttiitle,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          currentsinger,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.skip_previous,
                        size: 40,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 40,
                      ),
                      onPressed: () {
                        final player = new AudioCache();
                        player.loadAll([
                          "asset/Sm3na_com_50178.mp3",
                          "asset/Sm3na_com_50179.mp3",
                          "asset/Sm3na_com_50180.mp3",
                          "asset/Sm3na_com_50182.mp3",
                          "asset/Sm3na_com_51317.mp3",
                          "asset/Sm3na_com_51335.mp3",
                          "asset/Sm3na_com_55461.mp3",
                          "asset/Sm3na_com_56906.mp3"
                        ]);
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.skip_next,
                        size: 40,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
