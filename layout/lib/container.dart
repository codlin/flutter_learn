import 'package:flutter/material.dart';

class NoConstraintsContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 返回一个没有约束的容器，因为父组件也没有约束，所以容器大小为尽可能小，在屏幕不显示
    /// If the widget has no child, no height, no width,
    /// no constraints, and the parent provides unbounded constraints,
    /// then Container tries to size as small as possible.
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
    );
  }
}

class NormalContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 返回一个常规容器
    /// 如果不指定约束且父组件也没有约束，则容器近可能小
    /// 当前容器指定了高度为100，宽度不指定，则容器默认为当前设备宽度
    return Container(
      constraints: BoxConstraints(),
      color: Colors.red,
      padding: EdgeInsets.all(5),
      child: Container(
        height: 100,
        color: Colors.yellow,
      ),
    );
  }
}

class TopLeftContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 返回一个长高分别为100的容器，容器对齐方式为topRight
    return Container(
      width: 100,
      height: 100,
      color: Colors.green,
      alignment: Alignment.topRight,
    );
  }
}

class ContainerWithChildDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 返回一个高别为100的容器
    /// 该容器有一个Child，则会看到容器的宽度由child的宽度约束决定
    return Container(
      height: 100,
      color: Colors.yellow,
      padding: EdgeInsets.all(0),
      child: Card(elevation: 0, child: Text('没有宽约束时会尽可能的去适应子组件的宽约束')),
    );
  }
}

class ContainerWithAlignmentAndChildDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 父组件无约束，容器指定了alignment， 则它会包围子组件的大小
    /// If the widget has an alignment, and the parent provides unbounded constraints,
    /// then the Container tries to size itself around the child.
    return Container(
      color: Colors.cyan,
      constraints: BoxConstraints(),
      child: Container(
        color: Colors.yellow,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(5),
        child: Card(child: Text('我是子组件，我很小')),
      ),
    );
  }
}

class ContainerWithAlignmentAndChildAndParentBoundedConstraintsDemo
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 父组件无约束，容器指定了alignment， 则它会包围子组件的大小
    /// If the widget has an alignment, and the parent provides unbounded constraints,
    /// then the Container tries to size itself around the child.
    return Container(
        color: Colors.yellow,
        constraints: BoxConstraints(
            minHeight: 50, maxHeight: 100, minWidth: 50, maxWidth: 100),
        padding: EdgeInsets.all(5),
        child: Container(
          alignment: Alignment.center,
          color: Colors.cyan,
          child: Card(
            child: Text('我也很小'),
          ),
        ));
  }
}

class ContainerPassConstraintsFromParentToChildDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Otherwise, the widget has a child but no height, no width, no constraints, and no alignment,
    /// and the Container passes the constraints from the parent to the child and sizes itself to match the child
    return Container(
        color: Colors.pink,
        width: 100,
        height: 100,
        padding: EdgeInsets.all(5),
        child: Container(
          color: Colors.yellow,
          child: Card(
            child: Text('我收到父约束的影响，填充为5面积尽量大'),
          ),
        ));
  }
}

class ContainerWithHeightAlignmentAndChildDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 返回一个高别为100的容器，容器对齐方式为topRight
    /// 该容器有一个Child，则会看到容器的宽度由child的宽度约束决定
    return Container(
      height: 100,
      color: Colors.pink,
      alignment: Alignment.topRight,
      child: Text('高度100，即使没有指定宽度，但如果指定了alignment，容器也会尽可能的占满全部宽度'),
    );
  }
}

class ContainerInContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 返回一个长高分别为100的容器
    /// 父容器指定了约束，它的child也是容器且该容器没有指定约束，则子容器会尽可能的大去填满父容器
    /// If the widget has no child, no height, no width, no constraints, and no alignment,
    /// but the parent provides bounded constraints, then Container
    /// expands to fit the constraints provided by the parent.
    return Container(
      width: 100,
      height: 100,
      color: Colors.orange,
      padding: EdgeInsets.all(5),
      child: Container(
        color: Colors.pink,
      ),
    );
  }
}

class ContainerCombinationConstraintsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// If the widget has no child and no alignment,
    /// but a height, width, or constraints are provided,
    /// then the Container tries to be as small as possible
    /// given the combination of those constraints and the parent's constraints.
    return Container(
      width: 200,
      height: 200,
      constraints: BoxConstraints.tightFor(width: double.infinity, height: 150),
      padding: EdgeInsets.all(5),
      color: Colors.blue,
      child: Container(
        color: Colors.yellow,
        width: 80,
        height: 80,
        constraints: BoxConstraints(
            minHeight: 50, maxHeight: 100, minWidth: 50, maxWidth: 100),
      ),
    );
  }
}

class ContainerDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('容器演示'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          child: Column(
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
        ));
  }
}
