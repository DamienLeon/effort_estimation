import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/provider_data_secondary/secondary_notifiers.dart';

// FP Input providers
final externalInputProvider =
    ChangeNotifierProvider<ExternalInputData>((ref) => ExternalInputData());

final externalOutputProvider =
    ChangeNotifierProvider<ExternalOutputData>((ref) => ExternalOutputData());

final externalInquiryProvider =
    ChangeNotifierProvider<ExternalInquiryData>((ref) => ExternalInquiryData());

final externalInterfaceFileProvider =
    ChangeNotifierProvider<ExternalInterfaceFileData>(
        (ref) => ExternalInterfaceFileData());

final internalLogicalFileProvider =
    ChangeNotifierProvider<InternalLogicalFileData>(
        (ref) => InternalLogicalFileData());

final projectComplexityDataProvider =
    ChangeNotifierProvider<ProjectComplexityData>(
        (ref) => ProjectComplexityData());

final complexityFactorsDataProvider =
    ChangeNotifierProvider<ComplexityFactorsData>(
        (ref) => ComplexityFactorsData());
