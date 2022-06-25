import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noesatrip_app/data/providers/auth.dart';
import 'package:noesatrip_app/data/providers/destination_data.dart';
import 'package:noesatrip_app/data/providers/order_data.dart';
import 'package:noesatrip_app/helpers/custom_scroll.dart';
import 'package:noesatrip_app/presentation/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import '../presentation/widgets/custom_nav_bar.dart';
import '../presentation/screens/home_page.dart';
import '../presentation/screens/booking_page.dart';
import '../presentation/screens/wishlist_page.dart';
import '../presentation/screens/profile_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, DestinationData>(
          create: (_) => DestinationData(null, null, []),
          update: (_, auth, prevDest) => DestinationData(
              auth.token, auth.userId, prevDest == null ? [] : prevDest.items),
        ),
        ChangeNotifierProxyProvider<Auth, OrderData>(
          create: (_) => OrderData(null, null, []),
          update: (_, auth, prevOrder) => OrderData(auth.token, auth.userId,
              prevOrder == null ? [] : prevOrder.items),
        ),
      ],
      child: Consumer(
        builder: (ctx, _, __) => const MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    BookingPage(),
    WishlistPage(),
    ProfilePage(),
  ];

  void _setIndex(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: customNavBar(
          _currentIndex,
          (val) => _setIndex(val),
        ),
      ),
    );
  }
}
