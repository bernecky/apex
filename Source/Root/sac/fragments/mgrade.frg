% SAC Code fragments for monadic upgrade, downgrade
% Robert Bernecky 2006-11-09


%Fragment ugrd x11 x b i .      Vector upgrade on Booleans
inline $ZTYPE[.] $FNAME($YTYPE[.] y, int QUADio)
{ /* Upgrade of boolean-valued vector */
  /* ((~y)/iota rho y),y/iota rho y */
  /* Model upgradeBV2 from workspace 42 upgrade: rbe/2005-12-11 */
/*
        z{<-}upgradeBV2 bv;s;n0;n1;i
        @ upgrade boolean vector
        s{<-}+/bv
        z{<-}({rho}bv){rho}{neg}1
        n0{<-}0
        n1{<-}({rho}bv)[0]-s
        :for i :in {iota}{rho}bv
         :if ~bv[i]
          z[n0]{<-}i
          n0{<-}n0+1
         :else
          z[n1]{<-}i
          n1{<-}n1+1
         :endif
        :endfor
*/

 s = sum(toi(y));
 shpy = shape(y)[[0]];
 z = genarray(shape(y),-1);
 n0 = 0;
 n1 = shpy-s;
 for(i=0; i<shpy; i++){
   if (false == toB(y[[i]]))
        {z[[n0]] = i; n0++;}
   else
        {z[[n1]] = i; n1++;}
 }
 return(z+QUADio);
}
%Generate , iota, XII, X01, ., I 

%Fragment dgrd x11 x b i .      Vector downgrade on Booleans
inline $ZTYPE[.] $FNAME($YTYPE[.] y, int QUADio)
{ /* Downgrade of boolean vector. */
  /* (y/iota rho y),(~y)/iota rho y */
  /* See APL model downgradeBV2 in workspace 42 upgrade
   * R. Bernecky 2005-11-04
   */
 s = sum(toi(y));
 z = genarray(shape(y),-1);
 shpy = shape(y)[[0]];
 n0 = shpy-1;
 n1 = s-1;
 for(i=shpy-1; i>=0; i--)
   if (false == toB(y[[i]]))
        {z[[n0]] = i; n0--;}
   else
        {z[[n1]] = i; n1--;}
 return(z+QUADio); 
}

%Fragment ugrd x11 x bi i PV   Vector upgrade of permutation vector
inline $ZTYPE[.] $FNAME($YTYPE[.] y, int QUADio)
{ /* Upgrade of permutation vector. */
  /* This exploits array predicate astPredPV */
  z = genarray(shape(y), -1);
  for( i=0; i<shape(y)[0]; i++) {
        z[[y[[i]]]] = i+QUADio;
  }
 return(z); 
}


%Fragment dgrd x11 x bi i  PV downgrade on permutation vector
inline $ZTYPE[.] $FNAME($YTYPE[.] y, int QUADio)
{ /* Downgrade of permutation vector. */
  /* This exploits array predicate astPredPV */
  z = genarray(shape(y), -1);
  size = shape(y)[0];
  for( i=0; i<size; i++) {
        z[[(size-1)-y[[i]]]] = i+QUADio;
  }
 return(z); 
}

%Fragment ugrd x11 x i i    .  
inline $ZTYPE[.] $FNAME($YTYPE[.] y, int QUADio)
{ /* Integer vector upgrade  
   * See radix upgrade model in ws RadixGrade.dws
   */
  rad = 256;
  radixbase = 8; /* 2 log rad */
  bitsperint = 32;
  numpasses = bitsperint/8;
  hist = RadixGradeHistograms( y);
  z = genarray( shape(y), -1);
  if( 0 != shape(y)[0]) {
    pv = iota(shape(y)[0]);
    /* LSB-> MSB sort order */
    for( pas=numpasses-1; pas>=0; pas--) {
      /* Skip pass if all nums in same bucket */
      if( shape(y)[0] != hist[pas, RadixGradeGetIdx( pas, y[pv[0]])]) {
        pvo = RadixGradeOffsets( rad, pas, hist);
        for( i=0; i<shape(y)[0]; i++) {
          val = RadixGradeGetIdx( pas, y[pv[i]]);
          z[pvo[val]] = pv[i];
          pvo[val] =  pvo[val] + ((val<0) ? -1 : 1); 
        }
        pv = z;
      }
    }
  }
  z = QUADio + z; 
  return( z);
}
%Generate , RadixGradeHistograms, X$YTI, X11, .,
%Generate , RadixGradeOffsets, X$YTI, X11, .,
%Generate , RadixGradeGetIdx, X$YTI, X00, .,

