import 'package:flutter/material.dart';
import 'package:agronomist/pages/constants.dart';

class Consultant{

  final String name;
  final String tag;
  final String image;
  final String email;
  final String phone;
  final String website;

  const Consultant({
    this.name = 'Name',
    this.tag = 'Tagline',
    this.image = 'assets/images/doctor1.png',
    this.email = 'Test@gmail.com',
    this.phone = '0300-3758902',
    this.website = 'www.mywebsite.com',
  });
}

class DoctorCard extends StatelessWidget {
  // final String title;
  // final String subtitle;
  // final IconData icon;
  // final String profile;
  // final String ontap;
  final Consultant consultant;

  const DoctorCard({
    Key? key,
    this.consultant = const Consultant(),
     // this.title = 'This is Title of Doctor Card',
     // this.subtitle = 'This is Subtitle of Doctor Card',
     // this.icon = Icons.account_circle,
     // this.profile = 'assets/images/doctor1.png',
     // this.ontap = '/consultdetail',

  }) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context, '/consultdetail',
          arguments: consultant,
        );
      },
      child: ListTile(
        // leading: Icon(icon, size: 50,),
        leading: Image.asset(consultant.image),
        title: Text(
          consultant.name,
          style: const TextStyle(letterSpacing: 2),
        ),
        subtitle: Text(
          consultant.tag,
          style: const TextStyle(letterSpacing: 2),
        ),
      ),
    );
  }
}

class Consult extends StatelessWidget {
  Consult({Key? key}) : super(key: key);

  final List<Consultant> c_list = [
    Consultant(name: 'Saeed Khan', tag: 'Sukkur IBA Student | AI Specialist',),
    Consultant(name: 'Ahsanullah Abdullah', tag: 'Self Learner | App Developer'),
    Consultant(name: 'Muhammad Ahsan', tag: 'Sukkur IBA Student | Web Developer'),
    Consultant(name: 'Saeed Khan', tag: 'Sukkur IBA Student | AI Specialist',),
    Consultant(name: 'Ahsanullah Abdullah', tag: 'Self Learner | App Developer'),
    Consultant(name: 'Muhammad Ahsan', tag: 'Sukkur IBA Student | Web Developer'),
    Consultant(name: 'Saeed Khan', tag: 'Sukkur IBA Student | AI Specialist',),
    Consultant(name: 'Ahsanullah Abdullah', tag: 'Self Learner | App Developer'),
    Consultant(name: 'Muhammad Ahsan', tag: 'Sukkur IBA Student | Web Developer'),
    Consultant(name: 'Saeed Khan', tag: 'Sukkur IBA Student | AI Specialist',),
    Consultant(name: 'Ahsanullah Abdullah', tag: 'Self Learner | App Developer'),
    Consultant(name: 'Muhammad Ahsan', tag: 'Sukkur IBA Student | Web Developer'),
    Consultant(name: 'Saeed Khan', tag: 'Sukkur IBA Student | AI Specialist',),
    Consultant(name: 'Ahsanullah Abdullah', tag: 'Self Learner | App Developer'),
    Consultant(name: 'Muhammad Ahsan', tag: 'Sukkur IBA Student | Web Developer'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pColor,
        title: const Text(
          'Consult From Our Team',
          style: TextStyle(
            fontFamily: 'poppins',
            letterSpacing: 1,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: c_list.length,
          itemBuilder: (BuildContext context, int index) {
            return DoctorCard(
              consultant: c_list[index],
            );
          },
        ),
      ),
    );
  }
}

