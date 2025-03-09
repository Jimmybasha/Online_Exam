import 'package:flutter/material.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import '../../../Auth/data/Models/user_model/user_model.dart';
import 'package:online_exam/Features/Home/presentation/view/home_screen.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/active_icon.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/inactive_icon.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View/widgets/ProfilePage.dart';



class MainScreen extends StatefulWidget {
  static const String id = 'MainScreen';
  const MainScreen({super.key});



  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedItem = 0;
  UserModel? userModel; // Change to nullable

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments as UserModel;
    userModel=args;
  }

  @override
  Widget build(BuildContext context) {

     final List<Widget> screens = <Widget>[
      HomeScreen(),
      Placeholder(),
      ProfilePage(user:userModel!.user),
    ];
    List<BottomNavigationBarItem> bottomBarItems = [
      BottomNavigationBarItem(
        label: 'Explore',
        icon: selectedItem == 0
            ? ActiveIcon(image: kExploreActive)
            : InActiveIcon(image: kExploreInActive),
      ),
      BottomNavigationBarItem(
        label: 'Result',
        icon: selectedItem == 1
            ? ActiveIcon(image: kResultActive)
            : InActiveIcon(image: kResultInActive),
      ),
      BottomNavigationBarItem(
        label: 'Profile',
        icon: selectedItem == 2
            ? ActiveIcon(image: kProfileActive)
            : InActiveIcon(image: kProfileInActive),
      ),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,
        onTap: (value) {
          selectedItem = value;
          setState(() {});
        },
        backgroundColor: AppColors.kNavBarBackgroundColor,
        items: bottomBarItems,
      ),
      body: screens[selectedItem],
    );
  }
}
