<%@ page language="java" import= "java.io.*, java.util.*"
   contentType="text/html;charset=EUC-KR" session="false" %>

<html>
<%
    String param = request.getParameter("interfaceName");
    String path = "/home/tomcat8/webapps/ROOT/MPSec/etri-jsp-sh/ifdown.sh";
    String bashCommand[] = {"pwd"}; // bash 명령어
    String scriptCommand[] = {"sh", path, param}; //shell script 실행

    int lineCount = 0;
    String line="";

    ProcessBuilder builder = new ProcessBuilder(scriptCommand);
    Process childProcess = null;

    try{
        childProcess = builder.start();

      BufferedReader br =
            new BufferedReader(
                    new InputStreamReader(
                          new SequenceInputStream(childProcess.getInputStream(), childProcess.getErrorStream())));

      while((line = br.readLine()) != null){
%>
    <%=line%><br>
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
