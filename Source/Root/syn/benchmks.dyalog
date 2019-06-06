 z←benchmks;r
⍝ Return list of available benchmarks
 (r PathFrag)←InitializePath
 r←GetOption'apexpath'
 r←r,GetOption'benchpath'
 z←ls'-r ',r
 z←(~z∊E'README')/z
 z←(E r),¨z
