 r←PrintFn fnm;fn;fn2
⍝ Print function fnm on /dev/lp0
 r←(⎕VR fnm)PutFile fn←'/tmp/',fnm,'.txt'
 r←Shell'aplps ',fn,' >',fn2←'/tmp/',fnm,'.ps'
 r←Shell'cp /opt/apl/rel5.4lx/postscript/aplplusp.ps /dev/lp0'
 r←Shell'cp ',fn2,' /dev/lp0'
 r←Shell'rm ',fn,' ',fn2
