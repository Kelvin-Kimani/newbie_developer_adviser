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
mobile_app_os(android).
mobile_app_os(iOS).

tools_for_mobile_os(android, 'Android Studio IDE').
tools_for_mobile_os(android, 'Java programming language').
tools_for_mobile_os(android, 'Kotlin programming language').

tools_for_mobile_os(ios, 'Visual Studio IDE').
tools_for_mobile_os(ios, 'Swift programming language').

tools_for_mobile_os(both, 'Xamarin Framework which uses C# programming language').
tools_for_mobile_os(both, 'Flutter Framework which uses Dart programming language').

mobile_app_framework(xamarin).
mobile_app_framework(flutter).
mobile_app_language('C#', xamarin).
mobile_app_language(dart, flutter).
mobile_app_ide(xamarin_studio, xamarin).
mobile_app_ide(android_studio_ide, flutter).


% desktop app facts
desktop_app_language(java).
desktop_app_language('C#').
desktop_app_language('C++').
desktop_app_language(python).
desktop_app_ide(java,netbeans).
desktop_app_ide(java, eclipse).
desktop_app_ide('C#', 'Visual Studio').
desktop_app_ide('C++', 'Visual Studio').
desktop_app_ide(python, 'PyCharm').

% database facts
database(mysql).
database(postgresql).
database(sqlite).
lightweight_db(sqlite).
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
mobile_app_db(X) :- database(X), lightweight_db(X).

%UI

% Determine kind of application
find_out_software :-
	write("Do you want to build a Web application? (y/n)"), nl,
	read(X), nl,
	X=y, building_web_app;

	write("Do you want to build a Mobile application? (y/n)"), nl,
	read(X), nl,
	X=y, building_mobile_app;

	write("Do you want to build a Desktop application? (y/n)"), nl,
	read(X), nl,
	X=y, building_desktop_app;

	write(">>> Sorry, cannot determine which classification your application falls under.").


building_web_app :-
	write("Which side are you building?"), nl,
	write("1. Client-side(default)"), nl,
	write("2. Server-side"), nl,
	write("3. Full-stack"), nl,

	read(C), web_app_side_choice(C).

	web_app_side_choice(C) :-
		C=:=3, write(">>> For full-stack use "), nl,
		list_client_side_languages,
		list_server_side_languages.

	web_app_side_choice(C) :-
		C=:=2, write(">>> For server-side use:"), nl,
		list_server_side_languages.

	web_app_side_choice(_C) :-
		list_client_side_languages.


list_server_side_languages:-
	forall(server_side_language(L), format("* ~t~w language,~n", L)),
	write(">>> Frameworks make development easier, hence use:"), nl,
	forall(server_side_framework(F, L),
	format("* ~t~s framework for ~s language~n", [F, L])).


list_client_side_languages:-
	write(">>> For client-side use:"), nl,
	forall(client_side_language(L), format("* ~t~w language,~n", L)),
	write(">>> Frameworks make development easier, hence use:~n"), nl,
	forall(client_side_framework(F, L),
	format("* ~t~s framework for ~s language~n", [F, L])).


building_mobile_app :-
	nl,
	write("Should it use a database? (y/n)"), nl,
	read(X), db_choice(X).
	db_choice(X) :- X=y, mobile_app_with_db.
	db_choice(_X) :- mobile_app_os.


building_desktop_app :-
	nl,
	write("Desktop apps can be built using:"), nl,
	forall(desktop_app_language(Z), format("* ~w\n", Z)),
	write("Which langauge would you want to use?"), nl,
	read(C), desktop_language_choice(C).
	
	desktop_language_choice(C) :-
		desktop_app_ide(C, IDE),
		format(">>> For ~w use ~w IDE", [C, IDE]).
	desktop_language_choice(_C) :- write("Could not determine which IDE to use for that language"), nl.


mobile_app_with_db :-
	write(">>> You should use ["),
	forall(mobile_app_db(Z), write(Z)),
	write("] as possible databases."), nl,
	write(">>> This is because mobile phones have smaller memory hence using a light-weight database is preferrable"), nl,
	mobile_app_os.


mobile_app_os :-
	nl,
	write("Which Mobile OS are you building an app for?"), nl,
	write("1. Android (default)"), nl,
	write("2. iOS"), nl,
	write("3. Both"), nl,
	read(C), os_choice(C).
	os_choice(C) :- C=:=3, write(">>> For both iOS and Android use "),
					forall(tools_for_mobile_os(both, Z), format("{~w} or ", Z)).
	os_choice(C) :- C=:=2, write(">>> For iOS use "),
					forall(tools_for_mobile_os(ios, Z), format("~w, ", Z)).
	os_choice(_C) :- write(">>> For Android use "),
					forall(tools_for_mobile_os(android, Z), format("~w, ", Z)).
		 





