import 'dart:developer';
import 'package:flutter/material.dart';

class Booking {
  final String? id;
  final String? addressId;
  final String? deviceId;
  final String? serviceId;
  final String? technicianId;
  final String? issue;
  final String? status;
  final String? customerName;
  final String? serviceName;
  final String? deviceName;
  final DateTime? createdAt;
  final double? amount;

  Booking({
    this.id,
    this.addressId,
    this.deviceId,
    this.serviceId,
    this.technicianId,
    this.issue,
    this.status,
    this.customerName,
    this.serviceName,
    this.deviceName,
    this.createdAt,
    this.amount,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    final status = json['bookingStatus'] ?? json['status'] ?? 'Unknown';
    final amount = json['bookingCostDetails']?['totalBookingCost']?.toDouble() ??
        json['amount']?.toDouble() ??
        0.0;
    if (amount == 0.0 && json['bookingCostDetails']?['totalBookingCost'] == null) {
      log('Warning: Amount missing for booking ID ${json['bookingID'] ?? 'unknown'}');
    }
    return Booking(
      id: json['bookingID'] ?? json['id'] ?? '',
      addressId: json['addressID'] ?? json['addressId'] ?? '',
      deviceId: json['deviceID'] ?? json['deviceId'] ?? '',
      serviceId: json['serviceID'] ?? json['serviceId'] ?? '',
      technicianId: json['technicianID'] ?? json['technicianId'] ?? '',
      issue: json['issue'] ?? json['problemDescription'] ?? 'Unknown',
      status: status,
      customerName: json['customerName'] ?? json['customer']?['name'] ?? 'Unknown',
      serviceName: json['serviceName'] ?? json['service'] ?? 'Unknown',
      deviceName: json['deviceName'] ?? json['device'] ?? 'Unknown',
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      amount: amount,
    );
  }

  Color get statusColor {
    switch (status) {
      case 'Completed':
        return const Color(0xFF4CAF50);
      case 'Assigned':
      case 'InProgress':
      case 'Accepted':
      case 'Reached':
      case 'Started':
        return const Color(0xFFFFA726);
      case 'Rejected':
      case 'Reassigned':
        return const Color(0xFFF44336);
      default:
        log('Unknown status: $status, using default color');
        return const Color(0xFF61DAFB);
    }
  }
}