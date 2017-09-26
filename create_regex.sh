#!/bin/bash

while read line; do
line=`echo $line | tr -d ','`
NEWSTRING=""
        for (( i=0; i<${#line}; i++ )); do
                 CURRENTCHAR="${line:$i:1}"
                        case $CURRENTCHAR in
                        a|A)    NEWSTRING="$NEWSTRING[aA4@]" ;;
                        b|B)    NEWSTRING="$NEWSTRING[bB8]" ;;
                        c|C)    NEWSTRING="$NEWSTRING[cC(]" ;;
                        d|D)    NEWSTRING="$NEWSTRING[dD)]" ;;
                        e|E)    NEWSTRING="$NEWSTRING[eE3]" ;;
                        f|F)    NEWSTRING="$NEWSTRING[fF]" ;;
                        g|G)    NEWSTRING="$NEWSTRING[gG69]" ;;
                        h|H)    NEWSTRING="$NEWSTRING[hH#]" ;;
                        i|I)    NEWSTRING="$NEWSTRING[iI1!|]" ;;
                        j|J)    NEWSTRING="$NEWSTRING[jJi]" ;;
                        k|K)    NEWSTRING="$NEWSTRING[kK<]" ;;
                        l|L)    NEWSTRING="$NEWSTRING[lL1!]" ;;
                        m|M)    NEWSTRING="$NEWSTRING[mM]" ;;
                        n|N)    NEWSTRING="$NEWSTRING[nN]" ;;
                        o|O)    NEWSTRING="$NEWSTRING[oO0]" ;;
                        p|P)    NEWSTRING="$NEWSTRING[pP]" ;;
                        q|Q)    NEWSTRING="$NEWSTRING[qQ]" ;;
                        r|R)    NEWSTRING="$NEWSTRING[rR]" ;;
                        s|S)    NEWSTRING="$NEWSTRING[sS\$5]" ;;
                        t|T)    NEWSTRING="$NEWSTRING[tT+7]" ;;
                        u|U)    NEWSTRING="$NEWSTRING[uU]" ;;
                        v|V)    NEWSTRING="$NEWSTRING[vV]" ;;
                        w|W)    NEWSTRING="$NEWSTRING[wW]" ;;
                        x|X)    NEWSTRING="$NEWSTRING[xX]" ;;
                        y|Y)    NEWSTRING="$NEWSTRING[yY]" ;;
                        z|Z)    NEWSTRING="$NEWSTRING[zZ2]" ;;
                        *)      NEWSTRING="$NEWSTRING[$CURRENTCHAR]" ;;
                        esac
        done

#       echo "$line,$NEWSTRING"
        echo "$NEWSTRING" | tee -a "$2/$line.grep"

done < $1
