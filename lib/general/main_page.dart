import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_sample_auth/auth/presentation/widget/parent.dart';
import 'package:test_sample_auth/core/utils/context.dart';
import 'package:test_sample_auth/core/utils/data_helper.dart';
import 'package:test_sample_auth/general/menu_drawer.dart';
import 'package:test_sample_auth/resources/dimens.dart';
import 'package:test_sample_auth/resources/palette.dart';

import '../auth/presentation/login/cubit/auth_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<DataHelper> _dataMenus;
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _dataMenus = [
      DataHelper(
        title: 'products',
        isSelected: true,
      ),
      DataHelper(
        title: 'logout',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_dataMenus[_currentIndex].title == 'products') {
          return true;
        } else {
          if (_scaffoldKey.currentState!.isEndDrawerOpen) {
            //hide navigation drawer
            _scaffoldKey.currentState!.openDrawer();
          } else {
            for (final menu in _dataMenus) {
              setState(() {
                menu.isSelected = menu.title == 'products';
              });
            }
          }

          return false;
        }
      },
      child: Parent(
        scaffoldKey: _scaffoldKey,
        appBar: _appBar(),
        drawer: SizedBox(
          width: context.widthInPercent(80),
          child: MenuDrawer(
            dataMenu: _dataMenus,
            currentIndex: (int index) {
              /// don't update when index is logout
              if (index != 2) {
                setState(() {
                  _currentIndex = index;
                });
              }

              /// hide navigation drawer
              _scaffoldKey.currentState?.openEndDrawer();
            },
            onLogoutPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(
                    'logout',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  content: Text(
                    'Do you want to log out of your account?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => context.back(),
                      child: Text(
                        'cancel',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Palette.hint),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().logout();
                      },
                      child: Text(
                        'yes',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Palette.red),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        child: widget.child,
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          _dataMenus[_currentIndex].title ?? "-",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            size: Dimens.space24,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
    );
  }
}
