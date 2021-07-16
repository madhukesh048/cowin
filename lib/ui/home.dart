import 'package:fluwin/theme/theme.dart';
import 'package:fluwin/ui/vaccine_finder.dart';
import 'package:fluwin/ui/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Fluwin',
          style: TextStyle(color: Colors.white),
        ),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "Vaccine Resources",
                      style: ApplicationTheme.subTitle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  gridButton(
                      context, 'assets/icons/vaccines.svg', 'Find Vaccine', '',
                      isVF: true),
                  gridButton(context, 'assets/icons/analytics.svg',
                      'Book Vaccine', 'https://selfregistration.cowin.gov.in/'),
                  gridButton(context, 'assets/icons/question_answer.svg',
                      'Vaccine FAQs', 'https://www.cowin.gov.in/faq')
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Other Covid Resources",
                      style: ApplicationTheme.subTitle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  gridButton(context, 'assets/icons/coronavirus.svg',
                      'Covid stats', 'https://www.covid19india.org/'),
                  gridButton(context, 'assets/icons/help_outline.svg',
                      'Covid help', 'https://www.covidresourcesindia.com/'),
                  gridButton(context, 'assets/icons/question_answer.svg',
                      'Twitter Help', 'https://covid19-twitter.in/')
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Govt Helplines",
                      style: ApplicationTheme.subTitle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  gridButton(context, 'assets/icons/medical_services.svg',
                      'Medical', '',
                      isHL: true, phone: '1075'),
                  gridButton(
                      context, 'assets/icons/child_care.svg', 'Child', '',
                      isHL: true, phone: '1098'),
                  gridButton(context, 'assets/icons/elderly.svg', 'Elders', '',
                      isHL: true, phone: '14567')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget gridButton(BuildContext context, String asset, String title, String url,
    {bool isVF = false, bool isHL = false, String phone = ''}) {
  return Column(
    children: [
      Container(
        height: 100,
        width: 100,
        child: ElevatedButton(
          onPressed: () {
            if (isVF) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VaccineFinderView(),
                ),
              );
            } else if (isHL) {
              launch("tel:$phone");
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Webview(url),
                ),
              );
            }
          },
          child: SvgPicture.asset(
            asset,
            color: Colors.purple,
            height: 40,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        title,
        style: TextStyle(fontSize: 15),
      ),
    ],
  );
}
