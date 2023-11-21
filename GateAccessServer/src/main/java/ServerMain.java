import io.javalin.Javalin;

public class ServerMain {
    private final Javalin server;

    public ServerMain() {
        server = Javalin.create(config -> {
            config.defaultContentType = "application/json";
        });

        this.server.get("/open", context -> ApiHandler.getNumberPlate(context));
    }

    public static void main(String[] args) {
        ServerMain server = new ServerMain();
        server.start(5000);
    }

    public void start(int port) {
        this.server.start(port);
    }

    public void stop() {
        this.server.stop();
    }

}