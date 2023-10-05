import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles.dart';

class CustomDropdownOverlay extends StatefulWidget {
  const CustomDropdownOverlay({
    super.key,
  });

  @override
  _CustomDropdownOverlayState createState() => _CustomDropdownOverlayState();
}

class _CustomDropdownOverlayState extends State<CustomDropdownOverlay> {
  late OverlayEntry _overlayEntry;
  List<Map<String, String>> items = [
    {"icon": 'assets/images/icon-github.svg', "item": 'Github'},
    {"icon": 'assets/images/icon-frontend-mentor.svg', "item": 'Frontend Mentor'},
    {"icon": 'assets/images/icon-twitter.svg', "item": 'Twitter'},
    {"icon": 'assets/images/icon-linkedin.svg', "item": 'LinkedIn'},
    {"icon": 'assets/images/icon-youtube.svg', "item": 'YouTube'},
    {"icon": 'assets/images/icon-facebook.svg', "item": 'Facebook'},
    {"icon": 'assets/images/icon-twitch.svg', "item": 'Twitch'},
    {"icon": 'assets/images/icon-devto.svg', "item": 'Dev.to'},
    {"icon": 'assets/images/icon-codewars.svg', "item": 'Codewars'},
    {"icon": 'assets/images/icon-codepen.svg', "item": 'Codepen'},
    {"icon": 'assets/images/icon-freecodecamp.svg', "item": 'freeCodeCamp'},
    {"icon": 'assets/images/icon-gitlab.svg', "item": 'Gitlab'},
    {"icon": 'assets/images/icon-hashnode.svg', "item": 'Hashnocode'},
    {"icon": 'assets/images/icon-stack-overflow.svg', "item": 'Stack Overflow'},
  ];

  final LayerLink _layerLink = LayerLink();
  bool isDropdownOpened = false;
  late Map<String, String> selectedItem;

  @override
  void initState() {
    selectedItem = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Material(
          elevation: 12.0,
          shadowColor: isDropdownOpened ? lavanderLight : graphiteLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            width: 480.0,
            height: 48.0,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: isDropdownOpened ? lavander : graphiteLight),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(selectedItem["icon"]!),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${selectedItem["item"]}",
                        style: bodyM,
                      ),
                    ),
                  ],
                ),
                isDropdownOpened
                    ? Transform(
                        transform: Matrix4.identity()..scale(1.0, -1.0),
                        alignment: Alignment.center,
                        child: SvgPicture.asset('assets/images/icon-chevron-down.svg'),
                      )
                    : SvgPicture.asset('assets/images/icon-chevron-down.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggleDropdown() {
    if (isDropdownOpened) {
      _overlayEntry.remove();
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
    }
    setState(() {
      isDropdownOpened = !isDropdownOpened;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 8.0),
          child: Material(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            child: ListView.separated(
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      SvgPicture.asset(items[index]["icon"]!),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          items[index]["item"]!,
                          style: bodyM,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      selectedItem = {"icon": items[index]["icon"]!, "item": items[index]["item"]!};
                    });
                    _toggleDropdown();
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  indent: 12.0,
                  endIndent: 12.0,
                  height: 0.0,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
