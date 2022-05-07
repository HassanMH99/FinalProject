import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  TextEditingController idcontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue.withOpacity(0.7),
            leading: Icon(Icons.menu),
            actions: [
              Icon(Icons.notifications),
              Icon(Icons.search),
              // Shohel Rana Shanto
            ],
            pinned: true,
            expandedHeight: 200,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Flutter Sliver'),
              centerTitle: true,
              background: Image(
                image: NetworkImage(
                    'https://pfps.gg/assets/banners/2547-illusion-gif.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                color: Colors.pink[100 * (index % 9 + 1)],
                child: ListTile(
                  title: Text('wew'),
                ),
              );
            },
            addAutomaticKeepAlives: false,
          )),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  color: Colors.green[100 * (index % 9 + 1)],
                  child: ListTile(
                    title: Text("shohel$index"),
                  ),
                );
              },
              childCount: 100,
            ),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          ),
        ],
      ),
    ));
  }
}
