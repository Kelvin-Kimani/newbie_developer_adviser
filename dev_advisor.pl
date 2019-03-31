% kinds of software programs
software_program(web_apps).
software_program(mobile_apps).
software_program(desktop_apps).
easier_to_build_using(software_program,framework).

% web app facts
client_side_language(js).
client_side_language(html5).
client_side_language(css3).
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
mobile_app_os(android).
mobile_app_os(iOS).
mobile_app_framework(xamarin).
mobile_app_framework(flutter).
mobile_app_language('C#', xamarin).
mobile_app_language(dart, flutter).
mobile_app_ide(xamarin_studio, xamarin).
mobile_app_ide(android_studio_ide, flutter).
mobile_app_db(sqlite).


% desktop app facts
desktop_app_language(java).
desktop_app_language('C#').
desktop_app_language(python).
desktop_app_ide(java,netbeans).
desktop_app_ide(java, eclipse_IDE).
desktop_app_ide('C#', visual_studio_IDE).
desktop_app_ide('C++', visual_studio_IDE).
desktop_app_ide(python, pycharm_IDE).

% database facts
database(mysql).
database(postgresql).
database(sqlite).
make_it_easy_to_interact_with('ORMs',databases).
use(software_program, databases).
database(mobile_apps, sqlite).
orm(java,hibernate_ORM).
orm(python, sqlalchemy_ORM).
orm('C++', odb_ORM).
orm('C#', entity_ORM).

%general facts
client_side.
server_side.
standalone.


% rules
web_app :- client_side, server_side. 

%UI
start :- write('Welcome to software development. Software programs are written programs or procedures or rules and associated documentation pertaining to the operation of a computer system.'), nl, 
		 write('Check for tools to use for different software programs. Select the software program you want to explore.'), nl,
		 write('1. Web Applications'), nl,
		 write('2. Mobile Applications'), nl,
		 write('3. Desktop Applications'), nl,
		 write('4. Desktop Applications'), nl,
		 read(Program_choice), program_type(Program_choice).

program_type(Program_choice) :- Program_choice=:=1, nl, check_web_app, web_app_tools.
program_type(Program_choice) :- Program_choice=:=2, nl, mobile_app_os, mobile_apps, mobile_app_tools, mobile_app_db.
program_type(Program_choice) :- Program_choice=:=3, nl, desktop_app_tools.
program_type(Program_choice) :- Program_choice=:=4, nl, popular_databases.


check_software_programs :- write('Software programs include: '), nl, forall(software_program(X), writeln((X))).

check_web_app :- write('Does your application have a client side?'), nl, 
				 read(Client_side), Client_side=yes, nl, nl, 
				 write('Does your application have a server side?'), nl, 
				 read(Server_side), Server_side=yes, nl, 
				 write('Your application is a web application!'), nl.

check_web_app :- nl, write('Sorry, your application is not a web application. Check if it is a stand alone.'),nl.

web_app_tools :- nl, write('Explore the set of tools to build a web application. There are:'),nl,
						write('1. Client Side Tools'), nl, 
						write('2. Server Side Tools'), nl, 
						read(Choice), web_app_type(Choice).
						web_app_type(Choice) :- Choice=:=1, nl, write('Client Side tools can be divided into; '), nl, 
												write('1. Language'), nl,
												write('2. Framework'), nl,
												read(Tool_Choice), client_tool_type(Tool_Choice).
												client_tool_type(Tool_Choice) :- Tool_Choice=:=1, nl, write('Here is a list of languages'), nl, forall(client_side_language(X), writeln((X))).
												client_tool_type(Tool_Choice) :- Tool_Choice=:=2, nl, write('Here is a list of framework and the languages they support'), nl, forall(client_side_framework(X, Y), writeln((X, Y))).

						web_app_type(Choice) :- Choice=:=2, nl, write('Server Side tools can be divided into; '), nl, 
												write('1. Language'), nl,
												write('2. Framework'), nl,
												write('3. Runtime Environments'), nl,
												read(Tool_Choice), server_tool_type(Tool_Choice).
												server_tool_type(Tool_Choice) :- Tool_Choice=:=1, nl, write('Here is a list of languages'), nl, forall(server_side_language(X), writeln((X))).
												server_tool_type(Tool_Choice) :- Tool_Choice=:=2, nl, write('Here is a list of framework and the languages they support'), nl, forall(server_side_framework(X, Y), writeln((X, Y))).
												server_tool_type(Tool_Choice) :- Tool_Choice=:=3, nl, write('Here is a list of optimized runtime environments and the languages they support'), nl, forall(server_side_framework(X, Y), writeln((X, Y))).


mobile_app_os :- nl, write('Mobile Applications runs on two platforms mainly '), nl, forall(mobile_app_os(X), writeln((X))).

mobile_apps :- nl, write('Mobile Applications can be:'), nl, 
				write('1. Stand Alone'), nl, 
				write('2. Clients'), nl,
				write('Which one do you wish to explore?'), nl,
				read(Choice), nl, app_type(Choice).
				app_type(Choice) :- Choice=:=1, nl, 
									write('These apps have everything bundled within them. They do not require constant network connectivity to download and process the data.'), nl.
				app_type(Choice) :- Choice=:=2, nl,
									 write('These apps act as a client to provide a front-end to another application running on a server somewhere.'), nl.

mobile_app_tools :- nl, write('Explore the set of tools to build a mobile application. There are: '), nl,
						write('1. Frameworks'), nl, 
						write('2. IDE\'s'), nl, 
						write('3. Languages'), nl,
						read(Choice), nl, tool_type(Choice).
						tool_type(Choice) :- Choice=:=1, nl, write('Here is a list of mobile frameworks'), nl, forall(mobile_app_framework(X), writeln((X))).
						tool_type(Choice) :- Choice=:=2, nl, write('Here is a list of IDE\'s'), nl, forall(mobile_app_ide(X, Y), writeln((X, Y))).
						tool_type(Choice) :- Choice=:=3, nl, write('Here is a list of Languages'), nl, forall(mobile_app_language(X, Y), writeln((X, Y))).

mobile_app_database :- nl, write('Mobile Applications strictly use SQLite database.'),nl.

desktop_app_tools :- nl, write('Explore the set of tools to build a desktop application. There are: '), nl, 
						write('1. Languages'), nl, 
						write('2. IDE\'s'), nl,
						read(Choice), nl, desktop_tool_type(Choice).
						desktop_tool_type(Choice) :- Choice=:=1, nl, write('Here is a list of Languages'), nl, forall(desktop_app_language(X), writeln((X))).
						desktop_tool_type(Choice) :- Choice=:=2, nl, write('Here is a list of IDE\'s'), nl, forall(desktop_app_ide(X, Y), writeln((X, Y))).

popular_databases :- nl, write('The most common databases include: '), nl, forall(database(X), writeln((X))), nl, 
						write('Databases use Object Relation Mapping(ORMs) to make coding easer. Here is a list of popular languages and their ORMs'), nl, forall(orm(X,Y), writeln((X,Y))).










				 





