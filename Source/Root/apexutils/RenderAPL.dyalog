﻿ z←colors RenderAPL txt;head;tail;mid
⍝ Generate HTML to render APL text in color
 head←'<!DOCTYPE html>',LF,'<html>',LF,'<body>',LF
 mid←(E'<h1 style="color:'),¨colors,¨(E'">'),¨txt,¨E'</h1>'
 tail←'<body></html>'
 z←head,(D Raze⍉mid),tail
