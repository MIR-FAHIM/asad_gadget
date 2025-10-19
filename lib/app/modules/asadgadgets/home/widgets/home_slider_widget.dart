import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:asad_gadget/common/ui.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSliderWidget extends GetWidget<HomeController> {
  final Size _size = Get.size;

  HomeSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      if (controller.AdBannerLoad.value == true) {
        return SizedBox(
          height: _size.width * .3,
          width: _size.width,
          child: Swiper(
            autoplay: true,
            itemCount: controller.AdBanner.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: _size.width * .3,
                width: _size.width,

                margin: const EdgeInsets.all(10),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    height: _size.width * .3,
                    width: _size.width,
                    imageUrl: controller.AdBanner[index].advertisementBanner ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Image(
                        image: AssetImage('assets/Logo.png'),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Image(
                        image: AssetImage('assets/Logo.png'),
                      ),
                    ),
                  ),
                ),
              );
            },

            pagination: SwiperPagination(builder: SwiperCustomPagination(
                builder: (BuildContext context, SwiperPluginConfig? config) {
              return ConstrainedBox(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: const DotSwiperPaginationBuilder(
                                color: Colors.grey,
                                activeColor: Colors.white,
                                size: 5.0,
                                activeSize: 7.0)
                            .build(context, config!),
                      ),
                    )
                  ],
                ),
                constraints: const BoxConstraints.expand(height: 15.0),
              );
            })),
            // control: SwiperControl(color: Colors.redAccent),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Ui.shimmerLoader(
            height: _size.width * .3,
            width: _size.width,
            baseColor: Get.theme.highlightColor,
            highlightColor: Get.theme.splashColor,
          ),
        );
      }
    });
  }
}
