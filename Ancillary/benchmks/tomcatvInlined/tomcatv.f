C****************************************************************
C
C     MESHGENERATION WITH THOMPSONS SOLVER, VECTORIZED VERSION
C
C     SET  N = 33, 65, 129
C
C     DO  SCALAR AND VECTOR  RUNS
C
C     W.GENTZSCH   FH REGENSBURG   F.R.G.
C
C*****************************************************************
C
      PARAMETER ( N = 257 )
      IMPLICIT REAL*8 (A-H,O-Z)
      DIMENSION AA(N,N),DD(N,N),X(N,N),Y(N,N),
     1          RX(N,N),RY(N,N),D(N,N)
      COMMON /ZEIT/ S1ALT
      S1ALT = 0.
C
      ALFA = 0.1
      RELFA = 0.98
      LMAX  = 100
      EPS   = 0.5E-7
      H = 1./FLOAT(N-1)
      REL  = 2./RELFA
C
C     INITIAL FIELDS FOR X(I,J) AND Y(I,J) WITH STRECH FACTOR ALFA
C
      DO    4    I = 1,N
    4 X(I,1) = FLOAT(I-1)/FLOAT(N-1)
C
      DO    1    I = 1,N
      X(I,N) = X(I,1)
      X(1,I) = 0.0
      X(N,I) = 1.0
      Y(I,1) = 0.0
      Y(1,I) = X(I,1)
      Y(N,I) = ALFA*X(I,1)
    1 CONTINUE

      DO    2    I=1,N
    2 Y(I,N) = (1.0 - X(I,1))*Y(1,N) + X(I,1) * Y(N,N)
      DO    3    J = 2,N-1
      DO    3    I = 2,N-1
      X(I,J) = 0.9*X(I,1)
      Y(I,J) = 0.9*((1.-X(I,1))*Y(1,J)+X(I,1)*Y(N,J))
    3 CONTINUE
C     WRITE (6,1400) ((X(I,J),I=1,N),J=1,N)
C     WRITE (6,1400) ((Y(I,J),I=1,N),J=1,N)
      WRITE (6,1100)
      WRITE (6,1200)
C
      I1P  = 2
      J1P  = 2
      I2M  = N-1
      J2M  = N-1
C
C
C     START ITERATION LOOP 190
C
C     CALL TIMEB(D1,D2,D3,D4,D5)
      LL   = 0
  190 IXCM = 0
      JXCM = 0
      DXCM = 0.0
      IYCM = 0
      JYCM = 0
      DYCM = 0.0
      IRXM = 0
      JRXM = 0
      RXM  = 0.0
      IRYM = 0
      JRYM = 0
      RYM  = 0.0
C
C     J-LOOP
C
      M = 0
      DO    310    J = J1P,J2M
      JP = J+1
      JM = J-1
      M  = M+1
C
C     I-LOOP
C
      DO    250    I = I1P,I2M
      IP = I+1
      IM = I-1
      XX = X(IP,J)-X(IM,J)
      YX = Y(IP,J)-Y(IM,J)
      XY = X(I,JP)-X(I,JM)
      YY = Y(I,JP)-Y(I,JM)
      A  = 0.25*(XY*XY+YY*YY)
      B  = 0.25*(XX*XX+YX*YX)
      C  = 0.125 *(XX*XY+YX*YY)
      QI = 0.
      QJ = 0.
C     QI = A*0.5
C     QJ = B*0.5
      AA(I,M) = -B
      DD(I,M) = B+B+A*REL
      PXX = X(IP,J)-2.*X(I,J)+X(IM,J)
      QXX = Y(IP,J)-2.*Y(I,J)+Y(IM,J)
      PYY = X(I,JP)-2.*X(I,J)+X(I,JM)
      QYY = Y(I,JP)-2.*Y(I,J)+Y(I,JM)
      PXY = X(IP,JP)-X(IP,JM)-X(IM,JP)+X(IM,JM)
      QXY = Y(IP,JP)-Y(IP,JM)-Y(IM,JP)+Y(IM,JM)
