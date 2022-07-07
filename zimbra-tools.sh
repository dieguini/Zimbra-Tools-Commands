#!/bin/bash

## Variables de colores
colorVerde=$(tput setaf 2)
colorAmarillo=$(tput setaf 3)
colorAzul=$(tput setaf 4)
colorNormal=$(tput setaf 7) #Blanco

## Variable globales
menuOpcion=0

# INICIO: Funciones

## Funcion que muestra un mensaje de beinvenida
function mensajeBienvenida(){
    printf "%s" "$colorVerde"
printf "


████████████    █████████ ██████  █████     ██████████████  ██████ ██     ███████ 
   ███ ██████  ██████   ████   ████   ██       ██  ██    ████    ████     ██      
  ███  ████ ████ ████████ ██████ ███████       ██  ██    ████    ████     ███████ 
 ███   ████  ██  ████   ████   ████   ██       ██  ██    ████    ████          ██ 
███████████      ████████ ██   ████   ██       ██   ██████  ██████ ██████████████ 
                                                                                  
                                                                                  
\n
Autor: @g0l14t
\n\n
"
}

function dashMenu(){
    setNormalColor

    PS3='Por favor ingresa una opcion: '
    options=("Estados" "Opcion 2" "Opcion 3" "Salir")
    select opt in "${options[@]}"
    do
        case $opt in
            "Estados")
                estadosMenu
                ;;
            "Option 2")
                echo "en proceso..."
                ;;
            "Option 3")
                echo "en proceso... $REPLY opcion $opt"
                ;;
            "Salir")
                break
                ;;
            *) echo "opcion invalida $REPLY";;
        esac
    done
}

function setNormalColor(){
    printf "%s" "$colorNormal"
}

function estadosMenu(){
    printf "\n------ESTADOS------\n%s" "$colorAmarillo"

    setNormalColor

    PS3='Por favor ingresa una opcion: '
    options=("Estados servicios" "Salir")
    select opt in "${options[@]}"
    do
        case $opt in
            "Estados servicios")
                su - zimbra -c "zmcontrol status"
                ;;
            "Salir")
                break
                ;;
            *) echo "opcion invalida $REPLY";;
        esac
    done
}

# FIN: Funciones
mensajeBienvenida
dashMenu
