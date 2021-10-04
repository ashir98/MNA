import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mynewsapp/methods.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getNews("tech");
    getNewsFromSource("TechCrunch");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'MY NEWS APP',
              style: TextStyle(color: Colors.black),
            )),
        body: Container(
          color: Colors.grey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),




                  Container(
                      color: Colors.blue,
                      height: 6.h,
                      child: ListView.builder(
                        itemCount: navBarItems.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              height: 6.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.h, vertical: 1.h),
                              margin: EdgeInsets.symmetric(
                                horizontal: 0.2.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5.h),
                              ),
                              child: Center(
                                  child: Text(
                                navBarItems[index],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 2.2.h),
                              )),
                            ),
                          );
                        },
                      )),




                  

                  Loading
                      ? Container(
                          height: 10.h,
                          child: Center(child: CircularProgressIndicator()))
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 3.h),
                          child: CarouselSlider(
                            options:
                                CarouselOptions(height: 22.h, autoPlay: true),
                            items: newsListSlider.map((instance) {
                              return Builder(builder: (BuildContext context) {
                                return Container(
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Stack(children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(1.h),
                                              child: Image.network(
                                                instance.newsImage,
                                                fit: BoxFit.fitHeight,
                                                width: double.infinity,
                                              )),
                                          Positioned(
                                              left: 0,
                                              right: 0,
                                              bottom: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.h),
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Colors.black26
                                                              .withOpacity(0),
                                                          Colors.black
                                                        ],
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter)),
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5.h,
                                                            vertical: 1.h),
                                                    child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        child: Text(
                                                          instance.newsHeading,
                                                          style: TextStyle(
                                                              fontSize: 1.8.h,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ))),
                                              )),
                                        ])));
                              });
                            }).toList(),
                          ),
                  ),







                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Popular News',
                          style: TextStyle(
                              fontSize: 3.5.h, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),


                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 1.h, vertical: 2.h),
                    child: Loading
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: newsList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 1.h, vertical: 1.5.h),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.h)),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(1.h),
                                          child: Image.network(
                                              newsList[index].newsImage)),
                                      Positioned(
                                          left: 0,
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.h, 1.5.h, 1.h, 0.5.h),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.h),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Colors.black
                                                            .withOpacity(0),
                                                        Colors.black
                                                      ],
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    newsList[index].newsHeading,
                                                    style: TextStyle(
                                                        fontSize: 2.h,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                      newsList[index]
                                                                  .newsDescription
                                                                  .length >
                                                              50
                                                          ? "${newsList[index].newsDescription.substring(0, 55)}...."
                                                          : newsList[index]
                                                              .newsDescription,
                                                      style: TextStyle(
                                                          fontSize: 1.5.h,
                                                          color: Colors.white))
                                                ],
                                              )))
                                    ],
                                  ),
                                ),
                              );
                            }),
                  ),






                  Container(
                      width: 40.h,
                      height: 5.h,
                      margin:
                          EdgeInsets.symmetric(horizontal: 1.h, vertical: 2.h),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Text('Show More'),
                          ))),

                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  List<MyNewsQueryModel> newsListSlider = <MyNewsQueryModel>[];
  List<MyNewsQueryModel> newsList = <MyNewsQueryModel>[];
  List<String> navBarItems = [
    'Top Stories',
    'Headlines',
    'Popular News',
    'Sports News'
  ];
  bool Loading = true;

  getNews(String query) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=58b320cd09c3475d81841f3a55b56c51";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        MyNewsQueryModel newsQueryModel = MyNewsQueryModel();
        newsQueryModel = MyNewsQueryModel.fromMap(element);
        newsList.add(newsQueryModel);
        setState(() {
          Loading = false;
        });
      });
    });
  }

  getNewsFromSource(String source) async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=$source&apiKey=58b320cd09c3475d81841f3a55b56c51";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        MyNewsQueryModel newsQueryModel = MyNewsQueryModel();
        newsQueryModel = MyNewsQueryModel.fromMap(element);
        newsListSlider.add(newsQueryModel);
        setState(() {
          Loading = false;
        });
      });
    });
  }
}
