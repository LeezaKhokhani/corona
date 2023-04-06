import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals/globals.dart';
import '../helpers/api_helper.dart';
import '../moduls/country_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String val = "India";
  int indexOfCountry = 73;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff302E3B),
      body: FutureBuilder(
        future: CountryAPIHelper.userAPIHelper.fetchingUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error :- ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<CountryData>? data = snapshot.data as List<CountryData>?;

            return Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 400, autoPlay: true, viewportFraction: 1),
                  items: [1, 2, 3, 4].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/images (1).jpg"))),
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            color: CupertinoColors.darkBackgroundGray
                                .withOpacity(0.6),
                            child: Center(
                              child: Text(
                                "'' Together, We will Defeat\n COVID-19. ''",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xff1e1e2a),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.menu,
                        color: Color(0xff797993),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff302E3B),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 60,
                                width: 350,
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: const Color(0xff484858),
                                    )),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    borderRadius: BorderRadius.circular(10),
                                    isExpanded: true,
                                    value: val,
                                    items: countryAll
                                        .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(),
                                      ),
                                    ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        val = value.toString();
                                        List.generate(countryAll.length,
                                                (index) {
                                              if (countryAll[index] == val) {
                                                return indexOfCountry = index;
                                              }
                                            });
                                      });
                                    },
                                    dropdownColor: const Color(0xff797993),
                                    style:TextStyle(
                                        color: Colors.white),
                                    iconEnabledColor: Colors.green,
                                    icon: const Icon(Icons.pin_drop_outlined),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Case Update",
                              style: (
                                   const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            ),
                            Text(
                              "Newest updates of ${DateTime.now().day} || ${DateTime.now().month} || ${DateTime.now().year}\n population || ${data![indexOfCountry].population.toString()}",
                              style:(const TextStyle(
                                      color: Color(0xff797993))),
                            ),
                            SizedBox(
                              height: 150,
                              width: 350,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: const Color(0xff484858),
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Radio(
                                            activeColor: Colors.orange,
                                            value: "1",
                                            groupValue: "1",
                                            onChanged: (val) {}),
                                        Text(
                                          data[indexOfCountry]
                                              .infected
                                              .toString(),
                                          style: (const TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 40)),
                                        ),
                                        Text("Infected",
                                            style: (
                                                 const TextStyle(
                                                    color: Color(0xff797993))))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: const Color(0xff484858),
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Radio(
                                            activeColor: Colors.red,
                                            value: "1",
                                            groupValue: "1",
                                            onChanged: (val) {}),
                                        Text(
                                          data[indexOfCountry].death.toString(),
                                          style: (
                                              const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 40)),
                                        ),
                                        Text("Deaths",
                                            style: (
                                                 const TextStyle(
                                                    color: Color(0xff797993))))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: const Color(0xff484858),
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Radio(
                                            activeColor: Colors.green,
                                            value: "1",
                                            groupValue: "1",
                                            onChanged: (val) {}),
                                        Text(
                                          data[indexOfCountry]
                                              .recovered
                                              .toString(),
                                          style:(
                                               const TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 40)),
                                        ),
                                        Text("Recoved",
                                            style: (
                                                 const TextStyle(
                                                    color: Color(0xff797993))))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                )
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xff1e1e2a),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  color: const Color(0xff797993),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(
                    "Home",
                    style:(
                         const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  )
                ],
              ),
            ),
            const Icon(
              Icons.search,
              color: Colors.white,
              size: 25,
            ),
            const Icon(
              Icons.menu,
              color: Colors.white,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}