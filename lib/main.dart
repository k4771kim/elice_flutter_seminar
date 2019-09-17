import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ELICE")),
        body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(
              100,
              (index) => CatImage(index),
            )));
  }
}

class CatImage extends StatelessWidget {
  CatImage(this.index);

  num index;

  String getAssetsSrc(index) {
    return "assets/${index % 2 == 0 ? 'mozzi' : 'yulmu'}.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTapCatImage(context, getAssetsSrc(index), index),
        child: Padding(
            padding: EdgeInsets.all(3),
            child: Hero(
                tag: "${getAssetsSrc(index)}_${index}",
                child: Image.asset(getAssetsSrc(index), fit: BoxFit.cover))));
  }

  onTapCatImage(context, src, index) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CatDetailImagePage(src, index)));
  }
}

class CatDetailImagePage extends StatelessWidget {
  CatDetailImagePage(this.src, this.index);
  String src;
  num index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("CAT", style: TextStyle(color: Colors.red))),
        body: Center(
            child: Hero(
                tag: "${src}_${index}",
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      src,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )))));
  }
}