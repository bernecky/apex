 InitializeAST
⍝ Initialize global accessors for Abstract Syntax Tree access
⍝            ↑↑ Ergo, no Dfn here
 ⍝ Define ast columns
 asttarget←0      ⍝ Result of function
 astlarg←1        ⍝ Function left argument
 astlop←2         ⍝ Operator left operand
 astfn←3          ⍝ Function or operator
 astrop←4         ⍝ Operator right operand
 astrarg←5        ⍝ Function right argument
 asttype←6        ⍝ Result type
 astrank←7        ⍝ Result rank
 astshape←8       ⍝ Shape of result array
 astvalue←9       ⍝ Value of result array, as character array
 astclass←10      ⍝ Class of result array
 aststmt←11       ⍝ Line # of token
 asttoken←12      ⍝ Column # of token
 astxrho←13       ⍝ ×/⍴array
 asttag←14        ⍝ Tag to allow associations among asts
 astPredValues←15 ⍝ ast Predicate values (1 per predicate)
 ⍝ This needed to distinguish NULL from constant ¯1
 astparms←16      ⍝ Extra ast input parameters, in addition to
                  ⍝    astlarg, astrarg
 astscope←17      ⍝ Scope of this name
 astscopeL←0       ⍝ Local name to this fn
 astscopeSGI←1     ⍝ Semi-global input to this fn
 astscopeSGO←2     ⍝ Semi-global output from this fn
 astPred←18       ⍝ Boolean vector of predicates for ast row.
 ⍝ astPred may grow in length. Ordering of ast elements
 ⍝ and of astPred elements is fortuitous.
 ⍝ All predicates are evaluated with ⎕ct=0
 astPredPV←0          ⍝ array is permutation vector: ∧/⍵∊⍳⍴⍵
 astPredPVSubset←1    ⍝ array is subset of permutation
 ⍝ vector. Usually the result of a drop or something.
 ⍝ MAY contain dups (e.g., (2×⍴v)⍴⍳⍴v), unless
 ⍝ astPredNoDups also set.
 astPredNoDups←2      ⍝ (⍳⍴⍵)≡⍵⍳⍵ (⎕ct=0) -- No duplicates
 astPredAll2←3        ⍝ array is all 2. (used by represent)
 astPredSortedUp←4    ⍝ ⍵≡⍵[⍋⍵]
 astPredSortedDown←5  ⍝ ⍵≡⍵[⍒⍵]
 astPredKnowValue←6   ⍝ Value known at compile time
 astPredNonNeg←7      ⍝ ∧/,⍵≥0
 astPredInteger←8     ⍝ ∧/,⍵=⌊⍵
 astPredKnowMaxVal←9  ⍝  Maximum value known at compile time
 astPredKnowMinVal←10 ⍝ Minimum value known at compile time
 astPredLen←11        ⍝ # elements in predicate vector
 astShapeClique←19    ⍝ Index of lowest array w/same shape
 astShapeExpn←20      ⍝ Expression to compute array shape
 astShapeGuard←21     ⍝ This ast entry is a ShapeCliqueGuard
 astSpecCase←22       ⍝ Name of special case, or ''
 astImplicitResult←23 ⍝ Implicit results of this function, akin
                      ⍝ to astparms, but on the way out.
 astcols←24           ⍝ # columns in ast
 astchar←asttype,astrank,astshape ⍝ ast row chars
 astchar←astchar,astvalue,astxrho,astPred,astPredValues
 astchar←astchar,astShapeClique,astShapeExpn,astSpecCase
 ⍝ Result part attributes. These can be used
 ⍝ by assign to copy source argument info.
 astzchar←asttype,astrank,astshape
 ⍝ astptrs is the entries in the ast that can contain
 ⍝ indices into other ast rows, except that
 ⍝ asttarget is special, so it's not in here.
 astptrs←astlop,astlarg,astfn,astrop,astrarg,astparms,asttag,astImplicitResult
 ⍝
 astclassVARB←E'v' ⍝ ast class of array
 astclassNC←E'n' ⍝ Numeric constant
 astclassCC←E'c' ⍝ Character constant
 astclassGFN←E'F' ⍝ Global Verb (function)
 astclassDFN←E'D' ⍝ Global dyadic fn returning result
 astclassMFN←E'M' ⍝ Global monadic fn returning result
 astclassmFN←E'm' ⍝ Global monadic fn not returning result
 astclassdFN←E'd' ⍝ Global dyadic fn not returning result
 astclassNFN←E'N' ⍝ Global niladic fn returning result
 astclassnFN←E'C' ⍝ Global niladic fn not returning result
 astclassLFN←E'V' ⍝ Local verb e.g., f←+.×
 astclassCTL←E'k' ⍝ control structure
 ⍝ Classes of a value-like nature
 astclassVALUE←astclassVARB,astclassNC,astclassCC
 asttypeB←E 0 ⋄ asttypeI←E 1 ⋄ asttypeD←E 2
 asttypeZ←E 3 ⋄ asttypeC←E 4 ⋄ asttypeJ←E 5
 dfnrarg←1+dfnlarg←1+dfnres←1+dfnname←0 ⍝ Fixed ast row defns
 aststz←E' END' ⍝ Marks end of names&constants in ast
 astNoFn←E' -'  ⍝ Mark elided arg/result in fixed part of ast
 astfnCopy←,'←'
 NULL←E-1   ⍝  Generic NULL
 astNULL←E-1 ⍝ ast-specific NULL,just in case
