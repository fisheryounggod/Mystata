capture log close
capture cmdlog close
cd D:\stata9\ado\personal\Net_course\L1_intro

log    using mylog.log, text replace
cmdlog using mycmd.log, append 

sysuse auto, clear
 d, d
log off
 sum price wei len
log on
 tab rep78
 sum price

log close
cmdlog close
