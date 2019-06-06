/* Various utility functions we need to generate from 
 * time to time.
 * Robert Bernecky 2006-02-17
 */

%Fragment NOOP *** bidc bidc bidc . $CT
% noop for conjunctions with derived/defined fns as operands

%Fragment binarysearch 100 i i i .
inline int BinarySearch(int[.] x, int y)
{ /* Binary search (sorted) vector x for y */
  /* From "Computer Algorithms", 2nd Ed., Sara Baase 1988 */
  n = shape(x)[0];
  first = 0;
  last = n-1;
  found = false;
  while((first<last) && !found){
	i = (first+last)/2;
	if (y == x[i])
		found = true;
	elseif (y < x[i])
		last = i-1;
	else
		first = i+1;
	endif
  endwhile;

  if (!found)
	i = n;
  return(i);
}
		

%Fragment upgrade X11 x id i .

inline int[.] Upgrade($YTYPE[.] y)
{ /* Upgrade on integer/floating vector. 
     Do APL upgrade of vector y using heapsort.
     This version from "Numerical Recipes in C", p. 249
     Robert Bernecky 2005-11-17
     Knuth, Vol. III, pp. 145-148 gives a good example. 
     APL model: (See workspace apex2003/wss/upgrade or
                 apex2003/wif/upgrade)
  */

 qio=1; /* Heapsort is sort of origin-1 */
 N = shape(y)[0];
 if (N <= 1)
	z = iotaXII(N,qio); 
 else{
	z = MakeHeap(y);
	z = (UnHeap(z,y))-qio;
 }
 return(z);
}

inline int[.] MakeHeap($XTYPE[.] v)
{ /* Build heap from vector v. v has at least two elements */
 N = shape(v)[0];
 qio = 1;
 heap = iotaXII(N+qio);
 ir=N;
 max= 1+N/2; 
 for(L=max-1; L>0; L--){
	indxt=heap[L-qio];
	q=v[indxt-qio];
	heap = Heapness(L,ir,q,indxt,heap,v);
 }
 return(heap);
}

inline int[.] UnHeap(int[.] heap, $YTYPE[.]v)
{ /* Extract heap elements in top-to-bottom order */

 qio=1;
 for(ir=shape(heap)[0]-1; ir>=2; ir--){
	indxt=heap[ir];
	q=v[indxt-qio];
	heap[ir]=heap[0];
	heap=Heapness(qio,ir,q,indxt,heap,v);
 }
 t = heap[0];		/* This doesn't look kosher to me... */
 heap[0]=heap[1];
 heap[1]=t;
 return(heap);
}

inline int[.] Heapness(int L, int ir, $YTYPE q, int indxt, int[.] heap, $YTYPE[.] v)
{ /* Restore heap invariant: For Origin-1 a[i], i member 1...N,
     a[i/2]>=a[i].
  */

qio=1;		/* Heap is origin-1 */
P = L;		/* Parent node */
C = P+P;	/* Child node */
while (C<=ir){
	/* Find larger sibling index into v */
	if (C >= ir)	/* Fell off heap */
		newC=C;
	else{
		lsibp=heap[C-qio];
		lsib=v[lsibp-qio];
		rsibp=heap[C+1-qio];
		rsib=v[rsibp-qio];
	if 	(upgradeGT(lsib,rsib))	/* Left sib bigger */
		newC=C;
	else if	(upgradeLT(lsib,rsib))	/* Right sib bigger */
		newC=C+1;
	else if	(lsibp<rsibp)		/* Sibs equal. Preserve stable sort */
		newC=C+1;
	else
		newC=C;
	}

/* Swap parent with larger child, if parent smaller */
	bigsibp = heap[newC-qio];
	bigsib = v[bigsibp-qio];
	if	(upgradeLT(q,bigsib)){	/* Parent smaller -swap */
		heap[P-qio]=bigsibp;
		C=newC+newC;
		P=newC;
		}
	else if	(upgradeGT(q,bigsib))	/* Parent bigger - no swap */
		C=ir+1;
	else if	(indxt<bigsibp){	/* Parent=child. Preserve stability */
		heap[P-qio]=bigsibp;
		C=newC+newC;
		P=newC;
		}
	else				/* Parent=child. Already stable */
		C=ir+1;
 }
 heap[P-qio]=indxt;
return(heap);
}		
%Generate , iota, XII, X01, ., $CT

%Fragment ABC *00 bidc bidc i . I
inline int ABC(int I, int Xshape)
{ /* Array bounds checker for indexed ref X[scalarI] and indexed assign */
 z = I;
  if ( (I < 0) || (I >= Xshape)) {
  	print(tochar("APEX index error!"));
  }
 return(z);
}

%Fragment ABC *** bidc bidc i . I
inline int[+] ABC(int[+] I, int Xshape)
{ /* Array bounds checker for indexed ref  X[nonscalarI] and indexed assign */
 z = I;
 bad = with((0*shape(z)) <= iv < shape(z))
  fold(|, false, (z[iv] < 0) || (z[iv] >= Xshape));
 if (bad)
  print(tochar("APEX index error!"));
 return(z);
}

%Fragment Lehmer X00 i i i . I
inline int Lehmer(int qrl)
{ /* Lehmer's random number generator 
   * CACM 1966-06, p. 432 
   */
  val = tod(qrl)*16807.0;
  z = toi(sacmod(val, 2147483647.0));
 return(z);
}
%Generate , sacmod, DDD, 000, ., D

%Fragment sacmod 000 d d d . D
inline double sacmod(double x, double y)
{ /* SAC _mod_ for floats */
 if ( 0.0 == y) {
        t = 1.0;
 } else {
        t = y;
 }
 t2 = floor(x/t);
 z = x - (y*t2);
 return(z);
}

%Fragment APEXFUZZEQ 000 d d b . D
inline bool APEXFUZZEQ(double x, double y, double QUADct)
{ /* ISO APL Tolerant equality predicate */
 absx = abs(x);
 absy = abs(y);
 tolerance = QUADct * max(absx,absy);
 z = abs(x-y) <= tolerance;
 return(z);
}

%Fragment APEXFUZZEQ 000 bid bid b . $CT
% This fragment isn't needed for anything except double/float


%Fragment TRANSPOSE x00 bidc bidc bidc . bidc
inline $ZTYPE TRANSPOSE($YTYPE y)
{ /* Generic monadic transpose on scalar */
 return(y);
}

%Fragment TRANSPOSE x11 bidc bidc bidc . bidc
inline $ZTYPE[.] TRANSPOSE($YTYPE[.] y)
{ /* Generic monadic transpose on vector */
 return(y);
}

%Fragment TRANSPOSE x** bidc bidc bidc . bidc
inline $YTYPE[+] TRANSPOSE($YTYPE[+] y)
{ /* Generic monadic transpose */
  z = with(iv) 
        ( . <= iv <= .) : y[reverse( iv)]; 
        genarray( reverse( shape(y)), $OTFILLY);
  return(z); 
}

%Fragment DFLOORNOFUZZ x00 x  d d . d
inline int DFLOORNOFUZZ(double y)
{ /* Exact floor (no fuzz) */
 return(toi(floor(y)));
}

%Fragment DFLOOR x00 x  d d . d
inline int DFLOOR(double y, double QUADct)
{ /* Fuzzy floor */
  /* Definition taken from SHARP APL Refman May 1991, p.6-23
   * floor:  n <- (signum y) times nofuzzfloor 0.5+abs y)
   *         z <- n-(QUADct times 1 max abs y)<(n-y)
   * If you want a double result,  write: "y - 1| y".
   */
   n = tod(floor(0.5+fabs(y)));
   if (y < 0.0)
	n = -n;
   else if (0.0 == y)
	n = 0.0;
   range = fabs(y);
   if (1.0 > range)
	range = 1.0;
   fuzzlim = QUADct*range;
   ny = n-y;
   if (fuzzlim < ny)
	z = n - 1.0;
   else
	z = n;
   return(toi(z)); 
}


%Fragment VECTORROTATEAMOUNT 000 i i i . i
inline int VectorRotateAmount(int x, int y)
{ /* Normalize x rotate for array of shape y on selected axis */
 /* normalize rotation count */

if ((0==x) || (0==y))
  z = 0;
else if (x>0)
        z = _mod_(x,y);
     else
        z = y - _mod_(_abs_(x),y);
 return(z);
}


%Fragment GREATERTHAN 000 c c b . c
inline bool greaterthan(char[+] x, char[+] y, double QUADct)
{ /* Char item comparator */
  /* This definition is flakey - it compares ravels... */
  /* It oughta also ensure that the arguments shapes match... */
  shp=shape(x)[0];
  z=false;
  for (i=0;i<shp;i++)
        if (x[i]!=y[i]){
                z= x[i]>y[i];
                i=shp;
        }
 return(z);
}


%Fragment DSFLenErrorCheck *** i i b . I
inline int[.] DSFLenErrorCheck(int[.] sx, int[.] sy)
{ /* Dyadic scalar fn length error check */
     z = sx;
#ifdef GENME
/* SAC bug #306 - side effect kills fold! 
    if (any(sx != sy)) /* Check that shapes match */
      print(tochar("APEX dyadic scalar function length error!"));
#endif
     return(z);
}

