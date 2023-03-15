import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iba_course/mid/api.dart';
import 'package:iba_course/provider/ui.dart';
import 'package:iba_course/widget/local_widget.dart';
import 'package:provider/provider.dart';

import 'api_data/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(body: ProviderCounter()),
      ));
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   localizationsDelegates: AppLocalizations.localizationsDelegates,
    //   supportedLocales: AppLocalizations.supportedLocales,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const Scaffold(body: MakeUpProducts()),
    // );
  }
}
