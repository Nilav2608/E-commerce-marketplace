import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatelessWidget {
  final Function(String)? scountry;
  final Function(String)? sstate;
  final Function(String)? scity;
  const CountryPicker(
      {super.key,
      required this.scountry,
      required this.sstate,
      required this.scity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: CSCPicker(
        layout: Layout.vertical,
        flagState: CountryFlag.DISABLE,
        // dropdownHeadingStyle: const TextStyle(color: Color(0xff777E90)),
        dropdownDecoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.8, color: Color(0xff000000)))),
        disabledDropdownDecoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.8, color: Color(0xff000000)))),
        onCountryChanged: (country) => scountry!(country),
        onCityChanged: (city) => scity!(city.toString()),
        onStateChanged: (state) => sstate!(state.toString())
      ),
    );
  }
}
