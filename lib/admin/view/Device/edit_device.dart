import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/add_device_model.dart';
import 'package:mobile_servies/admin/controller/add_device_provider.dart';
import 'package:mobile_servies/admin/view/Device/widgets.dart';
import 'package:provider/provider.dart';

class EditDevice extends StatefulWidget {
  final Device device;

  const EditDevice({required this.device, super.key});

  @override
  _EditDeviceState createState() => _EditDeviceState();
}

class _EditDeviceState extends State<EditDevice> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _brandController;
  late final TextEditingController _typeController;
  late final TextEditingController _nameController;
  late final TextEditingController _modelController;
  late final TextEditingController _yearController;
  late final TextEditingController _componentsController;
  late final TextEditingController _issuesController;

  @override
  void initState() {
    super.initState();
    _brandController = TextEditingController(text: widget.device.brand);
    _typeController = TextEditingController(text: widget.device.deviceType);
    _nameController = TextEditingController(text: widget.device.deviceName);
    _modelController = TextEditingController(text: widget.device.model);
    _yearController = TextEditingController(text: widget.device.releaseYear.toString());
    _componentsController = TextEditingController(text: widget.device.repairableComponents);
    _issuesController = TextEditingController(text: widget.device.commonIssues);
  }

  @override
  void dispose() {
    _brandController.dispose();
    _typeController.dispose();
    _nameController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _componentsController.dispose();
    _issuesController.dispose();
    super.dispose();
  }

  Future<bool> _submitForm() async {
    if (!_formKey.currentState!.validate()) return false;

    final provider = Provider.of<DeviceProvider>(context, listen: false);
    try {
      final updatedDevice = Device(
        deviceId: widget.device.deviceId,
        deviceName: _nameController.text.trim(),
        brand: _brandController.text.trim(),
        deviceType: _typeController.text.trim(),
        model: _modelController.text.trim(),
        releaseYear: int.parse(_yearController.text.trim()),
        commonIssues: _issuesController.text.trim(),
        repairableComponents: _componentsController.text.trim(),
      );

      return await provider.updateDevice(updatedDevice);
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DeviceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Device', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 85, 105, 53),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width > 600 ? 600 : double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF718355),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Edit Device Information',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: AdminbuildTextField(
                          label: "Brand",
                          controller: _brandController,
                          validator: (value) => value!.isEmpty ? 'Brand is required' : null,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AdminbuildTextField(
                          label: "Type",
                          controller: _typeController,
                          validator: (value) => value!.isEmpty ? 'Type is required' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: AdminbuildTextField(
                          label: "Name",
                          controller: _nameController,
                          validator: (value) => value!.isEmpty ? 'Name is required' : null,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AdminbuildTextField(
                          label: "Model",
                          controller: _modelController,
                          validator: (value) => value!.isEmpty ? 'Model is required' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  AdminbuildTextField(
                    label: "Year Released",
                    controller: _yearController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) return 'Year is required';
                      final year = int.tryParse(value);
                      if (year == null) return 'Enter a valid year';
                      if (year < 2000 || year > DateTime.now().year + 1) {
                        return 'Year must be between 2000 and ${DateTime.now().year + 1}';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  AdminbuildTextField(
                    label: "Repairable Components (comma separated)",
                    controller: _componentsController,
                    maxLines: 2,
                    validator: (value) => value!.isEmpty ? 'Components are required' : null,
                  ),
                  const SizedBox(height: 15),
                  AdminbuildTextField(
                    label: "Common Issues (comma separated)",
                    controller: _issuesController,
                    maxLines: 2,
                    validator: (value) => value!.isEmpty ? 'Issues are required' : null,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          backgroundColor: Colors.grey[300],
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          backgroundColor: const Color.fromARGB(255, 85, 105, 53),
                        ),
                        onPressed: provider.isLoading ? null : () async {
                          if (_formKey.currentState!.validate()) {
                            final success = await _submitForm();
                            if (success) {
                              Navigator.pop(context, true);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    provider.error ?? 'Failed to update device',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            }
                          }
                        },
                        child: provider.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                "Save Changes",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}