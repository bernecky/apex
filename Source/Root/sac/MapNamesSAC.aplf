 r←MapNamesSAC y
⍝ Map vector of vector of identifiers into names that
⍝ are legal in SAC, but which won't conflict with names
⍝ in the APL compilation unit.
⍝ For today, we append a '_', which is legal in APL,
⍝ BUT we'll explicitly forbid its use in APEX aps.
⍝ Sorry, folks. rbe 2004-02-15
 r←y catenateeach'_'
⍝ I think this is not needed if we support SAC modules
⍝ properly. rbe 2005-10-03
