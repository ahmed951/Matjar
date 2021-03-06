import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'firebase/userDatabase.dart';
import 'matjar_icons.dart';
import 'modules/user.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userinit>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text(
                  "Matjar",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "DancingScript",
                  ),
                ),
                backgroundColor: mainColor,
                toolbarHeight: 80,
                centerTitle: true,
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 30,
                currentIndex: currentIndex,
                backgroundColor: Colors.white,
                selectedFontSize: 13,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.home,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.categories,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.cart,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Matjar.sign_in_and_sign_up_logo,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    label: "",
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                    if (currentIndex == 3) {
                      Navigator.of(context).pushNamed('/Profile');
                    }
                  });
                },
              ),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 33, vertical: 25),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Matjar.sign_in_and_sign_up_logo,
                          size: 28,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 15),
                        child: Text(
                          'First Name',
                          style: TextStyle(
                              fontSize: 17, fontFamily: 'Source Sans Pro'),
                        ),
                      ),
                    ]),
                    Container(
                      child: Text(userData.firstName.capitalize()),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: Offset(0, 3),
                              color: Colors.grey.withOpacity(0.16)),
                        ],
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10),
                        child: Text(
                          'Last Name',
                          style: TextStyle(
                              fontSize: 17, fontFamily: 'Source Sans Pro'),
                        ),
                      ),
                    ]),
                    Container(
                      child: Text(userData.lastName.capitalize()),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: Offset(0, 3),
                              color: Colors.grey.withOpacity(0.16)),
                        ],
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 17, fontFamily: 'Source Sans Pro'),
                        ),
                      ),
                    ]),
                    Container(
                      child: Text(userData.email),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: Offset(0, 3),
                              color: Colors.grey.withOpacity(0.16)),
                        ],
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10),
                        child: Text(
                          'Address',
                          style: TextStyle(
                              fontSize: 17, fontFamily: 'Source Sans Pro'),
                        ),
                      ),
                    ]),
                    Container(
                      child: Text(userData.address.capitalize()),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: Offset(0, 3),
                              color: Colors.grey.withOpacity(0.16)),
                        ],
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10),
                        child: Text(
                          'Contact',
                          style: TextStyle(
                              fontSize: 17, fontFamily: 'Source Sans Pro'),
                        ),
                      ),
                    ]),
                    Container(
                      child: Text(userData.contact.capitalize()),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: Offset(0, 3),
                              color: Colors.grey.withOpacity(0.16)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/ProfileEdit');
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Source Sans Pro',
                              color: Colors.white,
                            ),
                          ),
                          color: Color.fromRGBO(244, 52, 52, 1),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Source Sans Pro',
                              color: Colors.white,
                            ),
                          ),
                          color: Color.fromRGBO(244, 52, 52, 1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: mainColor,
                ),
              ),
            );
          }
        });
  }
}
