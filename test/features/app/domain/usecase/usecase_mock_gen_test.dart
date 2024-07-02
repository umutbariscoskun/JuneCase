import 'package:mockito/annotations.dart';
import 'package:mutlumesaj/features/app/domain/repository/message_repository.dart';

// we need this for generating mocks
// After null safety we should use GenerateMocks for Mockito
// This generated Mock repository is a common repo so we can use it as repository.
@GenerateMocks([
  MessageRepository
], customMocks: [
  MockSpec<MessageRepository>(
      as: #FakeRepo, onMissingStub: OnMissingStub.throwException),
])
void main() {}
