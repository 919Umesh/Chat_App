// GetBuilder<ProductListController>(
//   builder: (controller) {
//     if (controller.isLoading) {
//       return const ShimmerEffect(
//         width: double.infinity,
//         height: 50,
//         borderRadius: 8,
//       );
//     } else if (controller.hasError) {
//       return Center(
//         child: Text(
//           'Error: ${controller.errorMessage}',
//           style: const TextStyle(color: Colors.red),
//         ),
//       );
//     } else {
//       return FormBuilderDropdown<String>(
//         name: 'product_id',
//         decoration: InputDecoration(
//           labelText: 'Select Product',
//           labelStyle: GoogleFonts.poppins(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 16,
//           ),
//         ),
//         initialValue: controller.selectedProductId,
//         items: controller.products.map((product) {
//           return DropdownMenuItem<String>(
//             value: product.id,
//             child: Text(
//               product.name,
//               style: GoogleFonts.poppins(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           );
//         }).toList(),
//         validator: FormBuilderValidators.compose([
//           FormBuilderValidators.required(
//             errorText: 'Please select a product',
//           ),
//         ]),
//         onChanged: (value) {
//           controller.updateSelectedProduct(value);
//         },
//       );
//     }
//   },
// ),