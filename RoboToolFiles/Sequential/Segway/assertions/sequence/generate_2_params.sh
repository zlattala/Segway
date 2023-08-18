#!/bin/bash

# takes an assertions file ending in _NoPIDs.assertions and converts it to versions with two PID parameters set to 1
outfile=$(echo $1 | sed "s/\/\([^\/]*\.assertions$\)/\/two_parameters\/\1/")
outpath=$(echo $outfile | sed "s/\/[^\/]*$//")

mkdir $outpath

# PID parameters 11000
cat $1 | sed \
  "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 1/;\
   s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 1/;\
   s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 0/;\
   s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 0/;\
   s/constant D  of RotationPID set to [[:digit:]]*/constant D  of RotationPID set to 0/;" > ${outfile/NoPIDs/AnglePID_P_and_D}

# PID parameters 10100
cat $1 | sed \
  "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 1/;\
   s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 0/;\
   s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 1/;\
   s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 0/;\
   s/constant D  of RotationPID set to [[:digit:]]*/constant D  of RotationPID set to 0/;" > ${outfile/NoPIDs/AnglePID_P_SpeedPID_P}
   
# PID parameters 10010
cat $1 | sed \
  "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 1/;\
   s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 0/;\
   s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 0/;\
   s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 1/;\
   s/constant D  of RotationPID set to [[:digit:]]*/constant D  of RotationPID set to 0/;" > ${outfile/NoPIDs/AnglePID_P_SpeedPID_I}
   
# PID parameters 10001
cat $1 | sed \
  "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 1/;\
   s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 0/;\
   s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 0/;\
   s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 0/;\
   s/constant D  of RotationPID set to [[:digit:]]*/constant D  of RotationPID set to 1/;" > ${outfile/NoPIDs/AnglePID_P_RotationPID_D}
   
# PID parameters 01100
cat $1 | sed \
  "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 0/;\
   s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 1/;\
   s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 1/;\
   s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 0/;\
   s/constant D  of RotationPID set to [[:digit:]]*/constant D  of RotationPID set to 0/;" > ${outfile/NoPIDs/AnglePID_D_SpeedPID_P}
   
# PID parameters 01010
cat $1 | sed \
  "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 0/;\
   s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 1/;\
   s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 0/;\
   s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 1/;\
   s/constant D  of RotationPID set to [[:digit:]]*/constant D  of RotationPID set to 0/;" > ${outfile/NoPIDs/AnglePID_D_SpeedPID_I}

# PID parameters 01001
cat $1 | sed \
  "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 0/;\
   s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 1/;\
   s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 0/;\
   s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 0/;\
   s/constant D  of RotationPID set to [[:digit:]]*/constant D  of RotationPID set to 1/;" > ${outfile/NoPIDs/AnglePID_D_RotationPID_D}
   
# PID parameters 00110
cat $1 | sed \
  "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 0/;\
   s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 0/;\
   s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 1/;\
   s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 1/;\
   s/constant D  of RotationPID set to [[:digit:]]*/constant D  of RotationPID set to 0/;" > ${outfile/NoPIDs/SpeedPID_P_and_I}
   
# PID parameters 00101
cat $1 | sed \
  "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 0/;\
   s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 0/;\
   s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 1/;\
   s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 0/;\
   s/constant D  of RotationPID set to [[:digit:]]*/constant D  of RotationPID set to 1/;" > ${outfile/NoPIDs/SpeedPID_P_RotationPID_D}

# PID parameters 00011
cat $1 | sed \
  "s/constant ^P of AnglePID    set to [[:digit:]]*/constant ^P of AnglePID    set to 0/;\
   s/constant D  of AnglePID    set to [[:digit:]]*/constant D  of AnglePID    set to 0/;\
   s/constant ^P of SpeedPID    set to [[:digit:]]*/constant ^P of SpeedPID    set to 0/;\
   s/constant I  of SpeedPID    set to [[:digit:]]*/constant I  of SpeedPID    set to 1/;\
   s/constant D  of RotationPID set to [[:digit:]]*/constant D  of RotationPID set to 1/;" > ${outfile/NoPIDs/SpeedPID_I_RotationPID_D}
