param($name)

keytool -genkey -v -keystore "$name.keystore" -alias "$name" -keyalg RSA -keysize 2048 -validity 10000
