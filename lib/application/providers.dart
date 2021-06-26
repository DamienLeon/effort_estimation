import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider_notifiers.dart';

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

// Effort Input Providers
final languageSelectedProvider = ChangeNotifierProvider<LanguageSelectedData>(
    (ref) => LanguageSelectedData());

final projectTypeProvider =
    ChangeNotifierProvider<ProjectTypeData>((ref) => ProjectTypeData());

// Attributes Providers
final productAttributesProvider = ChangeNotifierProvider<ProductAttributesData>(
    (ref) => ProductAttributesData());

final hardwareAttributesProvider =
    ChangeNotifierProvider<HardwareAttributesData>(
        (ref) => HardwareAttributesData());

final personalAttributesProvider =
    ChangeNotifierProvider<PersonalAttributesData>(
        (ref) => PersonalAttributesData());

final projectAttributesProvider = ChangeNotifierProvider<ProjectAttributesData>(
    (ref) => ProjectAttributesData());

// Result Providers
final functionPointsProvider =
    ChangeNotifierProvider<FunctionPointsData>((ref) => FunctionPointsData());

final effortProvider =
    ChangeNotifierProvider<EffortData>((ref) => EffortData());

final timeProvider = ChangeNotifierProvider<TimeData>((ref) => TimeData());
