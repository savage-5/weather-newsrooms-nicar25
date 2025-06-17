# SOURCE_URL:="https://api.weather.gov/alerts/active?status=actual&area=CA&code=HWW"
SOURCE_URL:="https://api.weather.gov/alerts/active?status=actual&area=ILC007,ILC011,ILC037,ILC089,ILC099,ILC103,ILC111,ILC141,ILC177,ILC201,ILC031"

all: clean download slack

download:
	-mkdir tmp
	wget --continue --progress=dot:mega --waitretry=60 ${SOURCE_URL} \
		--header='accept: application/geo+json' \
		--header='User-Agent: (wnij.org, jsavage2@niu.edu)' \
		-O tmp/download.json

warnings:
	node warnings.js

slack:
	node warnings-slack.js

clean:
	-rm ./tmp/download.json
