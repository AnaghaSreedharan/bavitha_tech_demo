import 'package:bavitha_tech_assignment/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../utils/colors.dart';
class ChapterTabView extends StatelessWidget {
  const ChapterTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 10), // Adjust top padding
      child: ListView.builder(
        itemCount: 10, // Number of items in the list
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getBoldText('Chapter 1',fontSize: 16),
                      const ReadMoreText(
                        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        trimLength: 110,
                        colorClickableText: primaryColor,
                        trimMode: TrimMode.Length,
                        trimCollapsedText: 'See more',
                        trimExpandedText: 'See less',
                        moreStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Row(
                        children: [
                          getRegulaText('Played',fontSize: 12,textColor: Colors.grey.shade500),
                          Icon(Icons.check_circle_rounded,color: primaryColor,size: 12,)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Icon(Icons.play_arrow,color: blueColor,size: 30,))

                
              ],
            ),
          );
        },
      ),
    );
  }
}
