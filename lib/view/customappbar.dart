import 'package:flutter/material.dart';

class CustomBarWidget extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.2,
        child: Stack(
          children: <Widget>[


            Container(
              padding: const EdgeInsets.all(5),
              color: Color.fromRGBO(34,82,160, 1),
              // width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height*0.15,
              child: Center(
                child:  ListView(
                  children: [
                    ListTile(leading: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),

                    title: Row(children: [
                      CircleAvatar(
                        radius: 18,
                        child: ClipOval(
                          child: Image.network(
                              "https://image.freepik.com/free-vector/doctor-icon-avatar-white_136162-58.jpg"),
                        ),
                      ),
                      Text(
                      "Welcome Dr.Scilaris",
                      style: TextStyle(color: Colors.white, fontSize: 18.0,),textAlign: TextAlign.center,),]),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.segment,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),),



                ]),
              ),
            ),


            Positioned(
              top: 70.0,
              left: 25.0,
              right: 25.0,
              child:  Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                    color: Colors.grey.withOpacity(0.5), width: 1.0),
                   color: Colors.white),

                child: TextField(
                  //controller: editingController,
                  decoration: InputDecoration(
                    // labelText: "Search",
                      hintText: "Search Patients",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)))
                  ),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width*0.1,
              ),
            )
          ],
        ),

    );
  }
}