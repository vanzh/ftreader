
class BaseImg{
  static final String BaseBookImg = "https://imgapi.jiaston.com/BookFiles/BookImages/";
  static String getUrl(String bookImg){
    return BaseBookImg + bookImg;
  }
}