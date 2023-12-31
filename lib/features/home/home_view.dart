import 'dart:ui';

import 'package:bavitha_tech_assignment/features/home/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../utils/colors.dart';
import '../../utils/common_widgets.dart';
import 'chapter_tab_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: Obx(() => controller.isLoading.value?const Center(child: CircularProgressIndicator()): controller.homeData!=null?SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: Get.height * .6,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(controller.homeData?.titleRectangularThumbnail??''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 34),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          // Handle back button press
                        },
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border,
                                color: Colors.white),
                            onPressed: () {
                              // Handle like button press
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.share, color: Colors.white),
                            onPressed: () {
                              // Handle share button press
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_vert, color: Colors.white),
                            onPressed: () {
                              // Handle menu button press
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * .6,
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * .24,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(150.0),
                            ),
                          ),
                          child: Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(
                                top: 100, left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                getBoldText(controller.homeData?.title??'', fontSize: 25),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2,
                                        horizontal: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.thumb_up_alt,
                                            color: primaryColor,
                                            size: 14,
                                          ),
                                          const SizedBox(width: 2),
                                          getRegulaText('23', fontSize: 8,textColor: primaryColor),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    getRegulaText(controller.homeData?.authorName??'', fontSize: 12)
                                  ],
                                ),
                                 Flexible(
                                   child: ReadMoreText(
                                    controller.homeData?.aboutEnglish??'',
                                    trimLines: 2,
                                    colorClickableText: primaryColor,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'See more',
                                    trimExpandedText: 'See less',
                                    moreStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                ),
                                 ),
                                const SizedBox(
                                  height: 5,
                                ),
                                controller.homeData?.price == 0?
                                getRegulaText("${controller.homeData?.priceTag}",
                                    textColor: blueColor, fontSize: 16):getRegulaText("${controller.homeData?.price}",
                                    textColor: blueColor, fontSize: 16),
                                getRegulaText("0 credits available",
                                    fontSize: 12, textColor: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.width,
                  width: Get.height,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(5), // Border width
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox.fromSize(
                          // size: Size.fromRadius(48), // Image radius
                          child: CachedNetworkImage(
                            height: 150,
                            width: 150,
                            imageUrl: controller.homeData?.titleSquareThumbnail??'',
                            placeholder: (context, url) =>   Image.asset(
                              'assets/images/logo.jpeg',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) =>   Image.asset(
                              'assets/images/logo.jpeg',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor:
                                MaterialStateProperty.all<Color>(blueColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                            onPressed: () => null,
                            child: Text("Buy now".toUpperCase(),
                                style: const TextStyle(fontSize: 14))),
                        const SizedBox(width: 10),
                        ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                            onPressed: () => null,
                            child: getRegulaText(
                              "Preview".toUpperCase(),
                            )),
                        const SizedBox(width: 10),
                        SizedBox.fromSize(
                          size: const Size(40, 40), // button width and height
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Material(
                              color: Colors.white, // button color
                              child: InkWell(
                                splashColor: blueColor, // splash color
                                onTap: () {}, // button pressed
                                child: const Icon(
                                  Icons.card_giftcard_rounded,
                                  color: blueColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(padding: const EdgeInsets.all(10),
              child: TabBar(
                unselectedLabelColor: primaryColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: primaryColor,
                ),
                indicatorPadding: const EdgeInsets.all(0),
                dividerColor: Colors.transparent,
                indicatorWeight: 0,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab, // Use the 'tab' size
                labelStyle: const TextStyle(fontSize: 14),
                tabs:  const [
                  SizedBox(
                    height :30,
                    child: Tab(
                      text: 'Chapters',
                    ),
                  ),
                  SizedBox(
                    height :30,
                    child: Tab(
                      text: 'Reviews',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Tab(
                      text: 'Details',
                    ),
                  ),
                ],
                controller: controller.tabController,
              ),),
            SizedBox(
                height: Get.height*.75,
                child: TabBarView(
                  controller: controller.tabController,
                  children: const [
                    ChapterTabView(),
                    Center(
                      child: Text(
                        'Screen 2',
                      ),
                    ),
                    Center(
                      child: Text(
                        'Screen 3',
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ):Center(child: getRegulaText("Something went wrong...Please try again "),),),
    );
  }
}
