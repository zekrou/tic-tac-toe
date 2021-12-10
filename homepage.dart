import 'package:flutter/material.dart';
import 'package:tic/dialog.dart';
import 'gamebutton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final title = 'Grid List';
  var activeplayer = 1;
  var player1 = [];
  var player2 = [];

  String gamestr = 'Play your Turn';

  List listButton = <GameButton>[
    new GameButton(1),
    new GameButton(2),
    new GameButton(3),
    new GameButton(4),
    new GameButton(5),
    new GameButton(6),
    new GameButton(7),
    new GameButton(8),
    new GameButton(9)
  ];

  void playGame(int index) {
    setState(() {
      if (activeplayer == 1) {
        listButton[index].str = 'X';
        listButton[index].clr = Colors.red;
        activeplayer = 2;
        player1.add(index);
      } else {
        listButton[index].str = 'O';
        listButton[index].clr = Colors.blue;
        activeplayer = 1;
        player2.add(index);
      }
      listButton[index].enabled = false;
      int winner = checkWinner();
      if (winner != -1) {
        if (winner == 1) {
        } else {}
      }
    });
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(0) && player1.contains(1) && player1.contains(2)) {
      winner = 1;
    }
    if (player2.contains(0) && player2.contains(1) && player2.contains(2)) {
      winner = 2;
    }
    if (player1.contains(3) && player1.contains(4) && player1.contains(5)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(4) && player2.contains(5)) {
      winner = 2;
    }
    if (player1.contains(6) && player1.contains(7) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(6) && player2.contains(7) && player2.contains(8)) {
      winner = 2;
    }
    if (player1.contains(0) && player1.contains(3) && player1.contains(6)) {
      winner = 1;
    }
    if (player1.contains(0) && player1.contains(3) && player1.contains(6)) {
      winner = 2;
    }
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    if (player1.contains(0) && player1.contains(4) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(0) && player2.contains(4) && player2.contains(8)) {
      winner = 2;
    }
    if (player1.contains(2) && player1.contains(4) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(4) && player2.contains(6)) {
      winner = 2;
    }
    return winner;
  }

  void reset() {
    for (int i = 0; i < 9; i++) {
      listButton[i].str = '';
      listButton[i].enabled = true;
      listButton[i].clr = Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello world"),
          centerTitle: true,
          backgroundColor: Colors.red[600],
        ),
        body: Column(children: <Widget>[
          Expanded(
              flex: 10,
              child: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return new RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        listButton[index].str,
                        style:
                            new TextStyle(color: Colors.white, fontSize: 60.0),
                      ),
                      color: listButton[index].clr,
                      disabledColor: Colors.grey,
                      onPressed: () {
                        setState(() {
                          if (listButton[index].enabled) {
                            playGame(index);
                          }
                        });
                      },
                    );
                  })),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Text("reset"),
          backgroundColor: Colors.red[800],
          onPressed: () {
            setState(() {
              reset();
            });
          },
        ),
      ),
    );
  }
}
