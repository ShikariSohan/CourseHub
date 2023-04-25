package sohan.mongodbtutorial.utils;

public class StringArrays {
    private String[] departments = {"CSE", "SWE", "ANP", "PSS", "EEE", "ENG", "MAT", "STA", "IPE", "FES",
            "GEB", "BMB", "PME", "BNG", "CEE", "FET", "BBA", "MEE", "ARC", "CHE",
            "PHY", "GEE", "GEE", "OCG", "SOC", "SCW", "PAD", "ECO"};

    public String[] getDepartments() {
        return departments;
    }

    public static String getRandomColor() {
        String[] colors = {"blue", "deep-orange", "purple", "amber", "blue-grey", "green"};
        int index = (int) (Math.random() * colors.length);
        return colors[index];
    }

}
