import 'package:agronomist/components/AppSmallText.dart';
import 'package:agronomist/main.dart';
import 'package:agronomist/pages/consult/consult.dart';
// import 'package:agronomist/pages/custom_camera/custom_camera.dart';
// import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'components/AppContainer.dart';
import 'package:agronomist/components/AppText.dart';
import 'package:agronomist/pages/shopnow_category/category.dart';
import 'package:agronomist/pages/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:agronomist/pages/nointernet/no_internet.dart';


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
    return Scaffold(
      body: status ? screens[_selectedIndex] : NoInternet(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(50),
        ),
        child: BottomNavigationBar(
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
              icon: Icon(Icons.group, color: Colors.white,),
              label: '',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Consult us',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedLabelStyle: TextStyle(
            letterSpacing: 0,
            color: pColor.withOpacity(0.2)
          ),
          unselectedLabelStyle: TextStyle(
              letterSpacing: 0,
              color: pColor.withOpacity(0.2),
          ),
          selectedItemColor: pcolor,
          iconSize: 26,
          unselectedItemColor: pcolor.withOpacity(0.5),
          onTap: _onItemTapped,
          elevation: 0,
          // fixedColor: Colors.white,
          backgroundColor: Colors.white,
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          // WidgetsFlutterBinding.ensureInitialized();
          // // Obtain a list of the available cameras on the device.
          // final cameras = await availableCameras();
          // runApp(MyApp(cameras: cameras));
        },
        backgroundColor: Colors.transparent,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.purple,
          radius: 32,
          child: CircleAvatar(
            backgroundColor: pColor,
              radius: 22,
              child: Icon(
                Icons.camera, size: 30, color: Colors.white,)),
        ),
        // clipBehavior: Clip.hardEdge,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
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