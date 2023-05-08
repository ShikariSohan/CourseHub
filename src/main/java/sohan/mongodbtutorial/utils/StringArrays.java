package sohan.mongodbtutorial.utils;

/**
 * A utility class that provides an array of department names and a random
 * color.
 */
public class StringArrays {

    private String[] departments = { "CSE", "SWE", "ANP", "PSS", "EEE", "ENG", "MAT", "STA", "IPE", "FES",
            "GEB", "BMB", "PME", "BNG", "CEE", "FET", "BBA", "MEE", "ARC", "CHE",
            "PHY", "GEE", "GEE", "OCG", "SOC", "SCW", "PAD", "ECO" };

    /**
     * Returns an array of department names.
     *
     * @return an array of department names
     */
    public String[] getDepartments() {
        return departments;
    }

    /**
     * Returns a random color from a predefined list of colors.
     *
     * @return a random color
     */
    public static String getRandomColor() {
        String[] colors = { "blue", "deep-orange", "purple", "amber", "blue-grey", "green" };
        int index = (int) (Math.random() * colors.length);
        return colors[index];
    }

}
