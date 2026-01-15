import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:easy_localization/easy_localization.dart';
import 'core/theme/theme.dart';
import 'core/theme/util.dart';
import 'core/router/app_router.dart';
import 'core/providers/theme_provider.dart';
import 'data/sources/remote/supabase_client.dart';

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

class PhaelFlorApp extends ConsumerWidget {
  const PhaelFlorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = createTextTheme(context, "Work Sans", "Fraunces");
    MaterialTheme theme = MaterialTheme(textTheme);

    // Watch theme mode from provider
    final themeMode = ref.watch(themeModeProvider);

    // Get router from provider
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Phael Flor Catalog',
      debugShowCheckedModeBanner: false,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: themeMode,

      routerConfig: router,
    );
  }
}