%Fragment ugrd x** x bidc i    .  
inline $ZTYPE[.] $FNAME($YTYPE[+] y, int QUADio)
{ /* Vector/matrix upgrade  */
 z = QUADio + UpgradeHeap(y); 
 return( z);
}
%Generate , UpgradeHeap, X$YTI, X**, ., $CT

%Fragment UpgradeHeap x** x bidc i    .  internal matrix upgrade
inline $ZTYPE[.] UpgradeHeap($YTYPE[+] y)
{ 
/*    Do APL upgrade of array y using heapsort.
      This is a sub-function shared by upgrade/downgrade/indexof, etc.
      This version adapted from the Sara Baase "Computer Algorithms"
      version of heapsort.
     Robert Bernecky 2006-11-14
     Knuth, Vol. III, pp. 145-148 gives a good example. 
     APL model: (See workspace apex2003/wss/upgrade or
                 apex2003/wif/upgrade)
                Also UTGrade.dws
r{<-}upgradeHeap v;#io;N;heap
@ Upgrade vector using heapsort
#io{<-}0
N{<-}{rho}v
:if N{<=}1
  r{<-}{iota}N
:else
  heap{<-}MakeHeap(v)
  r{<-}(UnHeap(heap))
:endif
*/

 N = shape(y)[[0]];
 if (N <= 1)
        z = iota(N); 
 else{
        heap = MakeHeap(y);
        z = UnHeap(heap,y);
 }
 return(z);
}


inline int[.] MakeHeap($YTYPE[+] v)
{ /* Build heap from array v. v has at least two elements */
/*
r{<-}MakeHeap v;i;n;heap;biggest
@ Build heap from v
@ We know v has at least two elements
N{<-}{rho}v
heap{<-}{iota}N
:for i :in {reverse}{iota}{floor}N{divide}2
  y FixHeap i,heap[i],n
:endfor
r{<-}heap
*/
 n = shape(v)[[0]];
 heap = iota(n);
 lim = n/2;
 for(i=lim-1; i>=0; i--) {
        heap = FixHeap(heap, v, i, heap[[i]], n);
 }
 return(heap);
}

inline int[.] UnHeap(int[.] heap, $YTYPE[+]v)
{ /* Extract heap elements in top-to-bottom order */
  n = shape(v)[[0]];
  for(heapsize= n-1; heapsize>0; heapsize--){
        biggest = heap[[0]];
        heap = FixHeap(heap,v,0,heap[[heapsize]],heapsize);
        heap[[heapsize]] = biggest;
  }
 return(heap);
}

inline int[.] FixHeap(int[.] heap, $YTYPE[+] v, int root, 
        int heapitem, int heapsize)
{ /* Restore heap invariant: parent>= both children */
 vacant = root;
 lchild = 1+vacant+vacant;
 while( lchild < heapsize) {
        bigC = lchild;      /* Identify larger child, if any */
        rchild = lchild+1;
        if ((lchild<(heapsize-1))){
                li = heap[[lchild]];
                ri = heap[[rchild]]; 
                if ((GradeGT(v[[ri]],v[[li]])) | 
                        (match(v[[ri]], v[[li]]) & (ri>li))){ /* Stability */
                bigC = rchild; /* right child larger */
                }
        }
        /* parent vs big kid*/
        li = heap[[bigC]];
        if ((GradeGT( v[[li]], v[[heapitem]])) |
                (match(v[[li]], v[[heapitem]]) & (li>heapitem))) {
                        heap[[vacant]] = heap[[bigC]];
                        vacant = bigC;
                        lchild = 1+vacant+vacant;
        } else lchild = heapsize;   /* exitloop */
 }
 heap[[vacant]] = heapitem;
 return(heap);
}               
%Generate , GradeGT, $YT$YTB, 000, ., $CT
%Generate , GradeGT, $YT$YTB, **0, ., $CT

%Fragment GradeGT 000 i i b .
inline bool GradeGT(int x, int y)
{ /* Integer Comparator for upgrade */
 return(x>y);
}

%Fragment GradeGT 000 b b b .
inline bool GradeGT(bool x, bool y)
{ /* Boolean Comparator for upgrade */
 return(x & !y);
}

%Fragment GradeGT 000 d d  b .
inline bool GradeGT(double x, double y)
{ /* Double Comparator for upgrade */
 return(x>y);
}

%Fragment GradeGT 000 c c  b .
inline bool GradeGT(char x, char y)
{ /* Char Comparator for upgrade */
 return(x>y);
}


