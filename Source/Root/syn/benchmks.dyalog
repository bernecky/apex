 benchmks←{ ⍝ Return list of available benchmarks in ⍵
 z←ls'-r ',⍵
 z←(~z∊E'README')/z
 (E r),¨z
}
