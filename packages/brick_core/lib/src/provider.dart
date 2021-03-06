import 'package:brick_core/src/model_dictionary.dart';
import 'package:brick_core/src/model_repository.dart';
import 'package:brick_core/src/query/query.dart';
import 'package:brick_core/src/model.dart';

/// A [Provider] fetches raw data and creates [Model]s. An app can have many [Provider]s.
abstract class Provider<_Model extends Model> {
  /// The translation between [Adapter]s and [Model]s
  ModelDictionary get modelDictionary;

  const Provider();

  /// Remove a model instance
  delete<T extends _Model>(T instance, {Query query, ModelRepository<_Model> repository});

  /// Whether a model instance is present. `null` is returned when existence is unknown.
  /// The model instance is not hydrated in the function output; a `bool` variant
  /// (e.g. `List<bool>`, `Map<_Model, bool>`) should be returned.
  exists<T extends _Model>({Query query, ModelRepository<_Model> repository}) => null;

  /// Query for raw data and construct it with an [Adapter]
  get<T extends _Model>({Query query, ModelRepository<_Model> repository});

  /// Insert or update a model instance
  upsert<T extends _Model>(T instance, {Query query, ModelRepository<_Model> repository});
}
