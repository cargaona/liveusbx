SHELL := /bin/bash

LINUX_LIVE_PATH = /tmp/linux-live

build:
	vagrant provision

start-machine:
	vagrant up

install: start-machine install-linux-live-kit create-files 
	vagrant ssh --command "cd /tmp/ && sudo ./gen_ubuntu-i3wm_zip.sh" && \
		mkdir usb && sudo mount ${USB_PATH} usb && \
		sudo unzip ${PWD}/tmp/ubuntu-i3wm-x86_64.zip -d usb/ && \
		cd ./usb/ubuntu-i3wm/boot/ && sudo ./bootinst.sh && \
		sudo umount ${PWD}/usb && rf -rm ${PWD}/usb

cleanup:
	vagrant halt && rm -rf ${PWD}/tmp

create-files:
	vagrant ssh --command "cd ${LINUX_LIVE_PATH} && sudo ./build"

clean-linux-live:
	vagrant ssh --command "rm -rf ${LINUX_LIVE_PATH}"

install-linux-live-kit:
	vagrant ssh --command "cd /tmp/ && git clone https://github.com/Tomas-M/linux-live.git && cp ~/config ${LINUX_LIVE_PATH}/config"

	


