import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/admin/Model/add_service_model.dart';
import 'package:mobile_servies/admin/controller/add_service_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({super.key});

  @override
  _AddServicePageState createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  final _formKey = GlobalKey<FormState>();
  final _serviceNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _estimatedTimeController = TextEditingController();
  final _categoryController = TextEditingController();
  bool _isPopular = false;
  bool _isLoading = false;

  void _showSnackbar(String message, {bool isError = false}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 105, 53),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Add Service", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Gap(20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF718355),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Add Services",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 20),
              
                      _buildLabel("Service Name"),
                      textFormField(
                        "Enter service name",
                        controller: _serviceNameController,
                        validator: (value) => value!.trim().isEmpty ? "Service name is required" : null,
                      ),
              
                      const SizedBox(height: 16),
                      _buildLabel("Description"),
                      textFormField(
                        "Enter description",
                        controller: _descriptionController,
                        validator: (value) => value!.trim().isEmpty ? "Description is required" : null,
                      ),
              
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel("Price"),
                                textFormField(
                                  "Price",
                                  controller: _priceController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) return "Price is required";
                                    if (double.tryParse(value) == null) return "Enter a valid number";
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel("Estimated Time"),
                                textFormField(
                                  "Time (minutes)",
                                  controller: _estimatedTimeController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) return "Estimated time is required";
                                    if (int.tryParse(value) == null) return "Enter a valid number";
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              
                      const SizedBox(height: 16),
                      _buildLabel("Category"),
                      textFormField(
                        "Enter category",
                        controller: _categoryController,
                        validator: (value) => value!.trim().isEmpty ? "Category is required" : null,
                      ),
              
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: _isPopular,
                            onChanged: (value) {
                              setState(() {
                                _isPopular = value!;
                              });
                            },
                          ),
                          const Text("Mark as Popular", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 16),
              
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel", style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                          const Gap(10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom( backgroundColor: const Color(0xFF566F44)),
                            onPressed: _isLoading
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _isLoading = true;
                                      });
              
                                      final newService = Service(
                                        serviceId: const Uuid().v4(),
                                        serviceName: _serviceNameController.text.trim(),
                                        description: _descriptionController.text.trim(),
                                        price: double.parse(_priceController.text.trim()),
                                        category: _categoryController.text.trim(),
                                        estimatedTime: int.parse(_estimatedTimeController.text.trim()),
                                        isPopular: _isPopular,
                                      );
              
                                      try {
                                        final success = await serviceProvider.addService(newService);
                                        if (success) {
                                          _showSnackbar("Service added successfully");
                                          Navigator.pop(context);
                                        } else {
                                          _showSnackbar("Failed to add service", isError: true);
                                        }
                                      } catch (e) {
                                        _showSnackbar("Error: ${e.toString()}", isError: true);
                                      } finally {
                                        if (mounted) {
                                          setState(() {
                                            _isLoading = false;
                                          });
                                        }
                                      }
                                    }
                                  },
                            child: _isLoading
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                  )
                                : const Text("Add", style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(label, style: const TextStyle(color: Colors.white, fontSize: 16));
  }
}

Widget textFormField(
  String hintText, {
  TextEditingController? controller,
  String? Function(String?)? validator,
  TextInputType? keyboardType,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    keyboardType: keyboardType,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.white12,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    ),
  );
}