
import 'package:mastermind_solver/src/features/solver/domain/guess.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 2. add a part file
part 'guesses_provider.g.dart';

// 3. use the @riverpod annotation
@riverpod
// 4. update the declaration
Guess guess(GuessRef ref) {
  return Guess();
}