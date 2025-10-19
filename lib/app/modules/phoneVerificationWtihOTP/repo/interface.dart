
abstract class OTPRepositoryInterface {
  Future otpSend(String mobileNumber);

  Future verifyOTP(String mobileNumber, String otp);

}
