import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_food/views/signup_view.dart';

import '../main.dart';
import '../modules/page_view_data.dart';
import '../widgets/indicator.dart';

class PView extends StatefulWidget {
  const PView({super.key});

  @override
  State<StatefulWidget> createState() => _PViewState();
}

class _PViewState extends State<PView> {
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      _currentIndex = (_currentIndex + 1) % myData.length;
      _controller.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      routes: {
        '/a': (ctx) => const SignUpView(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Builder(builder: (ctx1) {
              return PageView(
                controller: _controller,
                onPageChanged: (val) {
                  setState(() {
                    _currentIndex = val;
                  });
                },
                children: myData
                    .map(
                      (item) => SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: [
                                Image.asset(
                                  item.imageUrl,
                                  //width: width ,
                                  //height: height * .7,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                       vertical: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        item.title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              52, 168, 83, 1),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              );
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                //width: width ,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.9,
                    ),
                    Indicator(_currentIndex),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpView();
                        }));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: width*0.5,
                        height: height*0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromRGBO(52, 168, 83, 1),
                        ),
                        child: Text(
                          "Next",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
