import 'package:flutter/material.dart';
import 'func.dart';

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> with Func {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recipe",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context)
                .pushNamed("/lists")
                .then((value) => setState(() {}));
          },
        ),
      ),
      body: FutureBuilder(
        future: getRecipe(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 300,
                          child: Image.network(
                            snapshot.data!['image'],
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Placeholder(
                                fallbackHeight: 300,
                              );
                            },
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          snapshot.data!['name'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Text(snapshot.data!['description'])
                    ],
                  ),
                ));
          } else {
            return Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text("No Receipe", style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500)),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant), label: 'Recipe'),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_download_sharp), label: 'Files'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble), label: 'Chat Room')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedLabelStyle:
        const TextStyle(color: Colors.black, fontSize: 11),
        unselectedIconTheme: const IconThemeData(size: 15),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 1) {
      Navigator.pushNamed(context, "/recipe");
    } else if (_selectedIndex == 2) {
      Navigator.pushNamed(context, "/file");
    } else {
      Navigator.pushNamed(context, "/chat");
    }
  }
}