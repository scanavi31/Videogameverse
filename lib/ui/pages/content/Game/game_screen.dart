import 'package:flutter/material.dart';
import 'package:red_jugadores/data/services/game_pool.dart';
import 'package:red_jugadores/domain/models/game_model.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GamePoolService service = GamePoolService();
    Future<List<GameModel>> futureGames = service.fecthData();
    return FutureBuilder<List<GameModel>>(
      future: futureGames,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              GameModel game = items[index];
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      game.thumbnail,
                      width: 120,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Titulo: ${game.title}"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Descripcion: ${game.shortDescription}"),
                        Text("Genero: ${game.genre}"),
                        Text("Plataforma: ${game.platform}"),
                        Text("Publisher: ${game.publisher}"),
                        Text(
                            "Fecha de lanzamiento: ${game.releaseDate.toString()}"),
                      ],
                    ))
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
