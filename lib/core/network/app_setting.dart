//Base Url
const  String baseUrl = 'https://demo.nazclub.tech/api';
const  String baseUrlImage = 'https://demo.nazclub.tech';

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
const  String getReservationHistory = '/trainee/sessions/reservation/history';
//put
const  String cancelReservation = '/trainee/sessions/reservations/{id}';
//post
const  String makeNewReserve = '/trainee/sessions/reservations';

//Partners
//post
const  String checkPartner = '/trainee/partners/check-code';

//TrainingSession
//get
const  String getAllTrainingSession = '/trainee/training-sessions';
const  String getTrainDetails = '/trainee/training-sessions/{id}';

//gallary
//get
const  String getGalleriesApi = '/trainee/galleries';

//sliders
//get
const  String getSlidersApi = '/trainee/sliders';

//contact
const  String contactApi = '/trainee/contact-informations';