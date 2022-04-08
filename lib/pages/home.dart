import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_board/widgets/accepted_jobs.dart';

import '../logic/app_cubit.dart';
import '../widgets/decorated_tabbar.dart';
import '../widgets/job_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;
  int tabindex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    tabController =
        TabController(length: 2, vsync: this, initialIndex: tabindex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      var cubit = AppCubit.get(context);
      var allJobs = AppCubit.get(context).jobs;
      var acceptedJobs = AppCubit.get(context).acceptedJobs;

      return DefaultTabController(
          length: 2,
          child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: const Color(0xFFF5F5F5),
              appBar: AppBar(
                title: const Text('Gophr Job Board',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                backgroundColor: const Color(0xFFD5D5D5),
                bottom: DecoratedTabBar(
                  tabBar: TabBar(
                    controller: tabController,
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontFamily: 'IBMPlexSans',
                    ),
                    unselectedLabelStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontFamily: 'IBMPlexSans',
                    ),
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    tabs: const [
                      Align(
                          alignment: Alignment.center,
                          child: Tab(text: 'JOBS')),
                      Align(
                          alignment: Alignment.center,
                          child: Tab(text: 'ACCEPTED JOBS')),
                    ],
                  ),
                  bgcolor: Colors.white,
                ),
              ),
              body: Container(
                  margin: const EdgeInsets.all(10),
                  child: TabBarView(controller: tabController, children: [
                    allJobs.isNotEmpty
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: allJobs.length,
                            itemBuilder: (context, index) {
                              var job = allJobs.elementAt(index);

                              return JobItem(
                                cubit: cubit,
                                job: job,
                              );
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.grey),
                            ),
                          ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: acceptedJobs.length,
                      itemBuilder: (context, index) {
                        var acceptedJob = acceptedJobs.elementAt(index);
                        return AcceptedJobs(
                          job: acceptedJob,
                        );
                      },
                    ),
                  ]))));
    });
  }
}
