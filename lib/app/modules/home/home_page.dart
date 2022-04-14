import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/modules/home/components/dota/dota_widget.dart';
import 'package:workshop_app/app/modules/home/components/todo/todo_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> with TickerProviderStateMixin {
  //use 'controller' variable to access controller

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            indicatorWeight: 4,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            controller: _tabController, 
            tabs: [
              Tab(text: 'DotaDex',),
              Tab(text: 'ToDo',),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            DotaWidget(),
            TodoWidget()
          ]
          )
        );
  }
}
