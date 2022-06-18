import 'package:bloc_study/app/bloc/app_bloc.dart';
import 'package:bloc_study/app/projects/counter/bloc/counter_bloc.dart';
import 'package:bloc_study/app/projects/counter/pages/counter_page.dart';
import 'package:bloc_study/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appScaffolStateKey = GlobalKey<ScaffoldState>();
  late final AppBloc _appBloc;

  @override
  void initState() {
    _appBloc = AppBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppPlaces.routes,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => _appBloc,
          ),
          BlocProvider(
            create: (_) => CounterBloc(),
          ),
        ],
        child: Scaffold(
          key: _appScaffolStateKey,
          appBar: AppBar(
            title: const Text('Bloc Study'),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.movie_creation_rounded,
              ),
              onPressed: () {
                _appScaffolStateKey.currentState?.openDrawer();
              },
            ),
          ),
          drawer: Drawer(
            child: Column(children: [
              ListTile(
                title: const Text(
                  'Counter',
                ),
                onTap: () {},
              )
            ]),
          ),
          body: BlocBuilder<AppBloc, AppState>(
            bloc: _appBloc,
            builder: (context, state) {
              return IndexedStack(
                index: state.currentPageIndex,
                children: const [
                  CounterPage(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
