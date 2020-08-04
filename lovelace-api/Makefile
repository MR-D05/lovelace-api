all:    ./src/*
	cp -r src/* build
	cd build && gnatmake -P ./lovelace_api.gpr
	cp build/lovelace_api bin

run:    all
	cd bin && ./lovelace_api

clean:
	cd build && rm -f *.ali *.o b__* *.bexch

install:
	mkdir -p /usr/local/share/lovelace_api/bin
	cp -r bin /usr/local/share/lovelace_api
	rm -f /usr/local/bin/lovelace_api
	cp bin/lovelace_api.service /etc/systemd/system
	systemctl daemon-reload
	systemctl enable lovelace_api
	systemctl start lovelace_api

uninstall:
	systemctl stop lovelace_api | true
	systemctl disable lovelace_api
	systemctl daemon-reload
	rm -f /etc/systemd/system/lovelace_api.service
	rm -f /usr/local/bin/lovelace_api
	rm -rf /usr/local/share/lovelace_api
	rm -f /var/run/lovelace_api
