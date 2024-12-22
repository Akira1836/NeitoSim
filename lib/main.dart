import 'dart:math';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '成長合成シミュレーター'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _sum = 0;
  int? _result1;
  int? _result2;
  int? _result3;
  int? _result4;

  String _message =
      'フム･･･俺は錬金術師ネイト。装備に特殊な材料を組み合わせて、特別な力をつける成長合成をやっているが･･･試してみるかね？';

  static const int _min = 1;
  static const int _max = 10;

  void _showResult1() {
    setState(() {
      // _result1に1から10までの乱数を代入する
      _result1 = _min + (Random().nextInt(_max - _min + 1));
      // _sumに_result1を加算する
      _sum += _result1!;

      // メッセージを変更する
      _message = "おめでとうございます！\n成長合成に成功しました！";
    });
  }

  void _showResult2() {
    setState(() {
      // _result2に1から10までの乱数を代入する
      _result2 = _min + (Random().nextInt(_max - _min + 1));
      // _sumに_result2を加算する
      _sum += _result2!;
    });
  }

  void _showResult3() {
    setState(() {
      // _result3に1から10までの乱数を代入する
      _result3 = _min + (Random().nextInt(_max - _min + 1));
      // _sumに_result3を加算する
      _sum += _result3!;
    });
  }

  void _showResult4() {
    setState(() {
      // _result4に1から10までの乱数を代入する
      _result4 = _min + (Random().nextInt(_max - _min + 1));
      // _sumに_result4を加算する
      _sum += _result4!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          child:
              // 画面上部のColumn
              Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Flexibleを使用して、テキストを自動的に改行させる
                Flexible(
                  child: Column(children: [
                    Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 80, 180, 83),
                        ),
                        width: 200,
                        child: Text("ネイト",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12))),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 38, 105, 40),
                      ),
                      width: 200,
                      child:
                          // すべてのresultがnullでないなら"また明日きてくれ。"と表示する
                          _result1 != null &&
                                  _result2 != null &&
                                  _result3 != null &&
                                  _result4 != null
                              ? Text("また明日きてくれ。",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                              : Text("$_message",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                    ),
                    // スペース
                    const SizedBox(height: 10),
                    // 画像を表示
                    Image(image: AssetImage('images/neito.png')),
                  ]),
                ),
                // 結果の合計を表示
                Column(children: [
                  Text(
                    "合計",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    '$_sum',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ]),
              ]),
              // スペース用のSizedBox
              const SizedBox(height: 50),
              // 画面中段の結果表示
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: null,
                    child: _result1 == null
                        ? const Text("")
                        : Text(
                            '$_result1',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: null,
                    child: _result2 == null
                        ? const Text("")
                        : Text(
                            '$_result2',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: null,
                    child: _result3 == null
                        ? const Text("")
                        : Text(
                            '$_result3',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: null,
                    child: _result4 == null
                        ? const Text("")
                        : Text(
                            '$_result4',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                  ),
                ],
              ),
              // スペース用のSizedBox
              const SizedBox(height: 50),
              // 画面下部のボタン
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: _result1 == null ? _showResult1 : null,
                    child: _result1 == null ? const Text("合成") : const Text(""),
                  ),
                  FloatingActionButton(
                    onPressed: _result2 == null ? _showResult2 : null,
                    child: _result2 == null ? const Text("合成") : const Text(""),
                  ),
                  FloatingActionButton(
                    onPressed: _result3 == null ? _showResult3 : null,
                    child: _result3 == null ? const Text("合成") : const Text(""),
                  ),
                  FloatingActionButton(
                    onPressed: _result4 == null ? _showResult4 : null,
                    child: _result4 == null ? const Text("合成") : const Text(""),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
