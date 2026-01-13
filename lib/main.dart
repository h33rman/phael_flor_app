import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:easy_localization/easy_localization.dart';
import 'core/theme/theme.dart';
import 'core/theme/util.dart';
import 'data/sources/remote/supabase_client.dart';
import 'presentation/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await EasyLocalization.ensureInitialized();
  await SupabaseConfig.initialize();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('fr'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('fr'),
      child: const ProviderScope(child: PhaelFlorApp()),
    ),
  );
}

class PhaelFlorApp extends StatelessWidget {
  const PhaelFlorApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Work Sans", "Fraunces");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Phael Flor Catalog',
      debugShowCheckedModeBanner: false,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,

      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          case '/onboarding':
            return MaterialPageRoute(builder: (_) => const OnboardingScreen());
          case '/language':
            return MaterialPageRoute(
              builder: (_) => const LanguageSelectorScreen(),
            );
          case '/home':
            return MaterialPageRoute(builder: (_) => const MainNavigation());
          case '/settings':
            return MaterialPageRoute(builder: (_) => const MainNavigation());
          case '/auth':
            return MaterialPageRoute(builder: (_) => const MainNavigation());
          default:
            if (settings.name?.startsWith('/product/') ?? false) {
              final productId = settings.name!.replaceFirst('/product/', '');
              return MaterialPageRoute(
                builder: (_) => ProductDetailScreen(productId: productId),
              );
            }
            return MaterialPageRoute(builder: (_) => const MainNavigation());
        }
      },
    );
  }
}
