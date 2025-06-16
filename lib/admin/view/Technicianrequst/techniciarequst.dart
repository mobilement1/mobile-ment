import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/controller/tech_rqst_provider.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/admin/view/Technicianrequst/reqst_widget.dart';
import 'package:mobile_servies/tech/widgets/shimmer.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:provider/provider.dart';

class Techniciarequstpage extends StatefulWidget {
  const Techniciarequstpage({super.key});

  @override
  _TechniciarequstpageState createState() => _TechniciarequstpageState();
}

class _TechniciarequstpageState extends State<Techniciarequstpage> {
  bool _hasFetched = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<TechnicianRequestProvider>();
      if (!provider.isLoading && provider.requests.isEmpty) {
        provider.fetchRequests();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    
    final GlobalKey _technicianRqstKey = GlobalKey();

    
const validStatuses = ['All', 'Pending', 'Approved', 'Rejected'];

    return Scaffold(
      body: Consumer<TechnicianRequestProvider>(
        builder: (context, provider, child) {
           if (provider.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(provider.errorMessage!),
                  backgroundColor: provider.errorMessage!.contains('Approved')?Colors.green :Colors.red,
                ),
              );
              provider.clearErrorMessage();
            });
          }

          
          if (!validStatuses.contains(provider.statusFilter)) {
            provider.setStatusFilter('All');
          }

          return Stack(
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLogo(),
                          const SizedBox(height: 24),
                          const Text(
                            "Technician Requests",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                          const Text(
                            "Manage bookings, services, devices, and technicians",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "All Requests",
                                key: _technicianRqstKey,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              DropdownButton<String>(
                                value: provider.statusFilter,
                                dropdownColor: const Color(0xFF718355),
                                style: const TextStyle(color: Colors.white, fontSize: 14),
                                items: validStatuses
                                    .map((String value) => DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value, style: const TextStyle(color: Colors.white)),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null && validStatuses.contains(value)) {
                                    provider.setStatusFilter(value);
                                    _hasFetched = false; 
                                  }
                                },
                                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                underline: Container(height: 1, color: Colors.white70),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              fillColor: Color(0xFF718355),
                              filled: true,
                              hintText: 'Search by name or phone',
                              hintStyle: TextStyle(color: Colors.white70),
                              prefixIcon: Icon(Icons.search, color: Colors.white70),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            onChanged: (value) {
                              provider.setSearchQuery(value);
                              _hasFetched = false;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: provider.isLoading
                              ? buildShimmerList()
                              : provider.requests.isEmpty
                                  ? Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 16),
                                          Text(
                                            'No Requests Found',
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: provider.requests.length,
                                      itemBuilder: (context, index) {
                                        final request = provider.requests[index];
                                        return buildTechnicianRequestCard(
                                          context: context,
                                          request: request,
                                          provider: provider,
                                        );
                                      },
                                    ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DraggableFabMenu(adminDashboardKey: _technicianRqstKey),
            ],
          );
        },
      ),
    );
  }
}