import 'package:fityatalmasera/screen/allsong_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/player_controller.dart';
import '../widgets/custombottomplayer.dart';
import '../widgets/customlistview.dart';
import '../widgets/customsearchfield.dart';

class SongmainScreen extends StatefulWidget {
  const SongmainScreen({super.key});

  @override
  State<SongmainScreen> createState() => _SongmainScreenState();
}

class _SongmainScreenState extends State<SongmainScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final appBarHeight = AppBar().preferredSize.height;
    return Consumer<PlayerController>(
      builder: (context, value, child) => Container(
        height: screenSize.height -
            appBarHeight -
            10.0, // Subtract the height of the AppBar and the TextField
        width: screenSize.width,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: value.isSoon
                  ? Center(
                      child: AllSongs(),
                      // Container(
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(8.0),
                      //     child: Image(
                      //         image: AssetImage('assets/images/Soon.png'),
                      //         height: screenSize.height - 170,
                      //         // height: 350,
                      //         // width: 320,
                      //         fit: BoxFit.fill),
                      //   ),
                      // ),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              /////searchfield
                              CustomSearchField(
                                searchController: _searchController,
                                onChanged: value.searchAndFilter,
                                // value.isFavoritesMode
                                //     ? value.searchAndFilterfavoretsong
                                //     : value.searchAndFiltersong,
                                onCancelSearch: value.onCancelSearch,
                              ),
                              /////list view
                              ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 10),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    // value.filterfavoretsong.length,
                                    value.isFavoritesMode
                                        ? value.filterfavoretsong.length
                                        : value.filteredsong.length,
                                itemBuilder: ((context, index) =>
                                    CustomListView(
                                      index: index,
                                      playlist: value.isFavoritesMode
                                          ? value.filterfavoretsong[index]
                                          : value.filteredsong[index],
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
            CustomBottomPlayer(),
          ],
        ),
      ),
    );
  }
}
