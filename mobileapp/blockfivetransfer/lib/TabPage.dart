
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'help.dart';


class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DefaultTabController(
            length: 2,
            child: Scaffold(

                appBar: AppBar(
                  bottom:  TabBar(
                    tabs: [
                      new Tab(icon: new Image.asset('asset/images/icone2.png', width: 35, height: 35,)   ),

                    new Tab(icon: new Image.asset('asset/images/icone1.png',width: 28, height: 28)   ),
                    ],
                  ),
                  title: const Text('3P NFT'),
                ),
                body: const TabBarView(
                  children: [
                    MyHomePage(),
                    Icon(Icons.directions_transit),
                  ],
                )))
    );
  }
}








class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<DataModel> listData =  [];


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      Helper.pickNuploadImg();
    });
  }

  @override
  void initState() {
    super.initState();

    Helper.getData(false).then((value){listData = value;
     setState(() {

     }); });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 59, 56, 56),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),

          child:

        GridView.builder(
        itemCount:listData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).orientation ==
        Orientation.landscape ? 3: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,

    ),
    itemBuilder: (context,index,) {
    return ItemCard(data: listData[index]);
    }
        ),

    )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}





class NFTPage extends StatefulWidget {
  const NFTPage({Key? key}) : super(key: key);

  @override
  _NFTPageState createState() => _NFTPageState();
}

class _NFTPageState extends State<NFTPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




class ItemCard extends StatefulWidget {

  DataModel data;
  ItemCard({Key? key, required this.data}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Helper.imageFromBase64String(widget.data.img),

          Divider(height: 10,),
          
          Text( Helper.IpfsHash + ":" + widget.data.IpfsHash, overflow: TextOverflow.clip, textAlign: TextAlign.center,)

        ],
      ),
    );
  }
}