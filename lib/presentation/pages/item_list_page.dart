import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart'; // Importa el ThemeController
import 'item_detail_page.dart';
import 'add_item_page.dart';

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ThemeController themeController =
      Get.find(); // Obtén la instancia del ThemeController
  TextEditingController searchController =
      TextEditingController(); // Controlador para la búsqueda
  String searchQuery = ""; // Variable para almacenar el término de búsqueda

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _showSearchDialog();
            },
          ),
          IconButton(
            icon: Icon(themeController.isDarkMode.value
                ? Icons.wb_sunny
                : Icons.nightlight_round),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: (searchQuery.isEmpty)
            ? firestore.collection('Items').snapshots()
            : firestore
                .collection('Items')
                .where('title', isGreaterThanOrEqualTo: searchQuery)
                .where('title', isLessThanOrEqualTo: searchQuery + '\uf8ff')
                .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los datos'));
          }
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No se encontraron ítems'));
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              var itemData = snapshot.data!.docs[index];
              return ListTile(
                leading: Image.network(itemData['imageUrl']),
                title: Text(itemData['title']),
                subtitle: Text(
                  itemData['description'],
                  style: TextStyle(fontSize: 12),
                ),
                onTap: () {
                  Get.to(ItemDetailPage(
                    title: itemData['title'],
                    description: itemData['description'],
                    imageUrl: itemData['imageUrl'],
                  ));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddItemPage());
        },
        child: Icon(Icons.add),
        tooltip: 'Agregar nuevo ítem',
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Buscar Ítem'),
          content: TextField(
            controller: searchController,
            decoration: InputDecoration(hintText: 'Ingrese el título'),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  searchQuery = searchController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Buscar'),
            ),
          ],
        );
      },
    );
  }
}
