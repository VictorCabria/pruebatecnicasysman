import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/item_controller.dart';

class AddItemPage extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController =
      TextEditingController(); // Controlador para la URL de la imagen.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller:
                  imageUrlController, // Campo para ingresar la URL de la imagen.
              decoration: InputDecoration(labelText: 'URL de la Imagen'),
            ),
            SizedBox(height: 20),
            Obx(() {
              return controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        controller.addItem(
                          titleController.text,
                          descriptionController.text,
                          imageUrlController.text, // Pasa la URL de la imagen.
                        );
                      },
                      child: Text('Agregar Item'),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
