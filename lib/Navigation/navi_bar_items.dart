import 'package:flutter/material.dart';

bool _showBadge = true;

List<BottomNavigationBarItem> naviBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: '홈',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.location_on_rounded),
    label: '내주변',
  ),
  BottomNavigationBarItem(
    icon: _showBadge ? Badge(
      label: Text('New'),
      child : Icon(Icons.message_rounded),
    ) : Icon(Icons.message_rounded),
    label : '동네소식',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.import_contacts_rounded),
    label: '이야기',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.star),
    label: 'MY',
  ),
];