import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {var _imageempty = const AssetImage('assets/images/empty.png');
var _imagememptyplayer = const AssetImage('assets/images/empty.png');
String Resultmsg = '';
bool game = false;

void choice(String gamechoice) {
  var choice = ['rock', 'paper', 'scissor'];
  var num = Random().nextInt(3);
  var choiceBot = choice[num];

  Timer(const Duration(seconds: 1), () {
    switch (choiceBot) {
      case "rock":
        setState(() {
          _imageempty = const AssetImage("assets/images/rock.png");
        });
        break;

      case "paper":
        setState(() {
          _imageempty = const AssetImage("assets/images/paper.png");
        });
        break;
      case "scissor":
        setState(() {
          _imageempty = const AssetImage("assets/images/scissor.png");
        });
        break;
    }
  });

  setState(() {
    if ((gamechoice == 'rock' && choiceBot == 'scissor') ||
        (gamechoice == 'scissor' && choiceBot == 'paper') ||
        (gamechoice == 'paper' && choiceBot == 'rock')) {
      Timer(const Duration(seconds: 1), () {
        Resultmsg = 'YOU WON!';
      });
    } else if ((gamechoice == 'scissor' && choiceBot == 'rock') ||
        (gamechoice == 'paper' && choiceBot == 'scissor') ||
        (gamechoice == 'rock' && choiceBot == 'paper')) {
      Timer(const Duration(seconds: 1), () {
        Resultmsg = "YOU LOSE!";
      });
    } else {
      Timer(const Duration(seconds: 1), () {
        Resultmsg = "DRAW!";
      });
    }
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[400],
    appBar: AppBar(
      title: const Text(
        'Rock Paper Scissor ',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      toolbarHeight: 80,
    ),
    body: Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(32),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  const Text(
                    'YOU',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image(
                    image: _imagememptyplayer,
                    height: 150,
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'COMPUTER',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image(
                    image: _imageempty,
                    height: 150,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              Resultmsg,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AbsorbPointer(
            absorbing: game,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    game = true;
                    choice('rock');
                    _imagememptyplayer = const AssetImage('assets/images/rock.png');
                    _espera();

                    fimJogoIniciado();
                  },
                  child: Image.asset(
                    'assets/images/rock.png',
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    game = true;
                    choice('paper');
                    _imagememptyplayer =
                        const AssetImage('assets/images/paper.png');
                    _espera();

                    fimJogoIniciado();
                  },
                  child: Image.asset(
                    'assets/images/paper.png',
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    game = true;
                    choice('scissor');
                    _imagememptyplayer =
                        const AssetImage('assets/images/scissor.png');
                    _espera();

                    fimJogoIniciado();
                  },
                  child: Image.asset(
                    'assets/images/scissor.png',
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

void fimJogoIniciado() {
  Timer(const Duration(seconds: 2), () {
    setState(() {
      game = false;
    });
  });
}

void _espera() {
  Timer(const Duration(seconds: 5), () {
    setState(() {
      _imageempty = const AssetImage('assets/images/empty.png');
      _imagememptyplayer = const AssetImage('assets/images/empty.png');
      Resultmsg = '';
    });
  });
}
}