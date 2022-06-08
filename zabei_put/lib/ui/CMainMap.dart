import 'dart:ffi';
import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zabei_put/tools/CEpsg3395.dart';
import 'package:location/location.dart';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class CMainMap extends StatefulWidget {
  @override
  _CMainMapState createState() => _CMainMapState();
}

class _CMainMapState extends State<CMainMap> {
  final double _initFabHeight = 95;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 0;

  Location _location = Location();
  
  Marker _positionMarker = Marker(point: LatLng(0,0), builder: (context) { return Icon(Icons.man); });

  double _longitude = 0;
  double _latitude = 0;

  String _address = "";
  void getAdress() async
  {
    final client = RetryClient(http.Client());
    try
    {
      var url = Uri.parse('https://nominatim.openstreetmap.org/reverse?format=json&lat=${_latitude}&lon=${_longitude}&addressdetails=1');
      var response = await http.post(url);
      var JsonResponse = jsonDecode(response.body);
      _address = JsonResponse['address']['city'] + ", " +
                 JsonResponse['address']['road'] + ", " +
                 JsonResponse['address']['house_number'];
    }
    finally
    {
      client.close();
    }
  }

  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _location.getLocation().then((p) {
          _longitude = p.longitude as double;
          _latitude = p.latitude as double;
          _positionMarker = Marker(
            width: 35.0,
            height: 35.0,
            rotate: true,
            point: LatLng(p.latitude as double, p.longitude as double),
            builder: (ctx) => Container(
              child: CircleAvatar(
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 35,
                ),
              )
            ),
          );
          getAdress();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightClosed = 75;
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.75;
    return SafeArea(
      child: Material(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            SlidingUpPanel(
              maxHeight: _panelHeightOpen,
              minHeight: _panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: .5,
              body: _body(),
              panelBuilder: (sc) => _panel(sc),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0)),
              onPanelSlide: (double pos) => setState(() {
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;
              }),
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(18.0),
                        bottomLeft: Radius.circular(18.0)
                    ),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      SizedBox(
                        height:MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: FloatingActionButton(
                          elevation: 0,
                          child: Icon(
                            Icons.menu,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {},
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.030,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text('Ваш адрес:'),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.030,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text((_address.isEmpty) ? "Loading" : "${_address}")
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height:MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: FloatingActionButton(
                          elevation: 0,
                          child: Icon(
                            Icons.search,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {},
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

              ]
            ),
            Positioned(
              right: 20.0,
              bottom: _fabHeight,
              child: FloatingActionButton(
                child: Icon(
                  Icons.gps_fixed,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                },
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(const Radius.circular(12.0))),
                ),
              ],
            ),
            const SizedBox(
              height: 6.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Нижний Тагил",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 36.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Изображения",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    )
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: CachedNetworkImage(
                          imageUrl: "https://nashural.ru/assets/uploads/4WNNhKdTuAiI5AklKfnYE8Hvuaa67OBj.jpg",
                          height: 120.0,
                          width: (MediaQuery.of(context).size.width - 48) / 2 - 2,
                          fit: BoxFit.cover,
                        ),
                        onTap: null,
                      ),
                      GestureDetector(
                        child: CachedNetworkImage(
                          imageUrl: "https://geo-1.ru/wp-content/uploads/2018/10/0721.jpg",
                          width: (MediaQuery.of(context).size.width - 48) / 2 - 2,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'photo_view');
                        }
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Описание",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    )
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    """В 1696 году в районе горы Высокой, а в 1702 году по берегам реки Выи сыном боярским Михаилом Бибиковым была найдена медная руда. 1696 год считается началом истории города. В 1714 году о приисках было доложено тогдашнему владельцу Уральских заводов Акинфию Демидову, вскоре после этого по указу царя Петра I им были основаны Тагильский и Выйский железоделательные заводы и на Урале началось производство чугуна, железа и меди. Руду брали на Высокогорском, Лебяжинском и Ивановском железных рудниках. В 1737 году медная руда была обнаружена и по берегам реки Лебяжки.

8 (19) октября 1722 год считается датой основания Нижнего Тагила, когда на Выйском заводе была получена первая продукция — чугун. Основан династией Демидовых, которым до революции и принадлежали Тагильские заводы: «Верхне-Выйский» и «Тагильский». В это время мировую известность получает продукция тагильских железоделательных и медеплавильных заводов, известная под товарным знаком «Старый соболь». Легенда об использовании тагильской меди при создании статуи Свободы пока не находит документального подтверждения[13].

Также Нижний Тагил широко известен в России своим народным промыслом тагильской росписи жестяных подносов. В 1833 году в Нижнем Тагиле крепостными изобретателями отцом и сыном Черепановыми (Ефим Алексеевич и Мирон Ефимович) были построены первые в России паровозы. Согласно легенде в 1800 году крепостной слесарь Ефим Артамонов сделал первый в мире велосипед с педалями и рулевым управлением.

В 1807 году был образован Нижнетагильский горнозаводской округ. В него вошли заводы и рудники Демидовых[14]. В середине XIX века существенный вклад в развитие архитектуры Нижнего Тагила внесли архитекторы А. П. Чеботарёв, К. А. Луценко и А. З. Комаров[15][16].

В 1918 году в Нижнем Тагиле в ходе Гражданской войны прошли крупные бои. Они были очень ожесточёнными и продолжались с 9 сентября по 22 октября 1918 года. В них участвовали 10 тысяч солдат Красной Армии и шесть тысяч Белой Гвардии, на стороне которых выступали также и части чехословацкого легиона. Установлено, что всего в сражениях за Нижний Тагил погибло около 400 чехословацких легионеров. В ноябре 2009 года, в Нижнем Тагиле открылся памятник павшим там чехословацким легионерам. На памятнике 67 имён воинов, которые удалось установить[17].""",
                    softWrap: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ));
  }

  Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration:
          BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 8.0,
            )
          ]),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }

  Widget _body() {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(57.9194, 59.965),
            zoom: 13,
            maxZoom: 18,
            minZoom: 4,
            crs: const Epsg3395(),
          ),
          children: [
            TileLayerWidget(
              options: TileLayerOptions(
                urlTemplate: "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&scale=1&lang=ru_RU",
                subdomains: ['a', 'b', 'c'],
                maxZoom: 19,
                minZoom: 0
              ),
            ),
            MarkerLayerWidget(
              options: MarkerLayerOptions(
                markers: [
                  _positionMarker,
                  Marker(
                    rotate: true,
                    rotateAlignment: Alignment.bottomCenter,
                    point: LatLng(57.90700625662233,59.966960038409574),
                    builder: (ctx) => IconButton(
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      onPressed: () {  },
                      iconSize: 25,
                    ),
                    anchorPos: AnchorPos.align(AnchorAlign.top)
                  ),
                ]
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomLeft,
          height: MediaQuery.of(context).size.height - _initFabHeight,
          child: Container(
            color: Colors.transparent,
            child: Image(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.05,
              image: const AssetImage('assets/Images/yandex.png')
            ),
          ),
        ),
      ],
    );
  }
}