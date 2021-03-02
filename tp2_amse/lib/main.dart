import 'dart:html';
import 'dart:js_util';
import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'TP2';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
          appBar: AppBar(title: const Text(_title)),
          body: SingleChildScrollView(
            child: MyStatelessWidget(),
          )),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Exercice 1'),
              subtitle: Text('Affichage image'),
              enabled: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Afficher'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exo1()),
                    );
                  },
                ),
                const SizedBox(width: 2),
              ],
            ),
            const ListTile(
                leading: Icon(Icons.album),
                title: Text('Exercice 2'),
                subtitle: Text('Transformer une image')),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Afficher'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exo2State()),
                    );
                  },
                ),
                const SizedBox(width: 2),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Exercice 4'),
              subtitle: Text('Affichage de tuile'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Afficher'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exo4()),
                    );
                  },
                ),
                const SizedBox(width: 2),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Exercice 5a'),
              subtitle: Text('Génération du plateau de tuiles'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Afficher'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exo5a()),
                    );
                  },
                ),
                const SizedBox(width: 2),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Exercice 5b'),
              subtitle: Text('Plateau de tuiles avec image'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Afficher'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exo5b()),
                    );
                  },
                ),
                const SizedBox(width: 2),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Exercice 5c'),
              subtitle: Text('Plateau de tuiles à taille réglable'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Afficher'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exo5cState()),
                    );
                  },
                ),
                const SizedBox(width: 2),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Exercice 6'),
              subtitle: Text('Animation de tuile'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Afficher'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exo6()),
                    );
                  },
                ),
                const SizedBox(width: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Exo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 1'),
      ),
      body: Image.asset('assets/picsum1.jpg'),
    );
  }
}

class Exo2State extends StatefulWidget {
  @override
  _Exo2 createState() => _Exo2();
}

class _Exo2 extends State<Exo2State> {
  double _valueX = 0.0;
  bool miroir = false;
  double _scale = 1;
  int miroirInt = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 2'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: new Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.amber,
                child: Transform.scale(
                  scale: _scale,
                  child: Transform.rotate(
                    angle: _valueX,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi * miroirInt),
                      child: Image.asset('picsum2.jpg'),
                    ),
                  ),
                ),
              ),
              Container(
                child: new Row(
                  children: [
                    Text('Rotate X'),
                    Slider(
                      min: 0,
                      max: 15,
                      value: _valueX,
                      onChanged: (value) {
                        setState(() {
                          _valueX = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: new Row(
                  children: [
                    Text('Miroir'),
                    new Checkbox(
                      value: miroir,
                      activeColor: Colors.green,
                      onChanged: (bool value) {
                        setState(() {
                          miroir = value;
                        });
                        if (value) {
                          miroirInt = 1;
                        } else {
                          miroirInt = 0;
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: new Row(
                  children: [
                    Text('Scale'),
                    Slider(
                      min: 0,
                      max: 2,
                      value: _scale,
                      onChanged: (value) {
                        setState(() {
                          _scale = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tile {
  String imageURL;
  Alignment alignment;
  Color color;

  Tile({this.imageURL, this.alignment});

  Widget croppedImageTile(double size) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1 / size,
            heightFactor: 1 / size,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }

  Widget croppedImageTile2(int index, int size) {
    int q = index ~/ size;
    int r = index % size;
    int n = size - 1;

    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: FractionalOffset(r / n, q / n),
            widthFactor: 1 / size,
            heightFactor: 1 / size,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

Tile tile =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(0, 0));

class Exo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 4'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: this.createTileWidgetFrom(tile))),
        Container(
            height: 200,
            child:
                Image.network('https://picsum.photos/512', fit: BoxFit.cover))
      ])),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(3),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}

final List<Map> mySimpleTiles = List.generate(
    9,
    (index) => {
          "id": index,
          "name": "Tile $index",
          "color": (index + 1) * 100
        }).toList();

class Exo5a extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5a'),
      ),
      body: Center(
        child: Container(
          width: 512,
          height: 512,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1),
            itemCount: mySimpleTiles.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                width: 512,
                height: 512,
                alignment: Alignment.center,
                child: Text(mySimpleTiles[index]["name"]),
                color: Colors.teal[mySimpleTiles[index]["color"]],
              );
            },
          ),
        ),
      ),
    );
  }
}

final List<Map> myNineTiles = List.generate(
    9,
    (index) => {
          "id": index,
          "image": tile,
          "tileNum": index + 1,
        }).toList();

class Exo5b extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5b'),
      ),
      body: Center(
        child: Container(
          width: 512,
          height: 512,
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                width: 512,
                height: 512,
                alignment: Alignment.center,
                child: this.createTileWidgetFrom(
                    myNineTiles[index]["image"], myNineTiles[index]["tileNum"]),
              );
            },
          ),
        ),
      ),
    );
  }

  int findCorrespondingLine(int tileNum) {
    if ((tileNum / 3) <= 1) {
      return (1);
    } else if ((tileNum / 3) <= 2) {
      return (3);
    } else {
      return (5);
    }
  }

  int findCorrespondingColumn(int tileNum) {
    if ((tileNum % 3 == 1)) {
      return (1);
    } else if ((tileNum % 3 == 2)) {
      return (3);
    } else {
      return (5);
    }
  }

  Widget createTileWidgetFrom(Tile tile, int i) {
    double y = ((1 / 3) * findCorrespondingLine(i)) - 1;
    double x = ((1 / 3) * findCorrespondingColumn(i)) - 1;
    tile.alignment = Alignment(x, y);
    return InkWell(child: tile.croppedImageTile(3));
  }
}

