
import 'package:apk_scanner/feature/apk_scanner/domain/entity/scan_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ApkScannerState extends Equatable {
  const ApkScannerState();

  @override
  List<Object?> get props => [];
}

class ApkScannerInitial extends ApkScannerState {}

class ApkScannerLoading extends ApkScannerState {}

class ApkScannerSuccess extends ApkScannerState {
  final ScanEntity scan;
  ApkScannerSuccess(this.scan);
   @override
  List<Object?> get props => [scan];
}

class ApkScannerFailureState extends ApkScannerState {
  final String message;
  ApkScannerFailureState(this.message);
   @override
  List<Object?> get props => [message];
}