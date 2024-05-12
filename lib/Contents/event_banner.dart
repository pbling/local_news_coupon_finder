import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';

import '../Datas/models.dart';


class EventBanner extends StatefulWidget {

  final List<Event> eventList;
  EventBanner({Key?key, required this.eventList}) : super(key:key);

  @override
  _EventBannerState createState() => _EventBannerState();
}


class _EventBannerState extends State<EventBanner> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 360.w,
      height: 150,
      child: Swiper(
        itemBuilder: (context, index) {
          final image = widget.eventList[index].eventBannerImage;
          return Image.asset(
            image,
            fit: BoxFit.fill,
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        itemCount: widget.eventList.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}