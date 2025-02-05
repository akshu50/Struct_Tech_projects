import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextButtonscreen extends StatefulWidget {
  const TextButtonscreen({super.key});

  @override
  State<TextButtonscreen> createState() => _TextButtonscreenState();
}

class _TextButtonscreenState extends State<TextButtonscreen> {
  TextEditingController textController = TextEditingController();
  String displayText = "";

  void addText() {
    if (textController.text.isNotEmpty) {
      setState(() {
        displayText = textController.text;
        textController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            "Text added Sucessfully",
            
          style: GoogleFonts.poppins(
            color: Colors.green,
           ),),
           backgroundColor: Colors.white,
           duration: const Duration(seconds: 2),),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Text Display",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(141, 112, 239, 0.82),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: const Color.fromARGB(255, 209, 192, 192),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Write Text",
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        addText();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 209, 192, 192),
              ),
              child: Center(
                child: Text(
                  displayText,
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
