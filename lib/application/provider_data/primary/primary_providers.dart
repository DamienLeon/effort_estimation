import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/provider_data/primary/primary_notifiers.dart';

final projectNameProvider = ChangeNotifierProvider<ProjectNameTextFieldData>(
    (ref) => ProjectNameTextFieldData());

final projectsListProvider =
    ChangeNotifierProvider<ProjectsScreenData>((ref) => ProjectsScreenData());

final currentProjectProvider =
    ChangeNotifierProvider<CurrentProjectSelectedData>(
        (ref) => CurrentProjectSelectedData());

final blockNameProvider = ChangeNotifierProvider<BlockNameTextFieldData>(
    (ref) => BlockNameTextFieldData());

final blocksListProvider =
    ChangeNotifierProvider<BlockListData>((ref) => BlockListData());
