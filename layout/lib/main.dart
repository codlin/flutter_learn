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
                '容器行为：',
              ),
              //
              Text(
                '1. 容器无child、宽、高和约束（注：可以有alignment），但父组件提供了unbounded约束(即最大宽或高是无限)，则容器大小为尽可能小，因此在屏幕不显示',
              ),
              NoConstraintsContainerDemo(),

              //
              Text(
                '2. 容器无child和alignment，但指定了宽、高或者约束，则它会在这些约束和父约束之间尝试尽量小 ??? ->实际验证不是这样',
              ),
              ContainerCombinationConstraintsDemo(),

              //
              Text(
                '3. 容器无child，长、高、约束和alignment，但父组件提供了bounded约束，则容器会尽可能的大去填满父组件',
              ),
              ContainerInContainerDemo(),

              //
              Text(
                '4. 容器（黄色）指定了alignment，并且父组件提供了unbounded约束，则它会尝试包围子组件，使自己的大小为子组件的大小',
              ),
              ContainerWithAlignmentAndChildDemo(),

              //
              Text(
                '5. 容器(青色)指定了alignment，并且父组件提供了bounded约束，则它会尝试扩展来适应父组件，然后按照指定的alignment使子组件对齐',
              ),
              ContainerWithAlignmentAndChildAndParentBoundedConstraintsDemo(),

              //
              Text(
                '6. 容器（黄色）有child，但没有指定长高、alignment和约束，则容器会将其父组件的约束传递给child（child组件受此约束），并且使自己的大小等于子组件的大小',
              ),
              ContainerPassConstraintsFromParentToChildDemo(),

              //
              Text(
                '其它一些例子：',
              ),
              Text(
                'A. 一个长高分别为100的容器，容器对齐方式为topRight',
              ),
              TopLeftContainerDemo(),
              //
              Text(
                '容器（黄色）仅指定了高度，其父组件的宽度是unbounded约束，因此它的宽度尽可能大',
              ),
              NormalContainerDemo(),

              //
              Text(
                'B. 容器仅指定了高度且有Child，没有指定alignment，则容器的宽度由child的宽度决定',
              ),
              ContainerWithChildDemo(),

              //
              ContainerWithHeightAlignmentAndChildDemo(),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
