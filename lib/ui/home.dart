import 'package:cowin/theme/theme.dart';
import 'package:cowin/ui/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Cowin',
          style: TextStyle(color: Colors.white),
        ),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text('GET')),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Govt of India",
                      style: ApplicationTheme.subTitle,
                    ),
                    Text(
                      "(Vaccine Resources)",
                      style: ApplicationTheme.content,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  gridButton(
                      context, 'assets/icons/vaccines.svg', 'Find Vaccine', ''),
                  gridButton(context, 'assets/icons/analytics.svg',
                      'Book Vaccine', 'https://selfregistration.cowin.gov.in/'),
                  gridButton(context, 'assets/icons/question_answer.svg',
                      'Vaccine FAQs', 'https://www.cowin.gov.in/faq')
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Public Resources",
                      style: ApplicationTheme.subTitle,
                    ),
                    Text(
                      "(Other covid resources)",
                      style: ApplicationTheme.content,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      gridButton(context, 'assets/icons/coronavirus.svg',
                          'Covid stats', 'https://www.covid19india.org/'),
                      gridButton(context, 'assets/icons/help_outline.svg',
                          'Covid help', 'https://www.covidresourcesindia.com/'),
                      gridButton(context, 'assets/icons/question_answer.svg',
                          'Vaccine FAQs', 'https://www.cowin.gov.in/faq')
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      gridButton(context, 'assets/icons/vaccines.svg',
                          'Find Vaccine', ''),
                      gridButton(
                          context,
                          'assets/icons/analytics.svg',
                          'Book Vaccine',
                          'https://selfregistration.cowin.gov.in/'),
                      gridButton(context, 'assets/icons/question_answer.svg',
                          'Vaccine FAQs', 'https://www.cowin.gov.in/faq')
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget gridButton(
    BuildContext context, String asset, String title, String url) {
  return Column(
    children: [
      Container(
        height: 90,
        width: 90,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Webview(url),
              ),
            );
          },
          child: SvgPicture.asset(
            asset,
            color: Colors.purple,
            height: 32,
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
      Text(title),
    ],
  );
}
