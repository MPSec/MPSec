<%@ page language="java" import= "java.io.*, java.util.*, java.net.* "
   contentType="text/html;charset=EUC-KR" session="false" %>

<%
try {
    String path = "/home/user/tomcat8/webapps/ROOT/dashboard/ipsec-sh/packet.txt";

    //파일 객체 생성
    File file = new File(path);
    //입력 스트림 생성
    FileReader filereader = new FileReader(file);
    //입력 버퍼 생성
    BufferedReader bufReader = new BufferedReader(filereader);
    String line = "";
    while((line = bufReader.readLine()) != null){
%>
    <%= line %>
<%
    }

    //.readLine()은 끝에 개행문자를 읽지 않는다.
    bufReader.close();

}catch (FileNotFoundException e) {
    System.out.println(e);
}catch(IOException e){
    System.out.println(e);
}

%>
