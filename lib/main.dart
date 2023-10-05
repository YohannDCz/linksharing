import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login.dart';
import 'not_found.dart';
import 'signup.dart';
import 'styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ahuyeiigaoqkclumqskt.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFodXllaWlnYW9xa2NsdW1xc2t0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU0ODUyNjIsImV4cCI6MjAxMTA2MTI2Mn0.BMcy2XXjXLIkv2_v3qvP7EXfMB4YIdd4HugQ-eUAmYM',
  );
  runApp(const LinkSharing());
}

class LinkSharing extends StatelessWidget {
  const LinkSharing({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Instrument',
        primaryColor: const Color(0xFF633CFF),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return lavanderLight;
                } else if (states.contains(MaterialState.disabled)) {
                  return lavanderLighter;
                }
                return lavander;
              },
            ),
          ),
        ),
      ),
      routes: {
        '/': (context) => const Login(),
        '/signup': (_) => const SignUp(),
      },
      onUnknownRoute: (_) => MaterialPageRoute(
        builder: (_) => const NotFound(),
      ),
    );
  }
}
