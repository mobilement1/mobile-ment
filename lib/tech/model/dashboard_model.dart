class DashboardModelData {
  final double totalRevenue;
  final int completedBookings;
  final int assignedBookings;
  final int inProgressBookings;
  final List<Map<String, dynamic>> chartData;

  DashboardModelData({
    required this.totalRevenue,
    required this.completedBookings,
    required this.assignedBookings,
    required this.inProgressBookings,
    required this.chartData,
  });

  factory DashboardModelData.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};
    final technicianServiceCounts = data['technicianServiceCounts'] as Map<String, dynamic>? ?? {};
    final rawChartData = data['technicianRevenueChartData'] as List<dynamic>? ?? [];
    final chartData = rawChartData.map((e) => Map<String, dynamic>.from(e)).toList();

    return DashboardModelData(
      totalRevenue: (data['totalRevenue'] as num?)?.toDouble() ?? 0.0,
      completedBookings: technicianServiceCounts['completed'] as int? ?? 0,
      assignedBookings: technicianServiceCounts['assigned'] as int? ?? 0,
      inProgressBookings: technicianServiceCounts['inProgress'] as int? ?? 0,
      chartData: chartData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'totalRevenue': totalRevenue,
        'technicianServiceCounts': {
          'completed': completedBookings,
          'assigned': assignedBookings,
          'inProgress': inProgressBookings,
        },
        'technicianRevenueChartData': chartData,
      },
    };
  }
}