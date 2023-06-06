import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyek/page/dashboard.dart';
import 'package:proyek/page/deposito.dart';
import 'package:proyek/page/pinjaman.dart';
import 'package:proyek/page/simpanan.dart';

class Home extends StatefulWidget {
  const Home({ super.key });
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Dashboard', 
      icon: Icon(CupertinoIcons.home),
    ),
    Tab(
      text: 'Tabungan',
      icon: Icon(CupertinoIcons.money_dollar_circle_fill),
    ),
    Tab(
      text: 'Kredit',
      icon: Icon(CupertinoIcons.tray_arrow_down_fill),
    ),
    Tab(
      text: 'Deposito',
      icon: Icon(CupertinoIcons.tray_arrow_up_fill),
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff80),
      bottomNavigationBar: AnimatedTabBar(
        tabs : myTabs,
        controller: _tabController,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Dashboard(),
          Simpanan(),
          Pinjaman(),
          Deposito()
        ],
      ),
    );
  }
}

class AnimatedTabBar extends StatefulWidget {
  const AnimatedTabBar({super.key, required this.tabs, required this.controller});
  final List<Tab> tabs;
  final TabController controller;

  @override
  State<AnimatedTabBar> createState() => _AnimatedTabBarState();
}

class _AnimatedTabBarState extends State<AnimatedTabBar> {
  final animationDuration = Duration(milliseconds: 300);
  final animationCurve = Curves.easeInOut;
  int tabIndex = 0;
  @override
  void initState() { 
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        tabIndex = widget.controller.index;
      });
    });
  }

  final tabHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: tabHeight,
      child: Stack(
        children: [
          AnimatedAlign(
            duration: animationDuration,
            curve: animationCurve,
            alignment: FractionalOffset(1 / (widget.tabs.length -1) * tabIndex, 0),
            child: Container(
              height: tabHeight,
              color: Colors.transparent,
              child: FractionallySizedBox(
                widthFactor: 1/widget.tabs.length,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text('${widget.tabs[tabIndex].text}',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: widget.tabs.asMap().entries.map((entry){
              final i = entry.key;
              final tab = entry.value;
              final isActiveTab = i == tabIndex;
              return Expanded(child: 
                GestureDetector(
                  onTap: () => widget.controller.animateTo(i),
                  child: AnimatedOpacity(
                    duration: animationDuration,
                    curve: animationCurve,
                    opacity: isActiveTab ? 1 : 0.25,
                    child: Container(
                      color: Colors.transparent,
                      height: tabHeight,
                      child: AnimatedSlide(
                        duration: animationDuration,
                        curve: animationCurve,
                        offset: Offset(0, isActiveTab ? -0.15 : 0),
                        child: tab.icon ?? const Icon(CupertinoIcons.home))
                    ),
                  ),
                )
              );
          }).toList()),
        ],
      ),
    );
  }
}