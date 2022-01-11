import 'package:agronomist/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'components/AppContainer.dart';
import 'package:agronomist/components/AppText.dart';
import 'package:agronomist/pages/shopnow/ShopNow.dart';

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

  List<Widget> screens = [
    const HomeBody(),
    const ShopNow(),
    Container(color: Colors.blue, child: const Center(child: Text('Consult page')),),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_sharp),
              label: 'Shop Now',
              backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Consult us',
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

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(
        //     Icons.home,
        // ),
        elevation: 2,
        title: const Text('Agronomist',
          style: TextStyle(
            fontFamily: 'poppins',
            letterSpacing: 1,
            fontSize: 22,
          ),
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
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    AppText(
                      text: "Welcome Plant Lover!",
                      fontSize: 30.0,
                      lspacing: 1.3,
                    )
                  ],
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: AppContainer(
                      title: 'Identify',
                      tag: 'recognize plants',
                      icon: Icons.camera_alt_outlined,
                      function: () => {
                        Navigator.pushNamed(context, '/recognition')
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: AppContainer(
                      title: 'Disease',
                      tag: 'recognize disease',
                      icon: Icons.medical_services_outlined,
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
                      title: 'Plant Yeild',
                      tag: 'predict plants yeild',
                      icon: Icons.grass_outlined,
                      function: () => {
                        Navigator.pushNamed(context, '/growth')
                      },
                    ),
                  ),
                  Expanded(
                    child: AppContainer(
                      title: 'Extra',
                      tag: 'extra container',
                      icon: Icons.grass_outlined,
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
    );
  }
}