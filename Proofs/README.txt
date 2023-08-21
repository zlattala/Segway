This folder contains proof screenshots from the GUI FDR, and proof log files from the headless FDR, ran on the robostar server. 

This is a summary of the results we have shown using these model checkers: 

segway-version4 (written by james) = Sequential
parallel-version1 = Parallel_APID_STM
parallel-version2 = Parallel_APID_STM_FixedOrder
parallel-version3 = Parallel_APID_Controller_FixedOrder

Parallel_APID_STM  [= Sequential

Parallel_APID_STM_FixedOrder [= Sequential
Sequential [=  Parallel_APID_STM_FixedOrder

Parallel_APID_Controller_FixedOrder [= Sequential
Sequential [=  Parallel_APID_Controller_FixedOrder

All are deadlock-free as well. 

These are all using all constants = 0, if we set P and D to 1, there is a difference, it is not just 0. In this case, we should check. Because the rotation and speed can recieve on different cycles. Worried about this a bit. 


