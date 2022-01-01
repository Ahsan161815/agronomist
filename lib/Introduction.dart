import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:introduction_screen/introduction_screen.dart';


class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IntroductionScreen(
        showDoneButton: true,
        showSkipButton: true,
        next: const Text('Next'),
        skip: const Text('Skip'),
        done: const Text('Done'),
        onDone: (){
          Navigator.popAndPushNamed(context, '/home');
          },
        onSkip: (){
          Navigator.popAndPushNamed(context, '/home');
        },

        pages: [
          PageViewModel(
            title: 'Welcome to Agronomist',
            // image: Image.asset("assets/images/plants1.jpg", height: 250,),
            body: "The world's rapidly rising population requires most countries"
                " to make the best possible use of their land resources for "
                "agriculture, horticulture, forestry and conservation. "
                "Being able to predict where and how well particular plants "
                "are likely to grow in different regions is vital for land "
                "use planning.",

          ),
          PageViewModel(
            title: 'Plant Recognition',
            image: Image.asset("assets/images/plants4.jpg", height: 250,),
            body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Nam sit amet justo congue, pulvinar eros ac, pretium enim.'
                ' Cras vel massa pulvinar' ,

          ),
          PageViewModel(
            image: Image.asset("assets/images/plants2.jpg", height: 250,),
            title: 'Plant Disease Detection',
            body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                ' Nam sit amet justo congue, pulvinar eros ac, pretium enim.'
                ' Cras vel massa pulvinar',

          ),
          PageViewModel(
            image: Image.asset("assets/images/plants1.jpg", height: 250,),
            title: 'Plant Growth Prediction',
            body: 'Lorem ipsum dolor sit amet, consectetur adipiscing '
                'elit. Nam sit amet justo congue, pulvinar eros ac, '
                'pretium enim. Cras vel massa pulvinar',

          )
        ],
      ),
    );
  }
}
