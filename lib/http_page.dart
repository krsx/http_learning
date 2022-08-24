import 'package:api_learning/http_model.dart';
import 'package:api_learning/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HttpPage extends StatefulWidget {
  const HttpPage({Key? key}) : super(key: key);

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  HttpModel? postResult;
  User? userResult;
  String output = "no data";

  @override
  Widget build(BuildContext context) {
    Widget buttonGet() {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 10),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: () {
            User.connectToApi("2").then((value) {
              userResult = value;
              setState(() {});
            });
          },
          child: Text(
            "GET",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    Widget buttonGetAll() {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 10),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: () {
            User.getUsers("2").then((value) {
              output = "";
              for (var i = 0; i < value.length; i++) {
                output = "$output[${value[i].firstName} ${value[i].lastName}]";
                setState(() {});
              }
            });
          },
          child: Text(
            "GET ALL",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    Widget buttonPost() {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 10),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: () {
            HttpModel.connectToApi("Krisna", "Presiden").then((value) {
              postResult = value;
              setState(() {});
            });
          },
          child: Text(
            "POST",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "HTTP Page",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (userResult != null)
                    ? "Get:\n${userResult!.id} - ${userResult!.firstName} - ${userResult!.lastName} - ${userResult!.email}"
                    : "Tidak ada data",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Get All:",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Text(
                output,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                (postResult != null)
                    ? "Post:\n${postResult!.id} - ${postResult!.name} - ${postResult!.job} - ${postResult!.createdAt}"
                    : "Tidak ada data",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buttonGet(),
              const SizedBox(
                height: 10,
              ),
              buttonGetAll(),
              const SizedBox(
                height: 10,
              ),
              buttonPost(),
            ],
          ),
        ),
      ),
    ));
  }
}
