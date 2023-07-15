//Base Url
const  String baseUrl = '';

//AUTH Collection
//post
const  String loginUser = '/auth/login';
const  String createUser = '/auth/register';
const  String sendOTPApi = '/auth/send-otp';
//get
const  String getProfile = '/auth/me';
const  String updateProfile = '/auth/profile/update';
const  String logoutUser = '/auth/logout';

//Packages Collection
//get
const  String getAllPackagesApi = '/trainee/packages';
const  String packageDetails = '/trainee/packages/{id}';

//TrainingSessionTrainees
//get
const  String getAllReservations = '/trainee/sessions/reservations';
const  String getReservationDetails = '/trainee/sessions/reservations/{id}';
//put
const  String updateReservation = '/trainee/sessions/reservations/{id}';
//post
const  String postReserve = '/trainee/sessions/reservations';

//Partners
//post
const  String checkPartner = '/trainee/partners/check-code';

//TrainingSession
//get
const  String getAllTrainingSession = '/trainee/training-sessions';
const  String getTrainDetails = '/trainee/training-sessions/{id}';