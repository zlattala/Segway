#!/bin/bash

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
    generate_SpeedPID_cases $file
done
