class Peliculas {
  var titulo, raiting, plot, poster;
  var anno, minutos;
  var tags, director, writer, actor;

  Peliculas(
      {this.titulo,
      this.raiting,
      this.plot,
      this.poster,
      this.anno,
      this.minutos,
      this.tags,
      this.director,
      this.writer,
      this.actor});
}

final peli1 = Peliculas(
    titulo: 'Pelicula 1',
    raiting: 'M-18',
    plot: 'Texto',
    poster: 'Texto',
    anno: 2001,
    minutos: 100,
    tags: ['uno', 'dos', 'tres'],
    director: ['uno', 'dos', 'tres'],
    writer: ['uno', 'dos', 'tres'],
    actor: ['uno', 'dos', 'tres']);
