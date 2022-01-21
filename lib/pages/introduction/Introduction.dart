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
            body: "دنیا کی تیزی سے بڑھتی ہوئی آبادی کو زیادہ تر ممالک کی ضرورت ہے"
            "اپنے زمینی وسائل کا بہترین استعمال کرنے کے لیے"
            "زراعت، باغبانی، جنگلات اور تحفظ۔"
          "پیش گوئی کرنے کے قابل ہونا کہ مخصوص پودے کہاں اور کتنے اچھے ہیں"
          "مختلف خطوں میں بڑھنے کا امکان زمین کے لیے ضروری ہے"
          "منصوبہ بندی کا استعمال کریں.",

          ),
          PageViewModel(
            title: 'پودوں کی شناخت',
            image: Image.asset("assets/images/intro/plants4.jpg", height: 250,),
            body: 'یہ فیچر صارفین کو متعدد کے بارے میں معلومات حاصل کرنے کی اجازت دے گا'
                'پودے کی پتی یا پھول کی تصویر کے ذریعے پودے، اور معلومات تک رسائی حاصل کر سکتے ہیں'
                'اس پودے کو کیسے اگایا جائے۔ '
            'یہ فیچر ہوم گارڈننگ اور ٹورازم کو متاثر کرے گا'
            'ہدایت کاری۔,',

          ),
          PageViewModel(
            image: Image.asset("assets/images/intro/plants2.jpg", height: 250,),
            title: 'بیماریوں کا پتہ لگانا',
            body: 'یہ فیچر صارف کو پودوں کی بیماری کی شناخت کرنے کی اجازت دے گا'
                ' متاثرہ پودے کے پتے یا پودے کے پھول کی تصویر کے ذریعے۔ '
            'یہ خصوصیت متاثر کرے گی'
            'گھر کی باغبانی.',

          ),
          PageViewModel(
            image: Image.asset("assets/images/intro/plants1.jpg", height: 250,),
            title: 'پیداوار کی پیشن گوئی',
            body: 'یہ فیچر صارف کو پیش گوئی کے بارے میں جاننے کی اجازت دے گا'
                ' فصل کی پیداوار اپنے ابتدائی مرحلے میں۔ '
            'یہ خصوصیت ہوگی'
            'زراعت کے شعبے پر اثر پڑتا ہے۔',

          )
        ],
      ),
    );
  }
}
