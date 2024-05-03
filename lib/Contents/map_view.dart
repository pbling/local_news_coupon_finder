import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'dart:async';

import '../Datas/models.dart';
import '../Pages/store_detail_page.dart';

class MapView extends StatefulWidget {
  final List<Store> storeList;
  final LocationPos cameraPosInfo;

  MapView({required this.storeList, required this.cameraPosInfo});

  @override
  _mapViewState createState() => _mapViewState();
}

class _mapViewState extends State<MapView> {

  late NCameraPosition _initCameraPosition;
  late NaverMapController _controller;

  @override
  void initState() {
    super.initState();
    getInitCameraPos();
  }

  void getInitCameraPos(){
    // user의 주소정보가 있냐 없냐?
    var cameraPosition = NCameraPosition(
      target: NLatLng(widget.cameraPosInfo.x, widget.cameraPosInfo.y),
      zoom: 12,
      bearing: 0,
      tilt: 0,
    );
    _initCameraPosition = cameraPosition;
  }

  NInfoWindow getInfoFromStore(Store selectedStore){
    var info = NInfoWindow.onMarker(
      id : selectedStore.storeId,
      text : selectedStore.storeId,
    );
    return info;
  }

  NMarker getMarkerFromStore(Store selectedStore){
    print('getMarkerFromStore');
    var marker = NMarker(
      id: selectedStore.storeId.toString(),
      // assuming store id is unique
      position: NLatLng(
          selectedStore.addressPos.latitude,
          selectedStore.addressPos.longitude),
      icon: NOverlayImage.fromAssetImage('assets/images/icon/place.png'),
    );
    return marker;
  }

  @override
  void didUpdateWidget(covariant MapView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if(widget.storeList != oldWidget.storeList){
      print('변경됨');
      updateMarkers(_controller);
    }
  }

  void updateMarkers(NaverMapController controller){
    print('update marker');

    if(controller != null) {
      print('controller is not null');

      controller.clearOverlays();

      for (var store in widget.storeList) {

        NMarker marker = getMarkerFromStore(store);
        controller.addOverlay(marker);

        NInfoWindow info = getInfoFromStore(store);
        marker.openInfoWindow(info);

        marker.setOnTapListener((overlay) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StoreDetailPage(selectedStore: store)),
          );
        });
      }
    } else {
      print('Error : controller is null');
    }
  }

  @override
  void dispose(){
    if(_controller != null){
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print(_initCameraPosition);
    print(widget.storeList);

    return Container(
      child : NaverMap(
        options : NaverMapViewOptions(
          initialCameraPosition: _initCameraPosition,
          minZoom: 3, // default is 0
          maxZoom: 15, // default is 21
          maxTilt: 0, // default is 63
        ),
        onMapReady: (NaverMapController controller) {
          _controller = controller;
          updateMarkers(_controller);
        },
      ),
    );
  }
}
