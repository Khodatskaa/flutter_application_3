import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/consts/consts.dart';
import 'package:flutter_application_3/core/theme/app_text_style/app_text_style.dart';
import 'package:flutter_application_3/feature/presentation/screens/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, Bobr 👋', style: AppTextStyle.primaryText),
                        const SizedBox(height: 5),
                        Text('Explore the world',
                            style: AppTextStyle.secondaryText),
                      ],
                    ),
                    const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(AppConsts.avatarImage)),
                  ],
                ),
                const SizedBox(height: AppConsts.paddingHeightMedium),
                DropDownTextField(
                  initialValue: 'New York',
                  clearIconProperty: IconProperty(
                    icon: Iconsax.filter,
                    color: AppColors.primaryIconsColor, // Use AppColors from consts.dart
                  ),
                  textFieldDecoration: InputDecoration(
                    hintText: 'Where do you want to go?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppConsts.borderRadius),
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.disableBorderColor),
                    ),
                  ),
                  searchDecoration: InputDecoration(
                    hintText: 'Search for places',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppConsts.borderRadius),
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.disableBorderColor),
                    ),
                  ),
                  dropDownList: const [
                    DropDownValueModel(name: 'New York', value: "new_york"),
                    DropDownValueModel(name: 'Chikago', value: "chikago"),
                    DropDownValueModel(name: 'Washington', value: "washigton"),
                  ],
                ),
                const SizedBox(height: AppConsts.paddingHeightMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular places',
                        style: AppTextStyle.primaryText.copyWith(fontSize: 20)),
                    Text('View all',
                        style: AppTextStyle.secondaryText.copyWith(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: AppConsts.paddingHeightMedium),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      for (var item in homeController.buttonTextMap.entries)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: AppButton(
                            onPressed: () {
                              homeController.changeButtonState(item.key);
                            },
                            isActive: item.value,
                            text: item.key,
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          enableFeedback: false,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Iconsax.house,
                  size: 30, color: AppColors.primaryIconsColor),
              icon: Icon(Iconsax.home,
                  size: 30, color: AppColors.secondaryIconsColor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Iconsax.clock,
                  size: 30, color: AppColors.primaryIconsColor),
              icon: Icon(Iconsax.clock,
                  size: 30, color: AppColors.secondaryIconsColor),
              label: 'Clock',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Iconsax.heart,
                  size: 30, color: AppColors.primaryIconsColor),
              icon: Icon(Iconsax.heart,
                  size: 30, color: AppColors.secondaryIconsColor),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Iconsax.user,
                  size: 30, color: AppColors.primaryIconsColor),
              icon: Icon(Iconsax.user,
                  size: 30, color: AppColors.secondaryIconsColor),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
