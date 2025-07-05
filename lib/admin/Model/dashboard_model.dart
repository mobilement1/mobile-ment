// lib/admin/Model/dashboard_model.dart

class AdminDashboardMetrics {
  final double totalRevenue;
  final double totalProfit;
  final int activeTechnicians;
  final int totalCompletedBookings;
  final List<MonthlyRevenue> revenueChartData;
  final List<PopularService> popularChartData;
  final TodayBookingCounts todayBookingCounts;

  AdminDashboardMetrics({
    required this.totalRevenue,
    required this.totalProfit,
    required this.activeTechnicians,
    required this.totalCompletedBookings,
    required this.revenueChartData,
    required this.popularChartData,
    required this.todayBookingCounts,
  });

  factory AdminDashboardMetrics.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};
    
    return AdminDashboardMetrics(
      totalRevenue: (data['totalRevenue'] as num?)?.toDouble() ?? 0.0,
      totalProfit: (data['totalProfit'] as num?)?.toDouble() ?? 0.0,
      activeTechnicians: (data['activeTechnicians'] as int?) ?? 0,
      totalCompletedBookings: (data['totalCompletedBookings'] as int?) ?? 0,
      revenueChartData: (data['revenueChartData'] as List?)
          ?.map((e) => MonthlyRevenue.fromJson(e))
          .toList() ?? [],
      popularChartData: (data['popularChartData'] as List?)
          ?.map((e) => PopularService.fromJson(e))
          .toList() ?? [],
      todayBookingCounts: TodayBookingCounts.fromJson(
          data['todayBookingCounts'] ?? {}),
    );
  }
}

class MonthlyRevenue {
  final String month;
  final double revenue;
  final double expense;

  MonthlyRevenue({
    required this.month,
    required this.revenue,
    required this.expense,
  });

  factory MonthlyRevenue.fromJson(Map<String, dynamic> json) {
    return MonthlyRevenue(
      month: json['month'] as String? ?? '',
      revenue: (json['revenue'] as num?)?.toDouble() ?? 0.0,
      expense: (json['expense'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class PopularService {
  final String type;
  final int count;

  PopularService({
    required this.type,
    required this.count,
  });

  factory PopularService.fromJson(Map<String, dynamic> json) {
    return PopularService(
      type: json['type'] as String? ?? '',
      count: (json['count'] as int?) ?? 0,
    );
  }
}

class TodayBookingCounts {
  final int accepted;
  final int rejected;
  final int completed;
  final int inProgress;

  TodayBookingCounts({
    required this.accepted,
    required this.rejected,
    required this.completed,
    required this.inProgress,
  });

  factory TodayBookingCounts.fromJson(Map<String, dynamic> json) {
    return TodayBookingCounts(
      accepted: (json['accepted'] as int?) ?? 0,
      rejected: (json['rejected'] as int?) ?? 0,
      completed: (json['completed'] as int?) ?? 0,
      inProgress: (json['inProgress'] as int?) ?? 0,
    );
  }
}