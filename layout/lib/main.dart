import 'package:flutter/material.dart';

import 'container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            // 列模式下主轴为Y轴，默认对对齐在start，X轴对齐在中间
            mainAxisAlignment: MainAxisAlignment.start,
            // 指定纵轴按开始对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //
              Text(
                '1. 容器没有约束且父组件也没有约束(即使指定了alignment)，则容器大小为尽可能小，因此在屏幕不显示',
              ),
              NoConstraintsContainerDemo(),

              //
              Text(
                '2. 容器的父组件指定了约束，容器无child且指定了宽、高或者constraints约束，则子容器会根据这些约束尽可能的小 ???',
              ),
              ContainerCombinationConstraintsDemo(),

              //
              Text(
                '2. 一个长高分别为100的容器，容器对齐方式为topRight',
              ),
              TopLeftContainerDemo(),
              //
              Text(
                '仅指定了高度的容器',
              ),
              NormalContainerDemo(),

              //
              Text(
                '3. 容器有Child且仅指定了高度，没有指定alignment，则容器的宽度由child的宽度决定',
              ),
              ContainerWithChildDemo(),

              //
              Text(
                '4. 容器有Child且无约束，仅指定了alignment，则它会包围子组件的大小',
              ),
              ContainerWithAlignmentAndChildDemo(),

              //
              ContainerWithHeightAlignmentAndChildDemo(),

              //
              Text(
                '6. 父组件指定了约束，它的child是容器且没有指定约束，则子容器会尽可能的大去填满父组件',
              ),
              ContainerInContainerDemo(),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
