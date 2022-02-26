import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/model/travel.dart';
class DetailPage extends StatelessWidget {
  final Travel travel;
  final double expandedHeight = 300 ;
  final double roundedContainerHeight = 50;

  DetailPage ({required this.travel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
        _buildSliverHead(),
              SliverToBoxAdapter(
                child:  _buildDetail(),
              )

            ],
          ),
          Padding(
            padding:  EdgeInsets.only(
             top: MediaQuery.of(context).padding.top,
              right: 15, left: 15
            ),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),

                  GestureDetector(
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildSliverHead (){
    return SliverPersistentHeader(delegate:DetailSliverDelegate(
      travel: travel,
        expandedHeight: expandedHeight,
        roundedContainerHeight: roundedContainerHeight
    )
    );
  }
  Widget _buildDetail(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text('Dear All Greetings on my second blog entry for my time in country number 100! I have just completed my application for the TCC to become a fully-fledged Centurian, in which you have to tick all the countries you’ve been to. ',

            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.5,
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Featured',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.5,

                ),
                ),
                // Spacer(),
                Text('View All',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 1.5,

                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 120,
              child: FeaturedWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text('This Is The Travel Blog App It  Make The Kawsar Ali',

              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildUserInfo(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(travel.url,
            width: 50,
              height: 50,
              fit: BoxFit.cover,

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(travel.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),
                ),
                Text(travel.location,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Icon(Icons.share,
          color: Colors.grey,

          ),
        ],
      ),
    );
  }
}
class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;

  DetailSliverDelegate({
    required this.travel,
    required this.expandedHeight,
    required this.roundedContainerHeight

});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return  Stack(
      children: [
        Opacity(opacity: 0.8,
        child: Image.asset(travel.url,

        width: MediaQuery.of(context).size.width,
        height: expandedHeight ,
          fit: BoxFit.cover,
        ),
        ),
        Positioned(
            top: expandedHeight-roundedContainerHeight-shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: roundedContainerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                )
              ),

        )),
        Positioned(
            top: expandedHeight-shrinkOffset-120,
            left: 30,

            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(travel.name, style: TextStyle(
              color: Colors.white,
                  fontSize: 30,
                ),),
                Text(travel.location,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                ),
                ),
              ],


            ) ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}

class FeaturedWidget extends StatelessWidget{
  final _list =Travel.generateMostPopular();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        var travel = _list[index];
          return Container(
            height: 100,
            width: 120,
            child: Image.asset(travel.url,
            fit: BoxFit.cover,
            ),

          );
        },
        separatorBuilder: (_, index)=>SizedBox(
      width: 10,
    ), itemCount: _list.length);

  }
  
}