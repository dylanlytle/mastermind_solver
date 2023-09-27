import 'package:mastermind_solver/src/features/solver/domain/solver.dart';

class SolverState {
  SolverState({this.solver});
  Solver? solver = Solver(guesses: [], onlyOneOfEachColor: false);

  SolverState copyWith({
    required Solver solver,
  }) {
    return SolverState(solver: solver);
  }

  @override
  String toString() => 'SolverState(value: $solver)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SolverState && other.solver == solver;
  }

  @override
  int get hashCode => solver.hashCode;
}
