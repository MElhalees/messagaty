import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:messagaty/theme.dart';
import 'package:messagaty/widgets/glowing_action_button_widget.dart';
import 'package:messagaty/widgets/navigation_bar_item_widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key, required this.onItemSelected}) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {

  var selectedIndex = 0;

  void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {

    final brightness = Theme.of(context).brightness;

    return Card(
      color: brightness == Brightness.light ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationBarItemWidget(
                label: 'Messages',
                icon: Ionicons.chatbubbles,
                isSelected: (selectedIndex == 0),
                index: 0,
                onTap: _onItemSelected,
              ),
              NavigationBarItemWidget(
                label: 'Calls',
                icon: Ionicons.call,
                isSelected: (selectedIndex == 1),
                index: 1,
                onTap: _onItemSelected,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GlowingActionButtonWidget(color: AppColors.secondary, icon: Ionicons.add, onPressed: () {
                }),
              ),
              NavigationBarItemWidget(
                label: 'Contacts',
                icon: Ionicons.people,
                isSelected: (selectedIndex == 2),
                index: 2,
                onTap: _onItemSelected,
              ),
              NavigationBarItemWidget(
                label: 'Profile',
                icon: Ionicons.person_circle,
                isSelected: (selectedIndex == 3),
                index: 3,
                onTap: _onItemSelected,
              ),
            ],
          ),
        )
      ),
    );
  }
}
