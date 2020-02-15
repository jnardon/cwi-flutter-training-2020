import 'package:flutter/widgets.dart';

class DividerVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 1,
        color: Color.fromRGBO(227, 227, 227, 1.0),
      ),
    );
  }
}
