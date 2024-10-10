import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../uitles/colors.dart';

class CustomSearchField extends StatelessWidget {
  CustomSearchField({
    super.key,
    required this.searchController,
    required this.onChanged,
    required this.onCancelSearch,
  });
  final Function(String value) onChanged;
  final TextEditingController searchController;
  final void Function() onCancelSearch;

  @override
  Widget build(BuildContext context) {
    // final value = Provider.of<PlayerController>(context, listen: false);
    return Container(
      margin: EdgeInsets.all(10),
      height: 45,
      decoration: BoxDecoration(
          color: LigthColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: LigthColor.massegeColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
            )
          ]),
      child: Row(
        children: [
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.x,
                size: 15,
                color: LigthColor.iconlist,
              ),
              onPressed: () {
                onCancelSearch();
                searchController.clear();
                // _searchAndFilter('');
              }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                    color: LigthColor.maingreencolor, fontFamily: "Rubik"),
                textInputAction: TextInputAction.search,
                controller: searchController,
                textAlign: TextAlign.right,
                textAlignVertical: TextAlignVertical.center,
                onChanged: onChanged,
                // value.searchAndFilter,
                // _searchAndFilter,
                decoration: InputDecoration(
                    hintText: ' ...البحث عن ',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 12, fontFamily: "Rubik")),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: LigthColor.bieagcolor,
            ),
          ),
        ],
      ),
    );
  }
}


class CustomSearchFieldApi extends StatelessWidget {
  CustomSearchFieldApi({
    super.key,
    required this.searchController,
    required this.onChanged,
    required this.onCancelSearch,
  });
  final Function(String value) onChanged;
  final TextEditingController searchController;
  final void Function() onCancelSearch;

  @override
  Widget build(BuildContext context) {
    // final value = Provider.of<PlayerController>(context, listen: false);
    return Container(
      margin: EdgeInsets.all(10),
      height: 45,
      decoration: BoxDecoration(
          color: LigthColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: LigthColor.massegeColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
            )
          ]),
      child: Row(
        children: [
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.x,
                size: 15,
                color: LigthColor.iconlist,
              ),
              onPressed: () {
                onCancelSearch();
                searchController.clear();
                // _searchAndFilter('');
              }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                    color: LigthColor.maingreencolor, fontFamily: "Rubik"),
                textInputAction: TextInputAction.search,
                controller: searchController,
                textAlign: TextAlign.right,
                textAlignVertical: TextAlignVertical.center,
                onChanged: onChanged,
                // value.searchAndFilter,
                // _searchAndFilter,
                decoration: InputDecoration(
                    hintText: ' ...البحث عن ',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 12, fontFamily: "Rubik")),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: LigthColor.bieagcolor,
            ),
          ),
        ],
      ),
    );
  }
}
