import 'package:flutter/material.dart';
import 'package:agronomist/pages/constants.dart';

class DoctorCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

   const DoctorCard({
    Key? key,
    this.title = 'This is Title of Doctor Card',
    this.subtitle = 'This is Subtitle of Doctor Card',
    this.icon = Icons.account_circle,
  }) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(icon, size: 50,),
        title: Text(
          title,
          style: const TextStyle(letterSpacing: 2),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(letterSpacing: 2),
        ),
      ),
    );
  }
}

class Consult extends StatelessWidget {
  const Consult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pColor,
        title: Text(
          'Consult From Top Talent',
          style: TextStyle(
            fontFamily: 'poppins',
            letterSpacing: 1,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            DoctorCard(
              title: 'Saeed Khan',
              subtitle: 'Sukkur IBA Student | AI Specialist',
            ),
            DoctorCard(
              title: 'Ahsanullah Abdullah',
              subtitle: 'Self Learner | App Developer',
            ),
            DoctorCard(
              title: 'Muhammad Ahsan',
              subtitle: 'Sukkur IBA Student | Web Developer',
            ),
            DoctorCard(
              title: 'Saeed Khan',
              subtitle: 'Sukkur IBA Student | AI Specialist',
            ),
            DoctorCard(
              title: 'Ahsanullah Abdullah',
              subtitle: 'Self Learner | App Developer',
            ),
            DoctorCard(
              title: 'Muhammad Ahsan',
              subtitle: 'Sukkur IBA Student | Web Developer',
            ),
            DoctorCard(
              title: 'Saeed Khan',
              subtitle: 'Sukkur IBA Student | AI Specialist',
            ),
            DoctorCard(
              title: 'Ahsanullah Abdullah',
              subtitle: 'Self Learner | App Developer',
            ),
            DoctorCard(
              title: 'Muhammad Ahsan',
              subtitle: 'Sukkur IBA Student | Web Developer',
            ),
            DoctorCard(
              title: 'Saeed Khan',
              subtitle: 'Sukkur IBA Student | AI Specialist',
            ),
            DoctorCard(
              title: 'Ahsanullah Abdullah',
              subtitle: 'Self Learner | App Developer',
            ),
            DoctorCard(
              title: 'Muhammad Ahsan',
              subtitle: 'Sukkur IBA Student | Web Developer',
            ),
            DoctorCard(
              title: 'Saeed Khan',
              subtitle: 'Sukkur IBA Student | AI Specialist',
            ),
            DoctorCard(
              title: 'Ahsanullah Abdullah',
              subtitle: 'Self Learner | App Developer',
            ),
            DoctorCard(
              title: 'Muhammad Ahsan',
              subtitle: 'Sukkur IBA Student | Web Developer',
            ),
          ],
        ),
      ),
    );
  }
}

