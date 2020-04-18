import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scaffold",
          style: TextStyle(color: Color.fromRGBO(30, 31, 32, 1)),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 186, 0, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.adjust),
            onPressed: () => debugPrint("Pressed appbar icon"),
          ),
          IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () => debugPrint("alarm pressed"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.lightGreen,
        child: Icon(
          Icons.add_to_queue,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts, color: Colors.blueAccent),
              title: Text("Contact Us")),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail, color: Colors.blueAccent),
              title: Text("Mail")),
        ],
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) =>
            debugPrint("you tapped on ${index + 1} navbar item"),
      ),
      backgroundColor: Color.fromRGBO(253, 253, 251, 1),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[CustomButton()],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text(
            "Hello again!",
          ),
          backgroundColor: Colors.blueAccent,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "BUTTON",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber,
      child: Center(
          child: Text(
        "Hello Flutter!",
        textDirection: TextDirection.ltr,
        textScaleFactor: 2,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 22.1,
          fontStyle: FontStyle.italic,
        ),
      )),
    );

//    return Center(
//      child: Text("Hello Flutter!", textDirection: TextDirection.ltr, textScaleFactor: 2,),
//
//    );
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard!"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[_getCard(), _getAvatar()],
        ),
      ),
    );
  }

  Container _getAvatar() {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.redAccent, width: 1.5),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/200/200"),
              fit: BoxFit.cover),
        ));
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(45),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Nishimuro Roman",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'AmaticSC'),
          ),
          Text(
            "Flutter junior developer",
            style: TextStyle(fontSize: 23),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text("Contact me @fuckwatermelons")
            ],
          ),
        ],
      ),
    );
  }
}
