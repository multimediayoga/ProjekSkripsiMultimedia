
import 'package:kelolapps/config/kelolaku/constant.dart';

const BaseUrl = 'https://assets.iqonic.design/old-themeforest-images/prokit';


const quiz_ic_communication = "$BaseUrl/images/quiz/quiz_ic_communication.png";
const quiz_ic_communication2 = "$BaseUrl/images/quiz/quiz_ic_communication2.png";
const quiz_ic_course1 = "$BaseUrl/images/quiz/quiz_ic_course1.png";
const quiz_ic_course2 = "$BaseUrl/images/quiz/quiz_ic_course2.png";
const quiz_ic_course3 = "$BaseUrl/images/quiz/quiz_ic_course3.png";
const quiz_ic_info = "$BaseUrl/images/quiz/quiz_ic_info.png";
const quiz_ic_java = "$BaseUrl/images/quiz/quiz_ic_java.png";
const quiz_ic_marketing = "$BaseUrl/images/quiz/quiz_ic_marketing.png";
const quiz_ic_notification = "$BaseUrl/images/quiz/quiz_ic_notification.png";
const quiz_ic_study1 = "$BaseUrl/images/quiz/quiz_ic_study1.png";
const quiz_ic_study2 = "$BaseUrl/images/quiz/quiz_ic_study2.png";
const quiz_ic_quiz1 = "$EmployeeAsset/quiz_ic_quiz1.png";
const quiz_ic_quiz2 = "$EmployeeAsset/quiz_ic_quiz2.png";
const quiz_ic_quiz = "$EmployeeAsset/quiz_ic_quiz.svg";
const quiz_ic_homes = "$EmployeeAsset/quiz_ic_home.svg";
const quiz_ic_user = "$EmployeeAsset/quiz_ic_user.svg";
const quiz_ic_facebook = "$EmployeeAsset/quiz_ic_facebook.svg";
const quiz_ic_google = "$EmployeeAsset/quiz_ic_google.svg";
const quiz_ic_mail = "$EmployeeAsset/quiz_ic_mail.svg";
const quiz_ic_twitter = "$EmployeeAsset/quiz_ic_twitter.svg";

const Quiz_ic_Grid = "$EmployeeAsset/quiz_ic_grid.png";
const Quiz_ic_List = "$EmployeeAsset/quiz_ic_list.png";
const quiz_img_People1 = "$BaseUrl/images/quiz/quiz_img_People1.jpg";
const quiz_img_People2 = "$BaseUrl/images/quiz/quiz_img_People2.png";

const quiz_ic_list1 = "$EmployeeAsset/quiz_ic_list1.png";
const quiz_ic_list2 = "$EmployeeAsset/quiz_ic_list2.png";
const quiz_ic_list3 = "$EmployeeAsset/quiz_ic_list3.png";
const quiz_ic_list4 = "$EmployeeAsset/quiz_ic_list4.png";
const quiz_ic_list5 = "$EmployeeAsset/quiz_ic_list5.png";
const user_my_role = "$EmployeeAsset/quiz_ic_list5.png";

class EmployeeModel {
  var ownerName = "";
  var phoneNumber = "";
  var ownerProfile = "";
  List<String> roleStatus = getEmployeeRole();

}

List<String> getEmployeeRole(){
  List<String> storeEmployeeRole = [ShopRole.Cashier.name!, ShopRole.Marketing.name!];
  return storeEmployeeRole;
}

class QuizTestModel {
  var heading = "";
  var image = "";
  var description = "";
  var type = "";
  var status = "";
}

class QuizRecentSearchDataModel {
  var name = "";
}

class QuizBadgesModel {
  var title = "";
  var subtitle = "";
  var img = "";
}

class QuizScoresModel {
  var title = "";
  var totalQuiz = "";
  var img = "";
  var scores = "";
}

class QuizContactUsModel {
  var title = "";
  var subtitle = "";
}

EmployeeModel geMytUserData(){
  var userData = EmployeeModel();
  userData.ownerName = "Ardian Kolbu (Saya)";
  userData.phoneNumber = "081930128103";
  userData.ownerProfile = user_my_role;
  userData.roleStatus = [ShopRole.Owner.name!];

  return userData;
}

