
public class Debuger {
   private static final boolean debuger = true;

   public static void printError(Exception e) {
      if (debuger) {
         e.getStackTrace();
      }
   }

   public static void log(String className, String value) {
      if (debuger) {
         System.out.println(value + "  (" + className + ")");
      }
   }
}