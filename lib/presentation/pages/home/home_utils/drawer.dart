import 'package:flutter/material.dart';
import 'package:fluxestore/models/user_data_model.dart';
import 'package:sliding_switch/sliding_switch.dart';

import '../../../../utils/icons_constants/primary_icons_icons.dart';

class HomeDrawer extends StatefulWidget {
  final UserModel? data;
  const HomeDrawer({super.key, required this.data});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

bool switchOn = false;

class _HomeDrawerState extends State<HomeDrawer> {
  Color buttonColor =
      switchOn ? const Color(0xff23262F) : const Color(0xffFCFCFC);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 200),
            child: SizedBox(
              width: 189,
              height: 52,
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset("assets/images/avatar.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      Text(
                        widget.data!.userName ??"Susane Pham",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                       Text(
                        widget.data!.email ?? "sunieux@gmail.com",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).popAndPushNamed("settings");
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(PrimaryIcons.setting_line),
                title: Text(
                  "Settings",
                  style: TextStyle(
                      color: Color.fromARGB(255, 92, 98, 111),
                      fontWeight: FontWeight.w700),
                ),
                // tileColor: Colors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(PrimaryIcons.help),
              title: Text(
                "Support",
                style: TextStyle(
                    color: Color.fromARGB(255, 92, 98, 111),
                    fontWeight: FontWeight.w700),
              ),
              // tileColor: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.announcement_rounded),
              title: Text("About Us",
                  style: TextStyle(
                      color: Color.fromARGB(255, 92, 98, 111),
                      fontWeight: FontWeight.w700)),
              // tileColor: Colors.black,
            ),
          ),
          // FlutterToggleTab(
          //   width: 50,
          //   borderRadius: 15,
          //   selectedTextStyle: const TextStyle(
          //       color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          //   unSelectedTextStyle: const TextStyle(
          //       color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w400),
          //    labels: [],
          // )
          const SizedBox(
            height: 275,
          ),
          SlidingSwitch(
              value: switchOn,
              width: 227,
              onChanged: (bool value) {
                setState(() {
                  value == switchOn;
                });
              },
              height: 40,
              animationDuration: const Duration(milliseconds: 300),
              onTap: () {},
              onDoubleTap: () {},
              onSwipe: () {},
              textOff: "Light mode",
              textOn: "Dark mode",
              iconOff: Icons.light_mode,
              iconOn: Icons.dark_mode_outlined,
              contentSize: 17,
              colorOn: switchOn
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color(0xff2C2F32),
              colorOff: const Color.fromARGB(255, 70, 70, 70),
              background: const Color(0xffe4e5eb),
              buttonColor:
                  switchOn ? const Color(0xff23262F) : const Color(0xffFCFCFC),
              // const Color(0xfff7f5f7),
              inactiveColor: const Color(0xffFCFCFC)),
        ],
      ),
    );
  }
}


// Row(
//               children: [
//                 Expanded(
//                   child: Center(
//                       child: Text(
//                     widget.textOff,
//                     style: TextStyle(
//                         color:
//                             turnState ? widget.inactiveColor : widget.colorOff,
//                         fontSize: widget.contentSize,
//                         fontWeight: FontWeight.w600),
//                   )),
//                 ),
//                 Expanded(
//                   child: Center(
//                       child: Text(
//                     widget.textOn,
//                     style: TextStyle(
//                         color:
//                             turnState ? widget.colorOn : widget.inactiveColor,
//                         fontSize: widget.contentSize,
//                         fontWeight: FontWeight.w600),
//                   )),
//                 )
//               ],
//             )