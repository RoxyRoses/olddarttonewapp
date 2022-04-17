import 'package:flutter/material.dart';
import 'package:workshop_app/modules/searchhero/presenter/widgets/dota_widget.dart';
import 'package:workshop_app/modules/searchhero/presenter/widgets/todo_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //use 'controller' variable to access controller

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            indicatorWeight: 4,
            labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            controller: _tabController, 
            tabs: const [
              Tab(text: 'DotaDex',),
              Tab(text: 'ToDo',),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            DotaWidget(),
            const TodoWidget()
          ]
          )
        );
  }
}
