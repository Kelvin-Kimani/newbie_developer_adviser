% web app facts
client_side_language(js).
client_side_language(html5).
client_side_language(css3).
easier_to_build_using(software,framework).
client_side_framework(angular, js).
client_side_framework(vue, js).
client_side_framework(react, js).
client_side_framework(bootstrap, css3).
server_side_language(python).
server_side_language(js).
server_side_language(java).
server_side_language(php).
server_side_framework(flask, python).
server_side_framework(django, python).
server_side_framework(cake, php).
server_side_framework(laravel, php).
server_side_framework(yii, php).
server_side_framework(spark, java).
server_side_framework(spring, java).
server_side_framework(grails, java).
server_side_framework(express, js).
server_side_framework(loopback, js).
lightweight_framework(flask, python).
heavyweight_framework(django, python).
executes_faster_on(software,optimized_runtime_environment).
optimized_runtime_environment(nodejs, js).
optimized_runtime_environment(jvm, java).


% mobile app facts
mobile_app_framework(xamarin).
mobile_app_framework(flutter).
uses_language(xamarin,c_sharp).
uses_langauge(flutter,dart).
uses_ide(xamarin,xamarin_studio).
uses_ide(flutter,android_studio_ide).


%desktop app facts
desktop_app_language(java).
desktop_app_language(c_sharp).
desktop_app_language(python).
uses(java,netbeans).
uses(java, eclipse_IDE).
uses(c_sharp, visual_studio_IDE).
uses('c++', visual_studio_IDE).
uses(python, pycharm_IDE).

% database facts
database(mysql).
database(postgresql).
database(sqlite).
make_it_easy_to_interact_with('ORMs',databases).
use(software_program, databases).
software_db(mobile_apps, sqlite).
orm(java,hibernate_ORM).
orm(python, sqlalchemy_ORM).
orm('C++', odb_ORM).
orm('C#', entity_ORM).

%general facts
client_side.
server_side.


% rules
web_app :- client_side, server_side. 

%UI
check_web_app :- write('Does your application have a client side?'), nl, 
				 read(Client_side), Client_side=yes, nl, nl, 
				 write('Does your application have a server side?'), nl, 
				 read(Server_side), Server_side=yes, nl, 
				 write('Your application is a web application!'), nl.

check_web_app :- nl, write('Sorry, your application is not a web application. Check if it is a stand alone.'),nl.

				 





