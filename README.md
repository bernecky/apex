The APEX APL Compiler
=====================

APEX compiles a subset of Dyalog APL into one of several languages, currently SISAL, SaC, and D.

Get Started
-----------

To generate the compiler from github, clone the repository, say into directory `apexgit`.
When cloning this repo, remember to also load the git submodules using either
`git submodule update --init`, or when cloning for the first time `git clone --recursive ..`.

After that, you can load APEX in Dyalog:

```apl
    ⍝ Start Dyalog APL V18.0 (or newer), downloadable from www.dyalog.com, and then
    )load wss/apex.dws
```

At this point, you should have a copy of the apex workspace, which you can
try out. There are some theoretically working benchmarks in BMWORKS:

```apl
    bm←benchmks.benchmks'TestsForNow/BMWORKS'
    z←⍪apex¨bm
    z ⍝ Names of generated SaC source code files
```
You will need a left argument to ``apex`` only rarely.
If specified, the left argument to the `apex` verb is a set of space-delimited
compiler options, e.g. `'option0=x option1=y...'`

Default options are: `targetlanguage=sac trace=0`
This disables debug tracing during compilation, and tells the
compiler to generate SaC code as its output.

The right argument is a folder name, containing the APL code
to be compiled, as a set of `*.aplf` files, each containing the
source code for one defined function, e.g., in `BMWORKS/iotan`, we
have:

The verb main.aplf is:

```apl
    r←main;⎕IO;⎕RL;n;⎕PP;⎕PW
    ⎕IO←0
    n←100000000
    ⎕RL←16807
    ⎕PP←16
    ⎕PW←80
    r←iotan n
    ⎕←r
    ⎕←r←(r≡(n×n+1.5-0.5)÷2)-1
```
This sets some global variables, most of which are not used
in common applications, invokes iotan with the problem size, n,
then compares the result to what is should be, using Gauss' insight.

The verb iotan.aplf is:

```apl
    r←iotan n
    r←+/(1.5-0.5)+⍳n
```
It would have been written as a Dfn in this form, but Dfns had not been
invented when the benchmark was written:

```apl
    iotan←{ r←+/(1.5-0.5)+⍳⍵}
```

The funny business with the real numbers is a sloppy way to force the
result to real numbers.

The compiler's output will be a SaC source code file in the input
folder, `TestsForNow/BMWORKS/iotan/src`. When compiled with `sac2c`
(from www.sac-home.org), the resulting binary, when executed, will compute
the sum of the first n non-negative integers.
The result (r) of executing main should be 0 if the result is correct,
and 0 otherwise.
