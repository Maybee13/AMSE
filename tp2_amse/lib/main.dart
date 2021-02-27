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
                      MaterialPageRoute(builder: (context) => Exo5c()),
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
      body: Center(
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
    );
  }
}

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({this.imageURL, this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
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
      child: tile.croppedImageTile(),
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
    return InkWell(child: tile.croppedImageTile());
  }
}

class Exo5c extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5c'),
      ),
      body: Center(),
    );
  }
}
