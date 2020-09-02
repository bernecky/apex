
GetOption←{ // Get option ⍵ from environment vars, with ⍺ as optional default value
⍺←'' ⍝  If no left argument
z←D 0≡ ⎕sh ' echo $',⍵