class Exo5cState extends StatefulWidget {
  @override
  _Exercice5cState createState() => _Exercice5cState();
}

class _Exercice5cState extends State<Exo5cState> {
  double size = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5c'),
      ),
      body: Container(
        width: 516,
        height: 516,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SizedBox(
                height: 500,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size.toInt(),
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemCount: math.pow(size.toInt(), 2),
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(children: [
                        SizedBox(
                          width: ((375 - (size - 1) * 4) / size) + 20,
                          height: ((375 - (size - 1) * 4) / size) + 20,
                          child: Container(
                            margin: EdgeInsets.all(0.0),
                            child: this.createTileWidgetFrom2(
                                tile, index, size.toInt()),
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              ),
            ),
            Slider(
              min: 3.0,
              max: 8.0,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              divisions: 5,
              value: size,
              label: size.round().toString(),
              onChanged: (double value) {
                setState(() {
                  size = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget createTileWidgetFrom2(Tile tile, int index, int taille) {
    return InkWell(
      child: tile.croppedImageTile2(index, taille),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}

math.Random random = new math.Random();

class Tile2 {
  Color color;

  Tile2(this.color);
  Tile2.randomColor() {
    this.color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

class Tile3 {
  String image;
  int index;

  Tile3({this.image, this.index});

  Widget getCroppedTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            widthFactor: 0.3,
            heightFactor: 0.3,
            alignment: Alignment.centerLeft,
            child: Image.network(this.image),
          ),
        ),
      ),
    );
  }

  Widget newCroppedTile(int size) {
    int quot = index ~/ size;
    int rest = index % size;
    int n = size - 1;
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            widthFactor: 1 / size,
            heightFactor: 1 / size,
            alignment: FractionalOffset(rest / n, quot / n),
            child: Image.network(this.image),
          ),
        ),
      ),
    );
  }
}

class Exo6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Exo6State();
}

class Exo6State extends State<Exo6> {
  double size = 3;
  List<Tile3> tiles;
  @override
  void initState() {
    super.initState();
    tiles = initTiles();
  }

  List<Tile3> initTiles() {
    return (List.generate(
        (size * size).toInt(),
        (index) =>
            new Tile3(image: 'https://picsum.photos/512', index: index)));
  }

  List<Widget> getTileWidgets(List<Tile3> initTiles) {
    List<Widget> tiles = [];
    for (var i = 0; i < (size * size).toInt(); i++) {
      tiles.add(createTileWidgetFrom(initTiles[i], i, size.toInt()));
    }
    return tiles;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 6'),
      ),
      body: Container(
        width: 516,
        height: 516,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SizedBox(
                height: 500,
                child: GridView.count(
                  padding: const EdgeInsets.all(0),
                  crossAxisCount: size.toInt(),
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  primary: false,
                  children: getTileWidgets(tiles),
                ),
              ),
            ),
            Slider(
              min: 3.0,
              max: 8.0,
              divisions: 5,
              value: size,
              onChanged: (double value) {
                setState(() {
                  size = value;
                  tiles = initTiles();
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget createTileWidgetFrom(
    //Tile to Widget
    Tile3 plateau,
    int index,
    int size,
  ) {
    Widget tuile;
    tuile = plateau.newCroppedTile(size);
    return InkWell(
      child: tuile,
      onTap: () {
        swapTile(index);
      },
    );
  }

  swapTile(int index) {
    setState(() {
      tiles.insert(index, tiles.removeAt(index + 1));
    });
  }
}
