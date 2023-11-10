import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
import 'package:fluxestore/presentation/Icons/secondary_icons_icons.dart';
import 'package:fluxestore/presentation/reuseables/account_page_utils_row.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset("assets/images/avatar.png"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 45,
                        // ),
                        Text(
                          "Susane Pham",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "sunieux@gmail.com",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Color(0xff130F26),
                  ))
            ],
          ),
          const SizedBox(height: 20,),
          
          Container(
            width: 327,
            height: 440,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  // BoxShadow(blurRadius: 0.5, offset: Offset(0, 1)),
                  // BoxShadow(
                  //     color: Colors.white,
                  //     blurRadius: 0.5,
                  //     offset: Offset(-5, 0)),
                  // BoxShadow(
                  //     color: Colors.white,
                  //     blurRadius: 0.5,
                  //     offset: Offset(5, 0)),
                ]),
            child: const Column(
              children: [
                AccountPageUtilsRow(
                  icon: SecondaryIcons.location,
                  text: "Address",
                  size: 21,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: Color(0xffF3F3F6),
                )),
                AccountPageUtilsRow(
                  icon: SecondaryIcons.wallet,
                  text: "Payment method",
                  size: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: Color(0xffF3F3F6),
                )
                ),
                AccountPageUtilsRow(
                  icon: SecondaryIcons.ticket,
                  text: "Voucher",
                  size: 19,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: Color(0xffF3F3F6),
                )),
                AccountPageUtilsRow(
                  icon: PrimaryIcons.heart,
                  text: "My Wishlist",
                  size: 23,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: Color(0xffF3F3F6),
                )),
                AccountPageUtilsRow(
                  icon: Icons.star,
                  text: "Rate this app",
                  size: 23,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: Color(0xffF3F3F6),
                )),
                AccountPageUtilsRow(
                  icon: SecondaryIcons.logout,
                  text: "Log out",
                  size: 21,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: Color(0xffF3F3F6),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
