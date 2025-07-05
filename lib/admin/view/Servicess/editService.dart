import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/admin/Model/add_service_model.dart';
import 'package:mobile_servies/admin/controller/add_service_provider.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:provider/provider.dart';

class EditService extends StatefulWidget {
  final Service service;

  const EditService({super.key, required this.service});

  @override
  State<EditService> createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {
  static const _padding = EdgeInsets.all(16);
  static const _gap = Gap(16);
  static const _borderRadius = BorderRadius.all(Radius.circular(15));

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _estimatedTimeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  bool _isPopular = false;

  @override
  void initState() {
    super.initState();
    _serviceNameController.text = widget.service.serviceName;
    _descriptionController.text = widget.service.description;
    _priceController.text = widget.service.price.toString();
    _estimatedTimeController.text = widget.service.estimatedTime.toString();
    _categoryController.text = widget.service.category;
    _isPopular = widget.service.isPopular;
  }

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 85, 105, 53),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Edit Service", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: _padding,
        child: Center(
          child: Column(
            children: [Gap(20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                constraints: const BoxConstraints(maxWidth: 400),
                padding: _padding,
                decoration: BoxDecoration(
                  color: const Color(0xFF718355),
                  borderRadius: _borderRadius,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Edit Service",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      _gap,
                      buildLabel("Service Name"),
                      buildTextField(
                        "Enter service name",
                        controller: _serviceNameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) return "Service name is required";
                          return null;
                        },
                      ),
              
                      _gap,
                      buildLabel("Description"),
                      buildTextField(
                        "Enter description",
                        controller: _descriptionController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) return "Description is required";
                          return null;
                        },
                      ),
              
                      _gap,
              
                      // Price and Time Row
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildLabel("Price"),
                                buildTextField(
                                  "Enter price",
                                  controller: _priceController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) return "Price is required";
                                    final parsed = double.tryParse(value);
                                    if (parsed == null) return "Invalid price";
                                    if (parsed <= 0) return "Price must be greater than 0";
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
                                buildLabel("Estimated Time"),
                                buildTextField(
                                  "Enter time",
                                  controller: _estimatedTimeController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) return "Time is required";
                                    final parsed = int.tryParse(value);
                                    if (parsed == null) return "Invalid time";
                                    if (parsed <= 0) return "Time must be greater than 0";
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              
                      _gap,
              
                      // Category
                      buildLabel("Category"),
                      buildTextField(
                        "Enter category",
                        controller: _categoryController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) return "Category is required";
                          return null;
                        },
                      ),
              
                      _gap,
              
                      // Popular Checkbox
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
              
                      const Gap(30),
              
                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.grey),
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel", style: TextStyle(color: Colors.white,fontSize: 16)),
                          ),
                          const SizedBox(width: 12),
                          Consumer<ServiceProvider>(
                      builder: (context, provider, _) {
                        final isLoading = provider.isLoading;

                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF566F44),
                          ),
                          onPressed: isLoading
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    final service = Service(
                                      serviceId: widget.service.serviceId,
                                      serviceName: _serviceNameController.text.trim(),
                                      description: _descriptionController.text.trim(),
                                      price: double.tryParse(_priceController.text.trim()) ?? 0.0,
                                      estimatedTime: int.tryParse(_estimatedTimeController.text.trim()) ?? 0,
                                      category: _categoryController.text.trim(),
                                      isPopular: _isPopular,
                                    );

                                    try {
                                      final success = await provider.updateService(service);

                                      if (!context.mounted) return;

                                      if (success) {
                                        Navigator.pop(context, true);
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Failed to update service')),
                                        );
                                      }
                                    } catch (e) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Error: $e')),
                                        );
                                      }
                                    }
                                  }
                                },
                          child: isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : const Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                        );
                      },
                    )

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Text(text, style: const TextStyle(color: Colors.white, fontSize: 16));
  }

  Widget buildTextField(
    String hintText, {
    TextEditingController? controller,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      
    );
  }
}