<%@ page language="java" import= "java.io.*, java.util.*"
   contentType="text/html;charset=EUC-KR" session="false" %>

<html>
<%
    String path = "/home/tomcat8/webapps/ROOT/MPSec/etri-jsp-sh/ifdown-lo.sh";
    String bashCommand[] = {"ls", "-al"}; // bash 명령어
    String scriptCommand[] = {"sh", path}; //shell script 실행

    int lineCount = 0;
    String line="";

    ProcessBuilder builder = new ProcessBuilder(bashCommand);
    Process childProcess = null;

    try{
        childProcess = builder.start();

      BufferedReader br =
            new BufferedReader(
                    new InputStreamReader(
                          new SequenceInputStream(childProcess.getInputStream(), childProcess.getErrorStream())));

      while((line = br.readLine()) != null){
%>
    <%=line%><br> <!-- 결과 화면에 뿌리기... -->
<%
      }
      br.close();

   }catch(IOException ie){
      ie.printStackTrace();
   }catch(Exception e){
      e.printStackTrace();
   }
%>
</html>
