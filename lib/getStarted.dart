import 'package:flutter/material.dart';
import 'package:ui_payment/bottomMenu.dart';
import 'package:ui_payment/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui_payment/payment.dart';

// ignore: camel_case_types
class getStarted extends StatefulWidget {
  const getStarted({Key? key}) : super(key: key);

  @override
  _getStartedState createState() => _getStartedState();
}

// ignore: camel_case_types
class _getStartedState extends State<getStarted> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  final List<String> imgList = [
    'assets/Cards_start.png',
    'assets/Cards_start.png',
    'assets/Cards_start.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: CarouselSlider(
                      items: imgList
                          .map((item) => Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 150,
                                                color: colorprimary,
                                              )
                                            ]),
                                        child: Image.asset(item),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Manage Your Payment",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.023),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Manage your finances by recording all your transactions",
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.018),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                          .toList(),
                      carouselController: _carouselController,
                      options: CarouselOptions(
                          // autoPlay: true,
                          // enlargeCenterPage: true,
                          disableCenter: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            _carouselController.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : colorprimary)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80, top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const bottomMenu()),
                        );
                      },
                      child: Text("Get Started",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        primary: colorprimary,
                        minimumSize: Size(200, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
