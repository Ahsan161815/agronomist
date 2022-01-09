import 'package:agronomist/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'components/AppContainer.dart';
import 'package:agronomist/components/AppText.dart';


class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void function1 (){
    print('My function');
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(
        //     Icons.home,
        // ),
        elevation: 0,
        title: Text('Agronomist',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_sharp),
            tooltip: 'Chat with us',
            onPressed: () {
              Navigator.pushNamed(context, '/chat');
            },
          ), //IconButton
          IconButton(
            icon: const Icon(Icons.featured_play_list_rounded),
            tooltip: 'Crops list',
            onPressed: () {
              Navigator.pushNamed(context, '/cropslist');
            },
          ), //IconButton
        ],
        shadowColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.grey,
              ],
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: AppContainer(
                      title: 'Identify',
                      tag: 'tagline',
                      icon: Icons.search,
                      function: () => {
                        Navigator.pushNamed(context, '/recognition')
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: AppContainer(
                      title: 'Disease',
                      tag: 'tagline',
                      icon: Icons.search,
                      function: () => {
                        Navigator.pushNamed(context, '/disease')
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AppContainer(
                      title: 'Yeild Prediction',
                      tag: 'tagline',
                      icon: Icons.search,
                      function: () => {
                        Navigator.pushNamed(context, '/growth')
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        iconSize: 30,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        elevation: 5,
        backgroundColor: pcolor,
      ),
    );
  }
}