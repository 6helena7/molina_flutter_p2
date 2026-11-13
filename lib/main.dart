import 'package:flutter/material.dart';
//importo la classe de usuaris
import 'package:molina_flutter_p2/usuaris.dart';

//per executar la app
void main() {
  runApp(const MyApp());
}

// WIDGET PRINCIPAL
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pràctica 2',
      theme: ThemeData(
        // Genera toda la paleta de colores de la app a partir de un color base
        colorScheme: .fromSeed(seedColor: Colors.tealAccent),
      ),
      // La pantalla que se muestra al abrir la app
      home: const MyHomePage(title: 'Flutter'),
    );
  }
}

//PANTALLA PRINCIPAAAAAAAAAAL
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  //text q he definit com a titol a dalt
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //missatge de salutació (text gran)
            Text(
              'Holaaaaaaaaaaaaaaaa!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            //espai per separar la salutació del boto
            const SizedBox(height: 24),

            //boto q obre el llistat curt
            ElevatedButton(
              //funcio q s'executa al clicar el botó
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //construeix i mostra una pantalla sencera nova
                    builder: (context) => const LlistatCurtScreen(),
                  ),
                );
              },
              // Text q es veura dintre el boto
              child: const Text('Llistat curt'),
            ),
            // espai entre el dos botons
            const SizedBox(height: 12),

            // Botó per obrir el llistatllarg
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LlistatLlargScreen(),
                  ),
                );
              },
              child: const Text('Llistat llarg'),
            ),
          ],
        ),
      ),
    );
  }
}

//PANTALLA LLISTAT CURT

class LlistatCurtScreen extends StatelessWidget {
  const LlistatCurtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Creo una llista fixa de 5 usuaris i els creo
    final List<Usuaris> usuaris = [
      Usuaris(nom: 'Xavi Quesada', email: 'xavi@gmail.com'),
      Usuaris(nom: 'Josué Espinoza', email: 'josue@gmail.com'),
      Usuaris(nom: 'Andrés Buddelmann', email: 'andres@gmail.com'),
      Usuaris(nom: 'Jan Perez', email: 'jan@gmail.com'),
      Usuaris(nom: 'Paco Sanz', email: 'paco@gmail.com'),
    ];

    return Scaffold(

      appBar: AppBar(title: const Text('Llistat curt')),
  
      body: ListView(
        
        padding: const EdgeInsets.all(16),
        children: [
          //bucle for per a recorrer el llistat de usuaris
          for (final u in usuaris)
            //creo les targetes utilitzant la base q esta al layouts1_widget
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                //espai entre la vora de la targeta i el seu contingut
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Introdueixo el titol de la targeta
                    const Text(
                      'Usuari',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Coloco un dibuix de personeta davant del nom
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.deepPurple),
                        const SizedBox(width: 8),
                        //insereixo el nom de l'usuari actual (index) amb u.nom
                        Text(
                          'Nom: ${u.nom}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    //coloco un dibuix del correu davant del correu
                    Row(
                      children: [
                        const Icon(Icons.email, color: Colors.deepPurple),
                        const SizedBox(width: 8),
                        //insereixo el email de l'usuari actual (index) amb u.email
                        Text(
                          'Correu: ${u.email}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------
//PANTALLA LLISTAT LLARG
class LlistatLlargScreen extends StatelessWidget {
  const LlistatLlargScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //genero una llista amb 100 usuaris dintre
    final List<Usuaris> usuaris = List.generate(
      100,
      (i) => Usuaris(
        nom: 'Usuari ${i + 1}', /*li sumo 1 al index de la llista d'usuaris 
        per a q comenci desde el 1 
        */
        email: 'usuari${i + 1}@gmail.com', //igual 
      ),
    );

    return Scaffold(
      //li poso el titol al llistat llarg
      appBar: AppBar(title: const Text('Llistat llarg')),
      //utilitzo el listview.builder perque es una llista de 100 usuaris 
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        //indico quants elements te la llista (100)
        itemCount: usuaris.length,
  
        itemBuilder: (context, index) {

          //S'agafa l'usuari q correspon a la posicio de l'index
          final u = usuaris[index];
          //Retorna els usuaris amb el seu nom i correu
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Usuari',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.person, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text(
                        'Nom: ${u.nom}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.email, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text(
                        'Correu: ${u.email}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}