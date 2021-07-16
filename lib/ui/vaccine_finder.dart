import 'package:cowin/core/models/session_model.dart';
import 'package:cowin/core/services/api_service.dart';
import 'package:cowin/core/services/http_service.dart';
import 'package:cowin/theme/theme.dart';
import 'package:cowin/ui/sessions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class VaccineFinderView extends StatefulWidget {
  const VaccineFinderView({Key? key}) : super(key: key);

  @override
  _VaccineFinderViewState createState() => _VaccineFinderViewState();
}

class _VaccineFinderViewState extends State<VaccineFinderView> {
  HttpService _httpService = HttpService();
  late ApiService _apiService = ApiService(httpService: _httpService);
  List<Centers> centers = [];
  String responseMessage = '';
  @override
  void initState() {
    super.initState();
  }

  Future _getCenters(String pincode, String date) async {
    List<Centers> temp = await _apiService.getCenters(pincode, date);
    setState(() {
      centers = temp;
      if (temp.length == 0) {
        responseMessage = "No Centers Found";
      }
    });
    print(centers);
  }

  DateTime selectedDate = DateTime.now();
  TextEditingController date = TextEditingController();
  TextEditingController pin = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String pincode = '';

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2021, 8, 1),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date.text = DateFormat('dd-MM-yyyy').format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Vaccine Finder',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty || val.length < 6) {
                    return "Entered Pincode is wrong or empty";
                  }
                  return null;
                },
                controller: pin,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pincode',
                  hintText: 'Enter Pincode',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                validator: (val) {
                  if (date.text.isEmpty || date.text == null) {
                    return "Date not picked";
                  }
                  return null;
                },
                readOnly: true,
                autofocus: false,
                controller: date,
                onTap: () {
                  _selectDate(context);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date',
                  hintText: 'Pick Date',
                  suffixIcon: Icon(
                    Icons.calendar_today,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  _getCenters(pin.text, date.text);
                }
              },
              child: Text('Search'),
            ),
            Text(
              'Centers',
              style: ApplicationTheme.subTitle.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            centers.length != 0
                ? Expanded(child: centerList(context))
                : Text(responseMessage)
          ],
        ),
      ),
    );
  }

  Widget centerList(BuildContext context) {
    return ListView.builder(
      itemCount: centers.length,
      itemBuilder: (context, i) {
        return Card(
          elevation: 2,
          borderOnForeground: true,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SessionsView(
                    centers.elementAt(i).sessions!,
                    centers.elementAt(i).name!,
                  ),
                ),
              );
            },
            // contentPadding: EdgeInsets.symmetric(horizontal: 8),
            title: Text(centers.elementAt(i).name!),
            subtitle: Text(centers.elementAt(i).address! +
                ' - ' +
                centers.elementAt(i).blockName!),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.purple,
            ),
          ),
        );
      },
    );
  }
}
