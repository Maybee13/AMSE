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

  Widget croppedImageTile1() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }

  Widget croppedImageTile2() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.topCenter,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }

  Widget croppedImageTile3() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.topRight,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }

  Widget croppedImageTile4() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }

  Widget croppedImageTile5() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.center,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }

  Widget croppedImageTile6() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.centerRight,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }

  Widget croppedImageTile7() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.bottomLeft,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }

  Widget croppedImageTile8() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }

  Widget croppedImageTile9() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.bottomRight,
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
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Tile 1'),
                color: Colors.teal[100],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Tile 2'),
                color: Colors.teal[200],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Tile 3'),
                color: Colors.teal[300],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Tile 4'),
                color: Colors.teal[400],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Tile 5'),
                color: Colors.teal[500],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Tile 6'),
                color: Colors.teal[600],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Tile 7'),
                color: Colors.teal[700],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Tile 8'),
                color: Colors.teal[800],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Tile 9'),
                color: Colors.teal[900],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(0),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0),
                child: this.createTileWidgetFrom(tile, 1),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: this.createTileWidgetFrom(tile, 2),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: this.createTileWidgetFrom(tile, 3),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: this.createTileWidgetFrom(tile, 4),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: this.createTileWidgetFrom(tile, 5),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: this.createTileWidgetFrom(tile, 6),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: this.createTileWidgetFrom(tile, 7),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: this.createTileWidgetFrom(tile, 8),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: this.createTileWidgetFrom(tile, 9),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createTileWidgetFrom(Tile tile, int i) {
    switch (i) {
      case (1):
        {
          return InkWell(child: tile.croppedImageTile1());
        }
        break;
      case (2):
        {
          return InkWell(child: tile.croppedImageTile2());
        }
        break;
      case (3):
        {
          return InkWell(child: tile.croppedImageTile3());
        }
        break;
      case (4):
        {
          return InkWell(child: tile.croppedImageTile4());
        }
        break;
      case (5):
        {
          return InkWell(child: tile.croppedImageTile5());
        }
        break;
      case (6):
        {
          return InkWell(child: tile.croppedImageTile6());
        }
        break;
      case (7):
        {
          return InkWell(child: tile.croppedImageTile7());
        }
        break;
      case (8):
        {
          return InkWell(child: tile.croppedImageTile8());
        }
        break;
      case (9):
        {
          return InkWell(child: tile.croppedImageTile9());
        }
        break;
      default:
        {
          return InkWell(child: tile.croppedImageTile());
        }
        break;
    }
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
