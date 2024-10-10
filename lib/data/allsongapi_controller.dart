import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Api/api_url.dart';
import '../models/apisong_model.dart';
import '../uitles/colors.dart';
import '../widgets/flutter_toast.dart';

class AllSongs_Api {
  static BaseUrl _baseUrl = new BaseUrl();
  static late List<SongApi> allsong = [];
  static late List<CheckVersionApi> checkVersionApi = [];
  ///////////////////////////////////////////////////
  static Future<List<SongApi>?> fetchdataallsong() async {
    final Dio dio = new Dio();

    try {
      // http.Response response = await http.get(Uri.parse("$baseUrl/api/Auth/"));
      var response =
          await dio
              .get("${_baseUrl.baseurl.trim()}${_baseUrl.getallsong.trim()}");
      // print(response.statusCode);
      // print(response.data);
      var responsedata = response.data as List;
      if (response.statusCode == 200) {
        allsong =
            // المودل حق الشالية
            responsedata.map((e) => SongApi.fromJson(e)).toList();
        return allsong;

        // if (!didDispose) {
        // }
      } else if (response.statusCode == 400) {
        ShowMasseg.ShowToastMasseg(
            "لايوجد اتصال بالانترنت", LigthColor.favorColor);
        return null;
        // print(response.statusMessage);
      } else {
        ShowMasseg.ShowToastMasseg(
            "لايوجد اتصال بالانترنت", LigthColor.favorColor);
        return null;

        // print(response.statusMessage);
      }
      //print(comp.);
    } on DioException catch (e) {
      ShowMasseg.ShowToastMasseg(
          "لايوجد اتصال بالانترنت", LigthColor.favorColor);
      return null;
      // print("=============================================${e}");
    }
  }

  /////////////////////////////////////////////////////////////////
  static Future<bool> generatefile(int? id) async {
    //_clientid = order['clientId'];
    final Dio dio = new Dio();
    try {
      // var response = await http.get(Uri.parse(
      //     "${_baseUrl.baseurl.trim()}${_generatepdf.url.trim()}${widget.id}"));
      var response = await dio.getUri(Uri.parse(
          "${_baseUrl.baseurl.trim()}${_baseUrl.getAudioFile.trim()}${id}"));

      // print(response.statusCode);
      // print(response.body);

      if (response.statusCode == 200) {
        // didDispose = true;
        // printpdf = true;
        ShowMasseg.ShowToastMasseg("تمت العملية بنجاح", LigthColor.maincolor);
        return true;
      } else if (response.statusCode == 400) {
        ShowMasseg.ShowToastMasseg(
            "لايوجد اتصال بالانترنت", LigthColor.favorColor);
        return false;
        // print(response.statusMessage);
      } else {
        ShowMasseg.ShowToastMasseg(
            "لايوجد اتصال بالانترنت", LigthColor.favorColor);
        return false;
        // print(response.statusMessage);
      }
    } on DioException catch (e) {
      // didDispose = true;
      ShowMasseg.ShowToastMasseg(
          "لايوجد اتصال بالانترنت", LigthColor.favorColor);
      return false;
      // print(e);
    }
  }
  ///////////////////////////////////////////////////////
  static Future<dynamic> getappversion(String? version) async {
    //_clientid = order['clientId'];
    final Dio dio = new Dio();
    try {
      // var response = await http.get(Uri.parse(
      //     "${_baseUrl.baseurl.trim()}${_generatepdf.url.trim()}${widget.id}"));
      var response = await dio.getUri(Uri.parse(
          "${_baseUrl.baseurl.trim()}${_baseUrl.checkUpdateApp.trim()}${version}"));

      // print(response.statusCode);
      // print(response.body);
      var responsedata = response.data as List;
      if (response.statusCode == 200) {
        // didDispose = true;
        // printpdf = true;
        // ShowMasseg.ShowToastMasseg("تمت العملية بنجاح", LigthColor.maincolor);
        //  checkVersionApi =
        //     responsedata.map((e) => CheckVersionApi.fromJson(e)).toList();
        // return checkVersionApi;
          
        
        return responsedata;
      } else if (response.statusCode == 400) {
        // ShowMasseg.ShowToastMasseg(
        //     "لايوجد اتصال بالانترنت", LigthColor.favorColor);
        return false;
        // print(response.statusMessage);
      } else {
        // ShowMasseg.ShowToastMasseg(
        //     "لايوجد اتصال بالانترنت", LigthColor.favorColor);
        return false;
        // print(response.statusMessage);
      }
    } on DioException catch (e) {
      // didDispose = true;
      // ShowMasseg.ShowToastMasseg(
      //     "لايوجد اتصال بالانترنت", LigthColor.favorColor);
      return false;
      // print(e);
    }
  }
}
