<%@ page language="java" import= "java.io.*, java.util.*, java.net.* "
   contentType="text/html;charset=EUC-KR" session="false" %>
   <%!   String my_client_ip = null; %>
<%

try {


  boolean isLoopBack = true;
  Enumeration<NetworkInterface> en;
  en = NetworkInterface.getNetworkInterfaces();

  while(en.hasMoreElements()) {
    NetworkInterface ni = en.nextElement();
    if (ni.isLoopback())
      continue;

    Enumeration<InetAddress> inetAddresses = ni.getInetAddresses();
    while(inetAddresses.hasMoreElements()) {
      InetAddress ia = inetAddresses.nextElement();
      if (ia.getHostAddress() != null && ia.getHostAddress().indexOf(".") != -1) {
        my_client_ip = ia.getHostAddress();
        System.out.println(my_client_ip);
        isLoopBack = false;
        break;
      }
    }
    if (!isLoopBack)
      break;
  }

  StringBuffer sb = new StringBuffer();
   sb.append("http://");
   sb.append(my_client_ip);
   sb.append("/test1.webm");

   my_client_ip = sb.toString();
%>
   <%= my_client_ip %>
<%
} catch (SocketException e) {
  e.printStackTrace();
}

%>
