
run_gen_icons_splash:
	fvm flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml
	fvm flutter pub run icons_launcher:create --path flutter_icons_launcher.yaml

run_connect_phone:
	adb tcpip 5555
	adb connect 192.168.0.103:5555

run_remove_app:
	adb uninstall br.com.gen.desafio_gen

run_rename_app:
	fvm flutter pub global run rename --appname $(--name)