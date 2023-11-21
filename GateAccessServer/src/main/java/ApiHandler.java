import io.javalin.http.Context;



public class ApiHandler {

//    private static final accesDB database = new DBconnect();

    public static void getNumberPlate(Context context) {
        DBconnect dbconn = new DBconnect();
        String numberPlate = context.pathParamAsClass("NumberPlate", String.class).get();
//        Number number = database.get(numberPlate);
        context.json(dbconn.get(numberPlate));


    }
}
