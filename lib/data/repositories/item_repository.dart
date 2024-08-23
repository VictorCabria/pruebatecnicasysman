import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/item.dart';

class ItemRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addItem(Item item) async {
    try {
      // Guarda la información en Firestore
      await firestore.collection('Items').doc(item.id).set({
        'title': item.title,
        'description': item.description,
        'imageUrl': item
            .imageUrl, // Asegúrate de que la entidad `Item` tenga este campo.
      });

      print('Item agregado correctamente');
    } catch (e) {
      // Manejo de errores
      print('Error al agregar el ítem: $e');
    }
  }

   Future<List<Item>> searchItemsByTitle(String title) async {
    try {
      final lowerCaseTitle =
          title.toLowerCase(); // Convertir el término de búsqueda a minúsculas

      // Realiza una consulta en Firestore para buscar ítems por título
      final querySnapshot = await firestore
          .collection('Items')
          .where('title', isGreaterThanOrEqualTo: lowerCaseTitle)
          .where('title', isLessThanOrEqualTo: lowerCaseTitle + '\uf8ff')
          .get();

      // Convierte los documentos a objetos Item
      return querySnapshot.docs.map((doc) {
        return Item(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          imageUrl: doc['imageUrl'],
        );
      }).toList();
    } catch (e) {
      print('Error al buscar ítems: $e');
      return [];
    }
  }
}
