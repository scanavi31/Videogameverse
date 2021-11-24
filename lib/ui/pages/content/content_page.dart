import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:red_jugadores/ui/pages/content/Game/game_screen.dart';
import 'package:red_jugadores/ui/pages/content/location/location_screen.dart';
import 'package:red_jugadores/ui/pages/content/profile/profile_screen.dart';
import 'package:red_jugadores/ui/pages/content/public_offers/public_offers_screen.dart';
import 'package:red_jugadores/ui/pages/content/states/states_screen.dart';
import 'package:red_jugadores/ui/pages/content/users_offers/users_offers_screen.dart';
import 'package:red_jugadores/ui/widgets/appbar.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

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
          _content = const UsersOffersScreen();
          break;
        case 3:
          _content = const GameScreen();
          break;
        case 4:
          _content = const ProfileScreen();
          break;
        default:
          _content = const StatesScreen();
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
