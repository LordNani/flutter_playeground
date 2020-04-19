import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Nishimuro Roman",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontFamily: 'Lato-Bold'),
          ),
          Text(
            "Flutter junior developer",
            style: TextStyle(
                fontSize: 35,
                fontFamily: 'AmaticSC',
                fontWeight: FontWeight.w800),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text("Contact @fuckwatermelons", style: TextStyle(fontSize: 16))
            ],
          ),
        ],
      ),
    );
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  @override
  void initState() {
    _updateQuote();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x93A8ACFF),
        body: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Text(
                    _currentQuote.quoteText,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        _currentQuote.image,
                      ),
                    )),
                  ),
                  Text(
                    _currentQuote.author,
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontFamily: "AmaticSc",fontWeight: FontWeight.w800),
                  )
                ],
              ),
              OutlineButton.icon(
                padding: EdgeInsets.all(10),
                highlightedBorderColor: Colors.lightGreenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: _updateQuote,
                icon: Icon(Icons.grade),
                label: Text(
                  "I NEED INSPIRATION",
                  style: TextStyle(fontSize: 25),
                ),
              ),


            ],
          ),
        ));
  }

  Quote _currentQuote = new Quote(
      author: "No Idea",
      quoteText: "Erm....",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/f/f8/Question_mark_alternate.svg");

  void _updateQuote() async {
    _currentQuote = await _showQuote();
    setState(() {});
    debugPrint(_currentQuote.toString());
  }

  Future<Quote> _showQuote() async {
    final response =
        await http.get('https://thesimpsonsquoteapi.glitch.me/quotes');
    if (response.statusCode == 200) {
      return Quote.fromJson(json.decode(response.body)[0]);
    } else {
      return Quote(
          author: "No Idea",
          quoteText: "Erm....",
          image:
              "https://upload.wikimedia.org/wikipedia/commons/f/f8/Question_mark_alternate.svg");
    }
  }
}

class Quote {
  final String author;
  final String quoteText;
  final String image;

  Quote({this.author, this.quoteText, this.image});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        author: json['character'],
        quoteText: json['quote'],
        image: json['image']);
  }

  @override
  String toString() {
    return 'Quote{author: $author, quoteText: $quoteText, image: $image}';
  }
}

