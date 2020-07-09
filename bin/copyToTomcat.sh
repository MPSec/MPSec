userName="user"

mkdir /home/$userName/tomcat8/webapps/ROOT/dashboard
cd ../
cp -r * /home/$userName/tomcat8/webapps/ROOT/dashboard/.
vim ./WebContent/index.html