import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Localize extends StatefulWidget {
  const Localize({super.key});

  @override
  State<Localize> createState() => _LocalizeState();
}

class _LocalizeState extends State<Localize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
    );
  }
}
