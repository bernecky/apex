 r←com InsertInterAxisCommas rhs;mk
⍝# Insert interaxis commas and optional surrounding []s for index lists
 mk←0≠⍴¨rhs               ⍝ Mark comma locations
 mk←mk∧~⌽<\⌽mk
 r←rhs,¨((E''),E com)[mk]
