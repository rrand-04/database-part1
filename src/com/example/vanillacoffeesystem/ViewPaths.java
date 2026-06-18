package com.example.vanillacoffeesystem;

public final class ViewPaths {

    private static final String BASE = "/com/example/vanillacoffeesystem/views/";

    private ViewPaths() {
    }

    public static String fxml(String fileName) {
        return BASE + fileName;
    }
}
