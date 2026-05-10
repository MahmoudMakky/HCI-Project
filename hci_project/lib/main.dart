import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2563EB),
            foregroundColor: Colors.white,
            elevation: 0,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected))
              return const Color(0xFF2563EB);
            return Colors.transparent;
          }),
          side: const BorderSide(color: Colors.grey, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
      // Full Flow:
      // SignIn / SignUp
      //   → CreateProfile → SetupProfile → GraduationDetails → AddProject
      //   → HomeScreen → UserProfileScreen → UserPostInfoScreen
      //   → SearchNotFoundScreen → AdvancedFilterScreen → SearchResultsScreen
      //   → JobDetailScreen → ApplyForJobScreen
      //   → CompanyProfileScreen (Profile / Posts / People tabs)
      // Bottom Nav:
      //   Home | Network | Post (modal) | Message → ChatRoomScreen
      //   | Profile → ProfilePageScreen → AccountSettingScreen
      //                                 → SavedJobsScreen
      //                                 → TrackJobScreen
      home: const SignInScreen(),
    );
  }
}
