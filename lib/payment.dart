import 'dart:convert';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_payment/constant.dart';
import 'package:ui_payment/models/transactionModels.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;
  @override
  void initState() {
    // TODO: implement initState
    getCardList();
    super.initState();
  }

  final List<String> cardList = [
    'Debit Card',
    'Credit Card',
  ];
  final List<Map<String, dynamic>> transaction = [
    {"name": "Driblle Pro", "time": "5 Hour Ago", "out": "\$720", "in": "null"},
    {"name": "eBay", "time": "18 Hour Ago", "out": "\$570", "in": "null"},
    {
      "name": "Project UI Design",
      "time": "06 July 2021",
      "in": "\$1.570",
      "out": "null"
    }
  ];

  Future<List> getCardList() async {
    List posts = [];
    var tr = await jsonEncode(transaction);
    return posts = jsonDecode(tr);
  }

  static List<TransactionModels> ParsedResponse(String responBody) {
    var jsonResponse = json.decode(responBody).cast<Map<String, dynamic>>();
    return jsonResponse
        .map<TransactionModels>((json) => TransactionModels.fromJson(json))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Good Morning",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    Stack(
                      children: [
                        Positioned(
                          // draw a red marble
                          bottom: 20,
                          left: 21,
                          child: Stack(
                            children: [
                              Icon(Icons.brightness_1,
                                  size: 12, color: Colors.redAccent),
                              Positioned(
                                // draw a red marble
                                bottom: 1,
                                right: 3,
                                child: Text(
                                  "5",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.008),
                                ),
                              )
                            ],
                          ),
                        ),
                        Image.asset("assets/Notification.png"),
                      ],
                    )
                  ],
                ),
                Text(
                  "Joshua Sudirman",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.02),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CarouselSlider(
                    items: cardList
                        .map(
                          (item) => Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.68,
                                height:
                                    MediaQuery.of(context).size.height * 0.19,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: (cardList.indexOf(item) == 0)
                                          ? [
                                              colorcard,
                                              colorfive,
                                              colorfour,
                                              colorthird
                                            ]
                                          : [Colors.orange, Colors.yellow],
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset("assets/sim.png"),
                                            Text(
                                              "1432 **** **** 999",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.02),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Card Balance",
                                        style: GoogleFonts.poppins(
                                            color: Color.fromARGB(
                                                255, 202, 200, 200),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.013),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$ 1492.00",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02),
                                          ),
                                          Image.asset("assets/visa.png")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
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
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const payment()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Image.asset("assets/Scan.png"),
                            ),
                            Text("Pay",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: colorprimary,
                          minimumSize: Size(150, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const payment()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/Send.png"),
                            Text("Transfer",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: colorprimary)),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 43, 40, 53),
                          minimumSize: Size(150, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Last Transaction",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See More",
                        style: GoogleFonts.poppins(
                            color: colorprimary,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: getCardList(),
                  builder:
                      (BuildContext context, AsyncSnapshot<List> snapshot) {
                    if (snapshot.hasData) {
                      // List<TransactionModels> data = snapshot.data;
                      // print(snapshot.data);
                      return Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              // print("name:${snapshot.data![index]["name"]}");
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.18,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.08,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 43, 40, 53),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    snapshot.data![index]
                                                            ["name"][0]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: GoogleFonts.poppins(
                                                        color: colorprimary,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.03),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data![index]["name"],
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  snapshot.data![index]["time"],
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.grey,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.015,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              (snapshot.data![index]["in"] !=
                                                      "null")
                                                  ? "In"
                                                  : "Out",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              (snapshot.data![index]["in"] !=
                                                      "null")
                                                  ? snapshot.data![index]["in"]
                                                  : snapshot.data![index]
                                                      ["out"],
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ); //Any widget you want to use.
                            },
                          ),
                        ),
                      );
                    } else {
                      return Container(
                          child: CircularProgressIndicator(
                        color: colorprimary,
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
