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

for file in $@
do
    generate_AnglePID_cases $file
done
