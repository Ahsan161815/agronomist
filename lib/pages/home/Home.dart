import 'package:agronomist/main.dart';
import 'package:agronomist/pages/consult/consult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../pickimage/ImagePickerWidget.dart';
import 'components/AppContainer.dart';
import 'package:agronomist/pages/widgets/AppText.dart';
import 'package:agronomist/pages/shopnow_category/category.dart';
import 'package:agronomist/pages/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:agronomist/pages/nointernet/no_internet.dart';
import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';


class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var subscription;
  bool status = false;

  void function1 (){
    print('My function');
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if(index == 2){
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState(){
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if(result == ConnectivityResult.none){
        status = false;
      } else {
        status = true;
      }
      print(result);
      setState(() {
      });
    });
  }

  List<Widget> screens = [
    const HomeBody(),
    const Category(),
    Consult(),
    Consult(),
    Consult(),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: status ? screens[_selectedIndex] : NoInternet(),
        bottomNavigationBar: CurvedNavBar(
          actionButton: CurvedActionBar(
            onTab: (value) {
              /// perform action here

              // Navigator.pushNamed(context, '/ipick');
            },
            activeIcon: Container(
              padding: EdgeInsets.all(15),
              decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(
                Icons.camera_rounded,
                size: 35,
                color: pColor,
              ),
            ),
            inActiveIcon: Container(
              padding: EdgeInsets.all(15),
              decoration:
              BoxDecoration(color: pColor, shape: BoxShape.circle),
              child: Icon(
                Icons.camera_rounded,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
          appBarItems: [
            FABBottomAppBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: pColor,
                ),
                inActiveIcon: Icon(
                  Icons.home,
                  color: pcolor.withOpacity(0.3),
                ),
                text: 'Home'),
            FABBottomAppBarItem(
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: pColor,
                ),
                inActiveIcon: Icon(
                  Icons.shopping_cart,
                  color: pcolor.withOpacity(0.3),
                ),
                text: 'Shop'),
            FABBottomAppBarItem(
                activeIcon: Icon(
                  Icons.group,
                  color: pColor,
                ),
                inActiveIcon: Icon(
                  Icons.group,
                  color: pcolor.withOpacity(0.3),
                ),
                text: 'Consult'),
            FABBottomAppBarItem(
                activeIcon: Icon(
                  Icons.explore,
                  color: pColor,
                ),
                inActiveIcon: Icon(
                  Icons.explore,
                  color: pcolor.withOpacity(0.3),
                ),
                text: 'Explore'),
          ],
          bodyItems: [
            screens[0],
            screens[1],
            screens[2],
            screens[3],
          ],
          actionBarView: const ImagePickerWidget(),
        ),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          )
        ),
        elevation: 0,
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
          ),
          SizedBox(width: 5,),//IconButton
        ],
        shadowColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xfffdfbfb),
                Color(0xffebedee),
              ],
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    AppText(
                      text: "Welcome!",
                      fontSize: 30.0,
                      lspacing: 1,
                      color: kTitleTextColor,
                    ),
                    SizedBox(height: 10,),
                    // AppSmallText(
                    //   text: "The world's rapidly rising population requires most countries"
                    // " to make the best possible use of their land resources for "
                    //     "agriculture",
                    //   fontSize: 14.0,
                    //   color: Colors.black45,
                    //
                    // ),
                  ],
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  primary: false,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  // childAspectRatio: 1.1,
                  children: [
                    AppContainer(
                      containerColor: Colors.white.withOpacity(0.9),
                      title: 'Identify',
                      tag: 'recognize plants',
                      icon: Icons.camera_alt_outlined,
                      function: () => {
                        Navigator.pushNamed(context, '/recognition')
                      },
                    ),
                    AppContainer(
                      containerColor: Colors.white.withOpacity(0.9),
                      title: 'Disease',
                      tag: 'recognize disease',
                      icon: Icons.medical_services_outlined,
                      function: () => {
                        Navigator.pushNamed(context, '/disease')
                      },
                    ),
                    AppContainer(
                      containerColor: Colors.white.withOpacity(0.9),
                      title: 'Plant Yeild',
                      tag: 'predict plants yeild',
                      icon: Icons.grass_outlined,
                      function: () => {
                        Navigator.pushNamed(context, '/growth')
                      },
                    ),
                    AppContainer(
                      title: 'Extra',
                      tag: 'extra container',
                      bgColor: Colors.grey,
                      // containerColor: pcolor,
                      icon: Icons.grass_outlined,
                      containerColor: pcolor,
                      iconPlusText: Colors.white70,
                      titleColor: Colors.white,
                      // iconPlusText: Colors.white70,
                      // titleColor: Colors.white,
                      function: () => {
                        Navigator.pushNamed(context, '/growth')
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}