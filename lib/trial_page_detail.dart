import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrialPageDetail extends StatefulWidget {
  final String title;
  final String detail;

  const TrialPageDetail({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  @override
  State<TrialPageDetail> createState() => _TrialPageDetailState();
}

class _TrialPageDetailState extends State<TrialPageDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Trial HTTP Page",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.detail,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
