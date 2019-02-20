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
      height: 100,
      color: Colors.red,
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
      alignment: Alignment.center,
      constraints: BoxConstraints.lerp(BoxConstraints.tight(Size(100, 100)),
          BoxConstraints.tight(Size(200, 200)), 5),
      color: Colors.cyan,
      child: Card(
        child: Text('我很小'),
      ),
    );
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
      width: 100,
      height: 100,
      color: Colors.blue,
      padding: EdgeInsets.all(5),
      child: Container(
        color: Colors.pink,
        width: 150,
        height: 150,
        constraints: BoxConstraints.tight(Size(50, 50)),
      ),
    );
  }
}