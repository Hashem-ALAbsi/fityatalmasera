import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api/api_url.dart';
import '../data/allsongapi_controller.dart';
import '../models/apisong_model.dart';
import '../uitles/colors.dart';
import '../widgets/customlistviewallsong.dart';
import '../widgets/customsearchfield.dart';
import '../widgets/flutter_toast.dart';

class AllSongs extends StatefulWidget {
  const AllSongs({super.key});

  @override
  State<AllSongs> createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {
  // late List<SongApi> allsong = [];
  late List<SongApi>? _filteredallsong = [];
  final TextEditingController _searchController = TextEditingController();
  BaseUrl _baseUrl = new BaseUrl();
  bool didDispose = false;

  void initState() {
    super.initState();
    _fetchdataallsong();
  }

  Future<void> _fetchdataallsong() async {
    _filteredallsong = await AllSongs_Api.fetchdataallsong();
    if (!_filteredallsong.isNull) {
      setState(() {
        didDispose = true;
      });
    }
  }

  void _searchAndFilter(String query) {
    if (query.isEmpty) {
      // If the search query is empty, show all hotels
      setState(() {
        _filteredallsong = AllSongs_Api.allsong;
      });
    } else {
      // If the search query is not empty, filter the list of hotels
      setState(() {
        _filteredallsong = AllSongs_Api.allsong.where((allsongs) {
          return allsongs.name!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  void _onCancelSearch() {
    setState(() {
      _searchController.clear();
      AllSongs_Api.allsong = AllSongs_Api.allsong;
    });
    _searchController.clear();
    _searchAndFilter('');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final appBarHeight = AppBar().preferredSize.height;
    return Container(
      height: screenSize.height -
          appBarHeight -
          10.0, // Subtract the height of the AppBar and the TextField
      width: screenSize.width,
      child: SingleChildScrollView(
        child: didDispose == false
            ? Center(
                child: CircularProgressIndicator(
                color: LigthColor.maincolor,
                backgroundColor: LigthColor.whiteColor,
              ))
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        /////searchfield
                        CustomSearchFieldApi(
                          searchController: _searchController,
                          onChanged: _searchAndFilter,
                          // value.isFavoritesMode
                          //     ? value.searchAndFilterfavoretsong
                          //     : value.searchAndFiltersong,
                          onCancelSearch: _onCancelSearch,
                        ),
                        /////list view
                        ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _filteredallsong!.length,
                          // value.isFavoritesMode
                          //     ? value.filterfavoretsong.length
                          //     : value.filteredsong.length,
                          itemBuilder: ((context, index) =>
                              CustomListViewAllSong(
                                index: index,
                                songall: _filteredallsong,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 160,
                  ),
                  // NavBarScreen(),
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    didDispose = false;
  }
}
