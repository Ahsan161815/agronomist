import 'package:agronomist/main.dart';
import 'package:agronomist/pages/constants.dart';
import 'package:agronomist/pages/consult/consult.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'schedule_card.dart';
import 'constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  // var _name;
  // var _description;
  // var _imageUrl;
  //
  // DetailScreen(this._name, this._description, this._imageUrl);
  
  
  Future<void> launch_email(String email)async {
    // const String email = 'Ahsan.161815@gmail.com';
    String url = 'mailto:$email';
    
    if(await canLaunch(url)){
      await launch(url);
    }
  }

  Future<void> launch_phone(String phone)async {
    // const String email = 'Ahsan.161815@gmail.com';
    String url = 'tel://$phone';

    if(await canLaunch(url)){
      await launch(url);
    }
  }

  Future<void> launch_whatsapp(String number) async{
    String url = 'whatsapp://send?phone=$number';

    if (await canLaunch(url)){
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments as Consultant;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/consult_bg.jpg'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        height: 18,
                        color: pcolor,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/3dots.svg',
                      height: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: pColor,
                            radius: 50,
                            child: CircleAvatar(
                              backgroundImage : AssetImage(
                                args.image,
                              ),
                              radius: 48,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                args.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kTitleTextColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                args.tag,
                                style: TextStyle(
                                  color: kTitleTextColor.withOpacity(0.7),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: kBlueColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: (){
                                        launch_phone(args.phone);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/phone.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      launch_email(args.email);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: kYellowColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/icons/chat.svg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: kOrangeColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: (){
                                        launch_whatsapp(args.phone);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/video.svg',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'About Consultant',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        args.description,
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   'Upcoming Schedules',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 18,
                      //     color: kTitleTextColor,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // ScheduleCard(
                      //   'Consultation',
                      //   'Sunday . 9am - 11am',
                      //   '12',
                      //   'Jan',
                      //   kBlueColor,
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // ScheduleCard(
                      //   'Consultation',
                      //   'Sunday . 9am - 11am',
                      //   '13',
                      //   'Jan',
                      //   kYellowColor,
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // ScheduleCard(
                      //   'Consultation',
                      //   'Sunday . 9am - 11am',
                      //   '14',
                      //   'Jan',
                      //   kOrangeColor,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

