import 'package:flutter/material.dart';

class ProductDetailsExpansionPanel extends StatefulWidget {
  final Widget body;
  final String headingText;
  final bool isExpanded;
  final Function(int, bool)? expansionCallback;
  const ProductDetailsExpansionPanel(
      {super.key,
      required this.expansionCallback,
      required this.isExpanded,
      required this.body, required this.headingText});

  @override
  State<ProductDetailsExpansionPanel> createState() =>
      _ProductDetailsExpansionPanelState();
}

class _ProductDetailsExpansionPanelState
    extends State<ProductDetailsExpansionPanel> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expandIconColor: const Color(0xff33302E),
      expansionCallback: widget.expansionCallback,
      children: [
        ExpansionPanel(
          backgroundColor: Colors.white,
          isExpanded: widget.isExpanded,
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return  ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                widget.headingText,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            );
          },
          body: widget.body
        ),
      ],
    );
  }
}