C
C     CALCULATE RESIDUALS ( EQUIVALENT TO RIGHT HAND SIDES OF EQUS.)
C
      RX(I,M)   = A*PXX+B*PYY-C*PXY+XX*QI+XY*QJ
      RY(I,M)   = A*QXX+B*QYY-C*QXY+YX*QI+YY*QJ
  250 CONTINUE
  310 CONTINUE
C
C     DETERMINE MAXIMUM VALUES OF RESIDUALS
C
      DO    270    J = 1,M
      DO    270    I = I1P,I2M
      IF(ABS(RX(I,J)).LT.ABS(RXM))  GOTO  262
      RXM  = RX(I,J)
      IRXM = I
      JRXM = J
  262 IF(ABS(RY(I,J)).LT.ABS(RYM))  GOTO  270
      RYM  = RY(I,J)
      IRYM = I
      JRYM = J
  270 CONTINUE
C
C     SOLVE TRIDIAGONAL SYSTEMS IN PARALLEL
C
      IF(M-1)601,201,301
  201 CONTINUE
      DO    102    I = I1P,I2M
      RX(I,1) = RX(I,1)/DD(I,1)
      RY(I,1) = RY(I,1)/DD(I,1)
  102 CONTINUE
      GOTO  601
  301 DO    103    I = I1P,I2M
      D(I,1) = 1./DD(I,1)
  103 CONTINUE
      DO    401   J = 2,M
      DO    401   I = I1P,I2M
      R       = AA(I,J)*D(I,J-1)
      D (I,J) = 1./(DD(I,J)-AA(I,J-1)*R)
      RX(I,J) = RX(I,J) - RX(I,J-1)*R
      RY(I,J) = RY(I,J) - RY(I,J-1)*R
  401 CONTINUE
      DO    411   I = I1P,I2M
      RX(I,M) = RX(I,M)*D(I,M)
      RY(I,M) = RY(I,M)*D(I,M)
  411 CONTINUE
      DO    501   J = 2,M
      K = M-J+1
      DO    501   I = I1P,I2M
      RX(I,K) = (RX(I,K)-AA(I,K)*RX(I,K+1))*D(I,K)
      RY(I,K) = (RY(I,K)-AA(I,K)*RY(I,K+1))*D(I,K)
  501 CONTINUE 
C
C     ADD CORRECTIONS 
C
      L = 0
      DO    290    J = J1P,J2M
      L = L+1
      DO    290    I = I1P,I2M
      X(I,J) = X(I,J)+RX(I,L)
      Y(I,J) = Y(I,J)+RY(I,L)
  290 CONTINUE
C
C     PREPARE OUTPUT OF CONVERGENCE BEHAVIOUR
C
  601 LL = LL+1
C commented out 1999-09-02/rbe      WRITE (6,1300)LL,IXCM,JXCM,DXCM,
C     1                 IYCM,JYCM,DYCM,
C     2                 IRXM,JRXM, RXM,
C     3                 IRYM,JRYM, RYM
      ABX  = ABS(RXM)
      ABY  = ABS(RYM)
      DMAX = DMAX1(ABX,ABY)
      IF(LL.LT.LMAX.AND.DMAX.GT.EPS)  GOTO  190
C
C     CALL TIMEB(T1,T2,T3,T4,T5)
C     END OF ITERATION LOOP 190
C
C     WRITE (6,1400) ((X(I,J),I=1,N),J=1,N)
C     WRITE (6,1400) ((Y(I,J),I=1,N),J=1,N)
C     WRITE(6,1414) T1
C1414 FORMAT(1X,' TIME = ',F12.6)
 1100 FORMAT(1H1,2X,30H*** 2-D ITERATION BEHAVIOR ***,/)
 1200 FORMAT(/,1X,50HIT   I   J   X-COR      I   J   Y-COR      I   J  ,
     125H X-RES      I   J   Y-RES,/)
 1300 FORMAT(I3,I4,I4,E11.4,I4,I4,E11.4,
     1             I4,I4,E11.4,I4,I4,E11.4)
 1400 FORMAT (2X,11F5.2)
      STOP
      END
