import 'package:flutter/material.dart';
import 'package:fluxestore/models/user_data_model.dart';

import 'package:fluxestore/presentation/reuseables/account_page_utils_row.dart';

import '../../../utils/icons_constants/primary_icons_icons.dart';
import '../../../utils/icons_constants/secondary_icons_icons.dart';

class AccountPage extends StatelessWidget {
  final UserModel? userData;
  const AccountPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
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
                        // SizedBox(
                        //   height: 45,
                        // ),
                        Text(
                          userData!.userName ?? "Susane Pham",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          userData!.email ?? "sunieux@gmail.com",
                          style: const TextStyle(
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
          const SizedBox(
            height: 20,
          ),
          Container(
            width: screenWidth * 0.85,
            height: screenHeight * 0.60,
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
            child: Column(
              children: [
                AccountPageUtilsRow(
                  onTap: () => Navigator.of(context).pushNamed("MyOrders"),
                  icon: SecondaryIcons.bag,
                  text: "My Orders",
                  size: 21,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Color(0xffF3F3F6),
                    )),
                const AccountPageUtilsRow(
                  icon: SecondaryIcons.wallet,
                  text: "Payment method",
                  size: 20,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Color(0xffF3F3F6),
                    )),
                const AccountPageUtilsRow(
                  icon: SecondaryIcons.ticket,
                  text: "Voucher",
                  size: 19,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Color(0xffF3F3F6),
                    )),
                AccountPageUtilsRow(
                  onTap: () => Navigator.of(context).pushNamed("WishListPage"),
                  icon: PrimaryIcons.heart,
                  text: "My Wishlist",
                  size: 23,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Color(0xffF3F3F6),
                    )),
                const AccountPageUtilsRow(
                  icon: Icons.star,
                  text: "Rate this app",
                  size: 23,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Color(0xffF3F3F6),
                    )),
                const AccountPageUtilsRow(
                  icon: SecondaryIcons.logout,
                  text: "Log out",
                  size: 21,
                ),
                const Padding(
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
