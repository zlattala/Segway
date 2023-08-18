#!/bin/bash

generate_AnglePID_cases() {
    # P0 D1
    cat $1 | sed \
      "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 0/;\
       s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 1/;" > $(echo $1 | sed "s/P[[:digit:]]_D[[:digit:]]/P0_D1/")
    # P0 D2
    cat $1 | sed \
      "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 0/;\
       s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 2/;" > $(echo $1 | sed "s/P[[:digit:]]_D[[:digit:]]/P0_D2/")
    # P1 D0
    cat $1 | sed \
      "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 1/;\
       s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 0/;" > $(echo $1 | sed "s/P[[:digit:]]_D[[:digit:]]/P1_D0/")
    # P1 D1
    cat $1 | sed \
      "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 1/;\
       s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 1/;" > $(echo $1 | sed "s/P[[:digit:]]_D[[:digit:]]/P1_D1/")
    # P1 D2
    cat $1 | sed \
      "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 1/;\
       s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 2/;" > $(echo $1 | sed "s/P[[:digit:]]_D[[:digit:]]/P1_D2/")
    # P2 D0
    cat $1 | sed \
      "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 2/;\
       s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 0/;" > $(echo $1 | sed "s/P[[:digit:]]_D[[:digit:]]/P2_D0/")
    # P2 D1
    cat $1 | sed \
      "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 2/;\
       s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 1/;" > $(echo $1 | sed "s/P[[:digit:]]_D[[:digit:]]/P2_D1/")
    # P2 D2
    cat $1 | sed \
      "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 2/;\
       s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 2/;" > $(echo $1 | sed "s/P[[:digit:]]_D[[:digit:]]/P2_D2/")
}

generate_SpeedPID_cases() {
    # P0 I1
    cat $1 | sed \
      "s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 0/;\
       s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 1/;" > $(echo $1 | sed "s/P[[:digit:]]_I[[:digit:]]/P0_I1/")
    # P0 I2
    cat $1 | sed \
      "s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 0/;\
       s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 2/;" > $(echo $1 | sed "s/P[[:digit:]]_I[[:digit:]]/P0_I2/")
    # P1 I0
    cat $1 | sed \
      "s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 1/;\
       s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 0/;" > $(echo $1 | sed "s/P[[:digit:]]_I[[:digit:]]/P1_I0/")
    # P1 I1
    cat $1 | sed \
      "s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 1/;\
       s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 1/;" > $(echo $1 | sed "s/P[[:digit:]]_I[[:digit:]]/P1_I1/")
    # P1 I2
    cat $1 | sed \
      "s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 1/;\
       s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 2/;" > $(echo $1 | sed "s/P[[:digit:]]_I[[:digit:]]/P1_I2/")
    # P2 I0
    cat $1 | sed \
      "s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 2/;\
       s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 0/;" > $(echo $1 | sed "s/P[[:digit:]]_I[[:digit:]]/P2_I0/")
    # P2 I1
    cat $1 | sed \
      "s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 2/;\
       s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 1/;" > $(echo $1 | sed "s/P[[:digit:]]_I[[:digit:]]/P2_I1/")
    # P2 I2
    cat $1 | sed \
      "s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 2/;\
       s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 2/;" > $(echo $1 | sed "s/P[[:digit:]]_I[[:digit:]]/P2_I2/")
}

for file in $@
do
    # first generate all the AnglePID cases from the initial file
    generate_AnglePID_cases $file

    # then generate SpeedPID cases for each of the existing files in the directory
    outpath=$(echo $file | sed "s/\/[^\/]*$/\//")
    for newfile in $(ls $outpath)
    do
        generate_SpeedPID_cases $(echo $outpath$newfile)
    done
done
