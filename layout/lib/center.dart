import 'package:flutter/material.dart';

class CenterWidgetWithConstrainedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan,
        height: 100,
        width: 100,
        margin: EdgeInsets.all(5),
        child: Center(
          child: Container(
            height: 50,
            width: 50,
            color: Colors.yellow,
          ),
        ));
  }
}

class CenterWidgetWithoutConstrainedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan,
        width: 100,
        margin: EdgeInsets.all(5),
        child: Center(
          child: Container(
            height: 50,
            width: 50,
            color: Colors.yellow,
          ),
        ));
  }
}

class CenterWidgetWithOneFactorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan,
        margin: EdgeInsets.all(5),
        child: Center(
          widthFactor: 2,
          heightFactor: 1.5,
          child: Container(
            height: 50,
            width: 50,
            color: Colors.yellow,
          ),
        ));
  }
}

class CenterWidgetDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center组件演示'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //
            Text('1. 如果Center的维度受到约束的且factor都为null，则它会尽可能大。'
                '下面例子中外围是一个容器作Center组件的父组件用来进行维度约束。'
                'Center的孩子是显示为黄色的组件，它被放在了父组件的正中央。'),
            CenterWidgetWithConstrainedDemo(),

            //
            Text('2. 如果Center的尺寸是不受约束的且factor都为null，则它会在那个维度上匹配子组件的大小。'
                '下面例子中外围是一个容器，宽度为100，高度没有约束，其孩子为Center组件。'
                'Center的孩子是显示为黄色的组件（宽高均为50），则可以看到Center匹配了子组件的高度。'),
            CenterWidgetWithoutConstrainedDemo(),

            //
            Text(
                '3. 如果Center的某个factor不为null，则Center组件在那个维度上的大小为这个因子和孩子组件在那个维度上大小的乘积。'
                '下面例子中外围是一个无约束的容器，其孩子为Center组件，其宽度因子为2，高度因子为1.5。'
                'Center的孩子是显示为黄色的组件（宽高均为50），则可以看到Center的大小为宽100，高75。'),
            CenterWidgetWithOneFactorDemo(),
          ],
        ),
      ),
    );
  }
}