%Fragment GradeGT **0 b b b .
inline bool GradeGT(bool[+] x, bool[+] y)
{ /* Boolean Array Comparator for upgrade */
  /* The ravels of the two arrays are compared.  */
 z = with {
       (0*shape(x) <= iv < shape(x))
                : x[iv] > y[iv];
        }: foldfix( &, true,false);

 return(z);
}

%Fragment GradeGT **0 c c b .
inline bool GradeGT(char[+] x, char[+] y)
{ /* Char Array Comparator for upgrade */
  /* The ravels of the two arrays are compared.  */
 z = with {
       (0*shape(x) <= iv < shape(x))
                : x[iv] > y[iv];
        }: foldfix( &, true,false);
 return(z);
}

%Fragment GradeGT **0 i i b .
inline bool GradeGT(int[+] x, int[+] y)
{ /* Integer Array Comparator for upgrade */
  /* The ravels of the two arrays are compared.  */
 z = with {
       (0*shape(x) <= iv < shape(x))
                : x[iv] > y[iv];
        }: foldfix( &, true,false);
 return(z);
}

%Fragment GradeGT **0 d d b .
inline bool GradeGT(double[+] x, double[+] y)
{ /* Double Array Comparator for upgrade */
  /* The ravels of the two arrays are compared.  */
 z = with {
       (0*shape(x) <= iv < shape(x))
                : x[iv] > y[iv];
        }: foldfix( &, true,false);
 return(z);
}

%Fragment dgrd x** x bidc i    .  
inline $ZTYPE[.] $FNAME($YTYPE[+] y, int QUADio)
{ /* Do APL downgrade of array y using heapsort. */
 z = QUADio + DowngradeHeap( y);
 return(z);
}
%Generate , DowngradeHeap, X$YTI, X**, ., $CT

%Fragment DowngradeHeap x** x bidc i    .  
inline $ZTYPE[.] DowngradeHeap($YTYPE[+] y)
{ /* Do APL downgrade of array y using heapsort.
      This is a sub-function shared by upgrade/downgrade/indexof, etc.
     This version adapted from the Sara Baase "Computer Algorithms"
     version of heapsort.
     Knuth, Vol. III, pp. 145-148 gives a good example. 
     APL model: (See workspace apex2003/benchmks/UTGrade or
                 apex2003/wif/upgrade)
*/

 N = shape(y)[[0]];
 if (N <= 1)
        z = iota(N); 
 else{
        heap = MakeDHeap(y);
        z = UnDHeap(heap,y);
 }
 return(z);
}


inline int[.] MakeDHeap($YTYPE[+] v)
{ /* Build downgrade heap from v. v has at least two elements */
 n = shape(v)[[0]];
 heap = iota(n);
 lim = n/2;
 for(i=lim-1; i>=0; i--) {
        heap = FixDHeap(heap, v, i, heap[[i]], n);
 }
 return(heap);
}

inline int[.] UnDHeap(int[.] heap, $YTYPE[+]v)
{ /* Extract heap elements in top-to-bottom order */
  n = shape(v)[[0]];
  for(heapsize= n-1; heapsize>0; heapsize--){
        biggest = heap[[0]];
        heap = FixDHeap(heap,v,0,heap[[heapsize]],heapsize);
        heap[[heapsize]] = biggest;
  }
 return(heap);
}

inline int[.] FixDHeap(int[.] heap, $YTYPE[+] v, int root, 
        int heapitem, int heapsize)
{ /* Restore heap invariant: parent<= both children */
 vacant = root;
 lchild = 1+vacant+vacant;
 while( lchild < heapsize) {
        bigC = lchild;      /* Identify larger child, if any */
        rchild = lchild+1;
        if ((lchild<(heapsize-1))){
                li = heap[[lchild]];
                ri = heap[[rchild]]; 
                if ((GradeGT(v[[li]], v[[ri]])) | 
                        (match(v[[ri]],v[[li]])) & (ri>li)){ /* Stability */
                bigC = rchild; /* right child larger */
                }
        }
        /* parent vs big kid*/
        li = heap[[bigC]];
        if ((GradeGT( v[[heapitem]], v[[li]])) |
                (match(v[[li]], v[[heapitem]]) & (li>heapitem))) {
                        heap[[vacant]] = heap[[bigC]];
                        vacant = bigC;
                        lchild = 1+vacant+vacant;
        } else lchild = heapsize;   /* exitloop */
 }
 heap[[vacant]] = heapitem;
 return(heap);
}               
%Generate , GradeGT, $YT$YTB, 000, ., $CT
%Generate , GradeGT, $YT$YTB, **0, ., $CT

