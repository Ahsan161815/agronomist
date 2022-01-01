import 'package:flutter/material.dart';
import 'components/AppContainer.dart';


class Home extends StatelessWidget {

  void function1 (){
    print('My function');
  }

  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
            Icons.home
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppContainer(
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 100,
            ),
            function: () => {
              Navigator.pushNamed(context, '/recognition')
            },
          ),
          AppContainer(
            child: const Icon(
              Icons.local_florist,
              color: Colors.white,
              size: 100,
            ),
            function: () => {
              Navigator.pushNamed(context, '/disease')
            },
          ),
          AppContainer(
            child: const Icon(
              Icons.live_help,
              color: Colors.white,
              size: 100,
            ),
            function: () => {
              Navigator.pushNamed(context, '/growth')
            },
          ),
        ],
      )
    );
  }
}