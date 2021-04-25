#!/bin/bash

if ps -C spotify > /dev/null; then
        PLAYER="spotify"
    elif ps -C spotifyd > /dev/null; then
        PLAYER="spotifyd"
    fi


    if [ "$PLAYER" = "spotify" ] || [ "$PLAYER" = "spotifyd" ]; then
        ARTIST=$(playerctl metadata artist)
        TRACK=$(playerctl metadata title)
        STATUS=$(playerctl -p spotify status)
                
            if [[ $STATUS = Playing ]]; then
                echo "  [  $ARTIST ] [  $TRACK ]"
            else
                echo "  Paused"
            fi
    else
        echo "  Nothing playing now"   
            
    fi