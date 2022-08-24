import 'package:api_learning/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrialPage extends StatefulWidget {
  const TrialPage({Key? key}) : super(key: key);

  @override
  State<TrialPage> createState() => _TrialPageState();
}

class _TrialPageState extends State<TrialPage> {
  TodoModel? todo;
  String output = "No data";
  List title = [];
  List detail = [];
  List isDone = [];

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
          TodoModel.getTodos().then((value) {
            output = "";
            for (var i = 0; i < value.length; i++) {
              title.add(value[i].title);
              detail.add(value[i].detail);
              isDone.add(value[i].isDone);

              setState(() {});
            }
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
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   output,
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isDone[index],
                              onChanged: (value) {
                                setState(() {
                                  isDone[index] = value;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const DetailTodoPage(),
                                  //   ),
                                  // );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title[index],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      detail[index],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/edit");
                              },
                              child: const Icon(Icons.edit),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.delete),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.grey,
                      )
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buttonGet(),
          ],
        ),
      ),
    ));
  }
}