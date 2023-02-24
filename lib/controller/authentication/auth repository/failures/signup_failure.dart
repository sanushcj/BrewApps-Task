class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = 'Unknown Error Please Check your Connection']);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a Strong Password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a Strong Password');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a Strong Password');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a Strong Password');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a Strong Password');

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
