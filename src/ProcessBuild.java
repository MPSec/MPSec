public class ProcessBuild {

	private static final int PLAY = 1, STOP = 2;

	public static void startProcess(int type) {
		String command[];
		
		if(type == PLAY) {
			command = getPlayCommand();
		}else {
			command = getStopCommand();
		}
		
		ProcessBuilder builder = new ProcessBuilder(command);
		builder.redirectError();
		builder.redirectInput(ProcessBuilder.Redirect.INHERIT);
		builder.redirectOutput(ProcessBuilder.Redirect.INHERIT);
		
		try {
			Process process = builder.start();
			process.waitFor();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String[] getPlayCommand() {
		final String path = "C:\\Temp\\mosquitto-1.4.14\\build\\client\\Release\\mosquitto_sub.exe";
		String command[] = { "cmd.exe", "/c", "start", "\"Sub" + "\"", "cmd.exe", "/c", path, "-t", "-F" };
		return command;
	}
	
	public static String[] getStopCommand() {
		final String path = "C:\\Temp\\mosquitto-1.4.14\\build\\client\\Release\\mosquitto_sub.exe";
		String command[] = { "cmd.exe", "/c", "start", "\"Sub" + "\"", "cmd.exe", "/c", path, "-t", "-F" };
		return command;
	}
}