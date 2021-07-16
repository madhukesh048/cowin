import 'package:fluwin/core/models/session_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SessionsView extends StatelessWidget {
  final List<Sessions> sessions;
  final String centerName;
  const SessionsView(this.sessions, this.centerName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          centerName,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        centerTitle: true,
      ),
      body: sessionsList(),
    );
  }

  Widget sessionsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 2,
            borderOnForeground: true,
            child: ListTile(
              title: Text(sessions.elementAt(i).date!),
              subtitle: Text(sessions.elementAt(i).vaccine! +
                  ' - Min Age: ' +
                  sessions.elementAt(i).minAgeLimit.toString()),
              trailing: Text(
                "Slots: " + sessions.elementAt(i).availableCapacity.toString(),
                style: TextStyle(
                  color: sessions.elementAt(i).availableCapacity! > 0
                      ? Colors.green
                      : Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
