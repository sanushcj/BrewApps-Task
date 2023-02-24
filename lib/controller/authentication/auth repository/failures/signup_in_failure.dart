class SignUpandInWithEmailAndPasswordFailure {
  final String message;

  const SignUpandInWithEmailAndPasswordFailure(
      [this.message = 'Unknown Error Please Check your Connection']);

  factory SignUpandInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpandInWithEmailAndPasswordFailure(
            'Please enter a Strong Password');
      case 'invalid-email':
        return const SignUpandInWithEmailAndPasswordFailure(
            'Please enter a Strong Password');
      case 'email-already-in-use':
        return const SignUpandInWithEmailAndPasswordFailure(
            'Please enter a Strong Password');
      case 'operation-not-allowed':
        return const SignUpandInWithEmailAndPasswordFailure(
            'Please enter a Strong Password');
      case 'user-disabled':
        return const SignUpandInWithEmailAndPasswordFailure(
            'Please enter a Strong Password');

      default:
        return const SignUpandInWithEmailAndPasswordFailure();
    }
  }
}
