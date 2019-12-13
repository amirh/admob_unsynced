import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AdMob Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        MaterialButton(
          child: Text('Open a page with an ad'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => AdPage(),
            ));
          },
        ),
      ),
    );
  }
}

class AdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: _itemBuilder),
    );
  }

  Widget _itemBuilder(BuildContext context, index) {
    if (index != 4) {
      return ListTile(title: Text('Item $index'));
    }
    return AdWidget();
  }
}

class AdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: PlatformViewSurface(
        controller: AdViewController.instance,
        hitTestBehavior: PlatformViewHitTestBehavior.transparent,
        gestureRecognizers: {},
      ),
    );
  }
}

class AdViewController extends PlatformViewController {
  AdViewController() : super();

  static final instance = AdViewController();

  @override
  void clearFocus() {
  }

  @override
  void dispatchPointerEvent(PointerEvent event) {
  }

  @override
  void dispose() {
  }

  @override
  int get viewId => 1;

}