List<EmployeeModel> getQuizData() {
  List<EmployeeModel> list = [];
  EmployeeModel model1 = EmployeeModel();
  model1.ownerName = "Raden Roma";
  model1.phoneNumber = "081210003";
  model1.ownerProfile = quiz_ic_course1;
  model1.roleStatus = [ShopRole.Manager.name!, ShopRole.Marketing.name!];

  EmployeeModel model2 = EmployeeModel();
  model2.ownerName = "Ray Make";
  model2.phoneNumber = "081250003";
  model2.ownerProfile = quiz_ic_course2;

  EmployeeModel model3 = EmployeeModel();
  model3.ownerName = "Susan Pizzaro";
  model3.phoneNumber = "102552092";
  model3.ownerProfile = quiz_ic_course3;

  EmployeeModel model4 = EmployeeModel();
  model4.ownerName = "Barron";
  model4.phoneNumber = "879500192";
  model4.ownerProfile = quiz_ic_course1;

  list.add(model1);
  list.add(model3);
  list.add(model4);
  list.add(model2);

  return list;
}

List<QuizTestModel> quizGetData() {
  List<QuizTestModel> list = [];
  QuizTestModel model1 = QuizTestModel();
  model1.heading = "The Scientific Method";
  model1.image = quiz_ic_course1;
  model1.type = "Amy Yang";
  model1.description = "Let's put your memory on our first topic to test.";
  model1.status = "true";

  QuizTestModel model2 = QuizTestModel();
  model2.heading = "Introduction to Biology";
  model2.image = quiz_ic_course3;
  model2.type = "Flashcards";
  model2.description = "Complete the above test to unlock this one.";
  model2.status = "false";

  QuizTestModel model3 = QuizTestModel();
  model3.heading = "Controlled Experiments";
  model3.image = quiz_ic_course2;
  model3.type = "Quiz 2";
  model3.description = "Let's put your memory on our first topic to test.";
  model3.status = "false";

  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}

List<QuizBadgesModel> quizBadgesData() {
  List<QuizBadgesModel> list = [];
  QuizBadgesModel model1 = QuizBadgesModel();
  model1.title = "Achiever";
  model1.subtitle = "Complete an exercise";
  model1.img = quiz_ic_list2;

  QuizBadgesModel model2 = QuizBadgesModel();
  model2.title = "Perectionistf";
  model2.subtitle = "Finish All lesson of chapter";
  model2.img = quiz_ic_list5;

  QuizBadgesModel model3 = QuizBadgesModel();
  model3.title = "Scholar";
  model3.subtitle = "Study two Cources";
  model3.img = quiz_ic_list3;

  QuizBadgesModel model4 = QuizBadgesModel();
  model4.title = "Champion";
  model4.subtitle = "Finish #1 in Scoreboard";
  model4.img = quiz_ic_list4;

  QuizBadgesModel model5 = QuizBadgesModel();
  model5.title = "Focused";
  model5.subtitle = "Study every day for 30 days";
  model5.img = quiz_ic_list5;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);

  return list;
}

List<QuizScoresModel> quizScoresData() {
  List<QuizScoresModel> list = [];
  QuizScoresModel model1 = QuizScoresModel();
  model1.title = "Biology Basics";
  model1.totalQuiz = "20 Quiz";
  model1.img = quiz_ic_course1;
  model1.scores = "30/50";

  QuizScoresModel model2 = QuizScoresModel();
  model2.title = "Java Basics";
  model2.totalQuiz = "30 Quiz";
  model2.img = quiz_ic_course2;
  model2.scores = "30/50";

  QuizScoresModel model3 = QuizScoresModel();
  model3.title = "Art & Painting Basics";
  model3.totalQuiz = "10 Quiz";
  model3.img = quiz_ic_course3;
  model3.scores = "10/50";

  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}

List<QuizContactUsModel> quizContactUsData() {
  List<QuizContactUsModel> list = [];
  QuizContactUsModel model1 = QuizContactUsModel();
  model1.title = "Call Request";
  model1.subtitle = "+00 356 646 234";

  QuizContactUsModel model2 = QuizContactUsModel();
  model2.title = "Email";
  model2.subtitle = "Response within 24 business hours";

  list.add(model1);
  list.add(model2);

  return list;
}


enum ShopRole{
  Owner, Manager, Cashier, Marketing
}

extension ShopRoleExtension on ShopRole{
  String? get name{
    switch(this){
      case ShopRole.Owner:
        return 'Pemilik Toko';
      case ShopRole.Manager:
        return 'Manajer';
      case ShopRole.Cashier:
        return 'Karyawan';
      case ShopRole.Marketing:
        return 'Pemasaran';
    }
  }
}