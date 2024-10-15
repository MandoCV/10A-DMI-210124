void main() {
  final pokemon = {
    'Name': "Pikachu",
    'HP': 100,
    'isAlive': true,
    'habilities': ["Thunderbolt", "Hacer el amor"],
    'sprites': {1: "picachu.png", 2: "pikachu2.jpg"}
  };

  print(""" Los datos del Pokemon son: $pokemon """);

  final Map<String, dynamic> trainer = {
    'Name': 'Ash Ketchup',
    'Gender': 'Male',
    'Age': 12,
    'isGymnasiumLeader': false
  };

  final pokemons = {1: "Pikachu", 2: "Charmander", 3: "Squirtle", 4: "Pidgeot"};

  print("""
  Los datos del pokemon son usando el Mapa son:
  -----------------------------------------
  Pokemon=$pokemon
  Trainer=$trainer
  Pokemons=$pokemons
  """);

  print("**********************************************");
  print(
      """Accediendo a las proppiedades del pokemon usando los braquets/corchetes []:
 ___________________________________
 Nombre= ${pokemon['Name']}
 HP=${pokemon['HP']}
 Vivo=${pokemon['isAlive']}
 Sprites=${pokemon['sprites']}
 -------------------------
 }""");
  
  
  //reto 1 ovtener el valro idependiente d ela sssssssssss11ssss
  
  // Front: ${(pokemon['sprites'])[1]}  vvss
    // Back: ${pokemon['sprites'][2]}  
    final tmp_sprites = pokemon['sprites'] as Map<int,String>;
  print("************************************************");
  print(
      """Accediendo a las proppiedades del pokemon usando los braquets/corchetessssss []:
 ___________________________________
 Nombre= ${pokemon['Name']}
 HP=${pokemon['HP']}
 Vivo=${pokemon['isAlive']}
 Sprites=${pokemon['sprites']}
 -------------------------
 }""");
}