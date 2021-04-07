import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardStatusCard extends StatelessWidget {
  final String label;
  final List<String> statusData;

  const DashboardStatusCard({
    Key key,
    @required this.label,
    @required this.statusData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31.0, vertical: 31.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: GoogleFonts.montserrat(fontSize: 16.0)),
              RichText(
                text: TextSpan(
                  text: '',
                  children: <TextSpan>[
                    TextSpan(
                      text: statusData[0],
                      style: TextStyle(color: Color(0xFFFA8A8A)),
                    ),
                    TextSpan(
                      text: "/${statusData[1]}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                  style: GoogleFonts.montserrat(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
