import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_sample_auth/core/utils/context.dart';
import 'package:test_sample_auth/core/utils/data_helper.dart';
import 'package:test_sample_auth/resources/dimens.dart';
import 'package:test_sample_auth/resources/palette.dart';

import '../core/common/app_route.dart';
import '../core/common/widgets/spacer_h.dart';
import '../core/common/widgets/spacer_v.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    super.key,
    required this.dataMenu,
    required this.currentIndex,
    required this.onLogoutPressed,
  });

  final List<DataHelper> dataMenu;
  final Function(int) currentIndex;
  final VoidCallback onLogoutPressed;

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: context.widthInPercent(100),
            height: Dimens.header,
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Palette.hint,
                    radius: Dimens.space36 + Dimens.space2,
                    child: CircleAvatar(
                      backgroundImage:
                          const AssetImage("assets/image/ic_luncher.jpg"),
                      radius: Dimens.space36,
                    ),
                  ),
                  const SpacerH(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome dear user",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Palette.white),
                        ),
                        Text(
                          "-*-*-*-*-",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SpacerV(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.dataMenu
                .map<Widget>(
                  (value) => SizedBox(
                    width: double.maxFinite,
                    child: InkWell(
                      onTap: () {
                        for (final menu in widget.dataMenu) {
                          menu.isSelected = menu.title == value.title;

                          if (value.title != null) {
                            widget.currentIndex(
                              widget.dataMenu.indexOf(value),
                            );
                          }
                        }

                        _selectedPage(value.title!);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Dimens.space12,
                          horizontal: Dimens.space24,
                        ),
                        child: Text(
                          value.title!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ), //
          const SpacerH(),
        ],
      ),
    );
  }

  void _selectedPage(String title) {
    //TODO : Update page from selected Page
    if (title == 'product') {
      context.goNamed(Routes.product.name);
    } else if (title == 'logout') {
      widget.onLogoutPressed.call();
    }
  }
}
