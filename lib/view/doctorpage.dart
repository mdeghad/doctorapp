import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:healthapp/view/customappbar.dart';

class DoctorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DoctorPageState();
  }
}

class DoctorPageState extends State<DoctorPage> {
  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

// ignore: missing_return
  Future<String> getjsondata() async {
    String jsonData =
        await DefaultAssetBundle.of(context).loadString("assets/user.json");
    final jsonResult = json.decode(jsonData);

// print(jsonResult)
    allData = jsonResult;
    appointmentData = allData;
    setState(() {});
  }

  getSelectedDateAppointments() {
    appointmentData = allData.where((element) {
      print(element);
      Map<String, dynamic> appItem = element;
      return appItem['Date'] == _selectedValue.toString();
    }).toList();
    setState(() {});
  }

  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();
  final String url = "assets/user.json";
  List<dynamic> allData = [];
  List<dynamic> appointmentData = [];
  Map<String, dynamic> appointment;
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(children: [
        CustomBarWidget(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.10,
          child: ListView(
            children: [
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Color.fromRGBO(34, 82, 160, 1),
                selectedTextColor: Colors.white,
                onDateChange: (date) {

                  setState(() {
                    _selectedValue = date;
                    getSelectedDateAppointments();

                  });
                },
              ),
            ],
          ),
        ),
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height - 80.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
          Positioned(
              top: 20.0,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Color.fromRGBO(255, 255, 255, 1)),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(children: [
                    SizedBox(height: 10,),
                    Text(
                      "HEASC 54-DEAN (4)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height - 82.0,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent),
                          Positioned(
                              top: 75.0,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(45.0),
                                        topRight: Radius.circular(45.0),
                                      ),
                                      color: Colors.white),
                                  height: MediaQuery.of(context).size.height -
                                      100.0,
                                  width: MediaQuery.of(context).size.width)),
                             appointmentData != null &&
                              appointmentData.isNotEmpty
                              ? ListView.separated(
                                  separatorBuilder: (context, index) => Divider(
                                    color: Colors.black,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: appointmentData.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> item =
                                        appointmentData[index];
                                    return ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      leading: Icon(
                                        Icons.bookmark,
                                        color: Colors.green,
                                      ),
                                      title: Text(item["patientName"]),
                                      subtitle: Text(item["doctorName"] +
                                          "\n" +
                                          item["status"]),
                                      trailing: Column(
                                        children: [
                                          Text(item["time"]),
                                          //Text(item["Dictation"]),
                                    Spacer(),
                                    RichText(
                                    text: TextSpan(
                                    text: '• ',
                                    style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14),
                                    children: <TextSpan>[
                                    TextSpan(
                                    text: '' +
                                    "" +
                                    "" +
                                    item[
                                    "Dictation"],
                                    ),
                                        ],
                                      ),
                                    )
                                    ])
                                    );
                                  },
                                )
                              : Divider(
                                  color: Colors.white,
                                ),
                        ],
                      ),
                    ),
                  ])
              ))
        ]),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color.fromRGBO(34, 82, 160, 1),
      ),
    );
  }
}
