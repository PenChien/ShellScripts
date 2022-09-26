#!/bin/bash

clear

server_name=$(hostname)

function docker_status() {
        echo ""
        echo "Docker status: "
        docker ps
        echo ""
}

function restart_rtsp() {
    echo ""
        echo "Restart RTSP "
    echo ""
        bash /home/linker/Desktop/Service/rtsp.sh
    echo ""
}

function restart_rtsptohls() {
    echo ""
        echo "Restart RTSP to HLS: "
    echo ""
        bash /home/linker/Desktop/Service/RTSPtoHLS/start.sh /home/linker/Desktop/Service/RTSPtoHLS/env
    echo ""
}

function 60m() {
    echo ""
        echo "60M"
        sh /home/linker/Desktop/Service/run-60m-model.sh
    echo ""
}

function 120m() {
    echo ""
        echo "120M"
        sh /home/linker/Desktop/Service/run-120m-model.sh
    echo ""
}

function 200m() {
    echo ""
        echo "200"
        sh /home/linker/Desktop/Service/run-200m-model.sh
    echo ""
}

function speed_test() {
    echo ""
        echo ""
        speedtest
    echo ""
}

##
# Color  Variables
##
green='\e[32m'
blue='\e[36m'
clear='\e[0m'
ired='\e[0;101m'
#red='\e[0;31m'

##
# Color Functions
##

ColorGreen(){
        echo -ne $green$1$clear
}
ColorBlue(){
        echo -ne $blue$1$clear
}

menu(){
echo -ne "
`/home/linker/Desktop/Service/welcome.sh`
""
$(ColorGreen '1)') Docker Status
$(ColorGreen '2)') Restart RTSP
$(ColorGreen '3)') Restart RTSP To HLS
$(ColorGreen '4)') Drone  60M Model
$(ColorGreen '5)') Drone 120M Model
$(ColorGreen '6)') Drone 200M Model
$(ColorGreen '7)') Internet Speed Test
$(ColorGreen 'q)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
                1) clear ; docker_status ; menu ;;
                2) clear; restart_rtsp ; menu ;;
                3) clear; restart_rtsptohls ; menu ;;
                4) clear; 60m ; menu ;;
                5) clear; 120m ; menu ;;
                6) clear; 200m ; menu ;;
                7) clear; speed_test ; menu ;;
                q) exit 0 ;;
                *) clear ; echo -e $ired "Ooops - unknown choice \"$a\"" $clear ; menu ;;
        esac
}

# Call the menu function
menu

