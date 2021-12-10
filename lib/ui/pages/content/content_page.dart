import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:red_jugadores/domain/use_cases/controllers/authentication.dart';
import 'package:red_jugadores/domain/use_cases/controllers/ui.dart';
import 'package:red_jugadores/ui/pages/content/Game/game_screen.dart';
import 'package:red_jugadores/ui/pages/content/location/location_screen.dart';
import 'package:red_jugadores/ui/pages/content/profile/profile_screen.dart';
//import 'package:red_jugadores/ui/pages/content/public_offers/public_offers_screen.dart';
import 'package:red_jugadores/ui/pages/content/states/states_screen.dart';
import 'package:red_jugadores/ui/pages/content/users_offers/users_offers_screen.dart';
import 'package:red_jugadores/ui/widgets/appbar.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

// View content
  Widget _getScreen(int index) {
    switch (index) {
      case 1:
        return const LocationScreen();
      case 2:
        return const StatesScreen();
      case 3:
        return const GameScreen();
      case 4:
        return const ProfileScreen();
      default:
        return const UsersOffersScreen();
    }
  }

  // We create a Scaffold that is used for all the content pages
  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    // Dependency injection: State management controller
    final UIController controller = Get.find<UIController>();
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      appBar: CustomAppBar(
        picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
        tile: const Text("Red Jugadores"),
        context: context,
        onSignOff: () {
          authController.authenticated = false;
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Obx(() => _getScreen(controller.reactiveScreenIndex.value)),
          ),
        ),
      ),
      // Content screen navbar
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.public_rounded,
                  key: Key("socialSection"),
                ),
                label: 'Red Social',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.place_outlined,
                  key: Key("locationSection"),
                ),
                label: 'Ubicación',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  key: Key("chatSection"),
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.videogame_asset_outlined,
                  key: Key("videogameSection"),
                ),
                label: 'Videojuegos',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  key: Key("profileSection"),
                ),
                label: 'Perfil',
              ),
            ],
            currentIndex: controller.screenIndex,
            onTap: (index) {
              controller.screenIndex = index;
            },
          )),
    );
  }
}


/*

  @override
  _State createState() => _State();
}

class _State extends State<ContentPage> {
  int _selectedIndex = 0;
  Widget _content = const StatesScreen();

  // NavBar action
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 1:
          _content = const LocationScreen();
          break;
        case 2:
          _content = const StatesScreen();
          break;
        case 3:
          _content = const GameScreen();
          break;
        case 4:
          _content = const ProfileScreen();
          break;
        default:
          _content = const UsersOffersScreen();
      }
    });
  }

  // We create a Scaffold that is used for all the content pages
  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
        tile: const Text("Red Jugadores"),
        context: context,
        onSignOff: () {
          Get.offNamed('/auth');
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _content,
          ),
        ),
      ),
      // Content screen navbar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.public_rounded),
            label: 'Red Social',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'Ubicación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset_outlined),
            label: 'Videojuegos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
*/