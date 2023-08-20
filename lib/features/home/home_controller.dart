import 'package:bavitha_tech_assignment/Services/RemoteServices.dart';
import 'package:bavitha_tech_assignment/features/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  TabController? tabController;
  Data? homeData;
  var isLoading = false.obs;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
    getBookDetails();
  }
  getBookDetails() async {
     isLoading(true);
    HomeModel? homeModel = await RemoteService().getBookDetails();
     homeData = homeModel?.data;
     isLoading(false);
  }
}