import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_travel_app_ui/constants/color_constant.dart';
import 'package:flutter_travel_app_ui/constants/style_constant.dart';
import 'package:flutter_travel_app_ui/models/carousel_model.dart';
import 'package:flutter_travel_app_ui/models/popular_destination_model.dart';
import 'package:flutter_travel_app_ui/models/travlog_model.dart';
import 'package:flutter_travel_app_ui/widgets/bottom_navigation_travelkuy.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //setting AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        title: SvgPicture.asset('assets/svg/travelkuy_logo.svg'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      bottomNavigationBar: BottomNavigationTravelkuy(),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [

              //Promos section
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: Text('Hi,Frankline 🖐 this promos for you',
                    style: mTitleStyle),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 190,
                      child: Swiper(
                        onIndexChanged: (index) {
                          setState(
                            () {
                              _currentIndex = index;
                            },
                          );
                        },
                        autoplay: true,
                        layout: SwiperLayout.DEFAULT,
                        itemCount: carousels.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(
                                  carousels[index].image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: map<Widget>(
                            carousels,
                            (index, images) {
                              return Container(
                                alignment: Alignment.centerLeft,
                                height: 6,
                                width: 6,
                                margin: EdgeInsets.only(right: 6),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentIndex == index
                                        ? mBlueColor
                                        : mGreyColor),
                              );
                            },
                          ),
                        ),
                        Text('More...'),
                      ],
                    ),
                  ],
                ),
              ),

              //service section
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 24),
                child: Text('Let\'s Booking', style: mTitleStyle),
              ),
              Container(
                height: 144,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            margin: EdgeInsets.only(right: 8),
                            height: 64,
                            decoration: BoxDecoration(
                                color: mFillColor,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: mBorderColor, width: 1)),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/service_flight_icon.svg',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Flight',
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        'Feel Freedom',
                                        style: mServiceSubtitleStyle,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            margin: EdgeInsets.only(right: 8),
                            height: 64,
                            decoration: BoxDecoration(
                                color: mFillColor,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: mBorderColor, width: 1)),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/service_train_icon.svg',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Trains',
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        'Intercity',
                                        style: mServiceSubtitleStyle,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            margin: EdgeInsets.only(right: 8),
                            height: 64,
                            decoration: BoxDecoration(
                                color: mFillColor,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: mBorderColor, width: 1)),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/service_hotel_icon.svg',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hotel',
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        'Let\'s take a brake',
                                        style: mServiceSubtitleStyle,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            margin: EdgeInsets.only(right: 8),
                            height: 64,
                            decoration: BoxDecoration(
                                color: mFillColor,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: mBorderColor, width: 1)),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/service_car_rental_icon.svg',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Car Rental',
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        'Around the city',
                                        style: mServiceSubtitleStyle,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Popular Destination section
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 24),
                child: Text('Popular Destination', style: mTitleStyle),
              ),
              Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  itemCount: populars.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        width: 120,
                        height: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                          child: Column(
                            children: [
                              Image.asset(
                                populars[index].image,
                                height: 74,
                              ),
                              Text(
                                populars[index].name,
                                style: mPopularDestinationTitleStyle,
                              ),
                              Text(
                                populars[index].country,
                                style: mPopularDestinationSubtitleStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              //Travlog section
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 24),
                child: Text('Travlog!', style: mTitleStyle),
              ),
              Container(
                height: 180,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 16),
                  itemCount: travlogs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 16),
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 104,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: AssetImage(travlogs[index].image),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: SvgPicture.asset(
                                    'assets/svg/travlog_top_corner.svg'),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: SvgPicture.asset(
                                    'assets/svg/travelkuy_logo_white.svg'),
                              ),
                              Positioned(
                                bottom: 0,
                                child: SvgPicture.asset(
                                    'assets/svg/travlog_bottom_gradient.svg'),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Text(
                                  'Travlog ' + travlogs[index].name,
                                  style: mTravlogTitleStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            travlogs[index].content,
                            style: mTravlogContentStyle,
                            maxLines: 3,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            travlogs[index].place,
                            style: mTravlogPlaceStyle,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
