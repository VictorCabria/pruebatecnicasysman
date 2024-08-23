import 'package:get/get.dart';
import '../../data/repositories/item_repository.dart';
import '../../domain/entities/item.dart';

class ItemController extends GetxController {
  final ItemRepository repository = ItemRepository();
  var isLoading = false.obs;
    var searchResults = <Item>[].obs;

  Future<void> addItem(
      String title, String description, String imageUrl) async {
    try {
      isLoading.value = true;


      // Crea una instancia de Item con los datos proporcionados
      final item = Item(
        id: DateTime.now().toString(), // Puedes usar cualquier generador de ID.
        title: title,
        description: description,
        imageUrl: imageUrl, // Aquí se asigna la URL de la imagen.
      );

      // Llama al repositorio para agregar el ítem
      await repository.addItem(item);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchItems(String title) async {
    try {
      isLoading.value = true;
      // Llama al repositorio para buscar los ítems
      final results = await repository.searchItemsByTitle(title);
      searchResults.assignAll(results); // Actualiza la lista de resultados
    } finally {
      isLoading.value = false;
    }
  }

}
