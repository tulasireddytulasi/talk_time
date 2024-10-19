import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:talk_time/app/controllers/platform_info.dart';
import 'package:talk_time/app/data/resource/local_db_contact_data_source.dart';
import 'package:talk_time/app/domain/get_contacts_use_case.dart';
import 'package:talk_time/app/presentation/home_screen/bloc/home_bloc.dart';
import 'package:talk_time/app/presentation/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/data/repositories/contact_repository.dart';
import 'app/data/resource/api_contact_data_source.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set up dependencies
  final apiDataSource = ApiContactDataSource();
  final localDbDataSource = LocalDbContactDataSource();
  final contactRepository = ContactRepository(
    contactDataSource: localDbDataSource,
  );

  runApp(MyApp(getContactsUseCase: GetContactsUseCase(contactRepository: contactRepository)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.getContactsUseCase});

  final GetContactsUseCase getContactsUseCase;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PlatformInfo.instance.initialize(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(
            getContactsUseCase: getContactsUseCase,
          )..add(FetchContacts()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  /// Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
