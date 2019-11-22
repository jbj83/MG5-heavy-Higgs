C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     1
C     
      SUBROUTINE SSS1_1(S2, S3, COUP, M1, W1,S1)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 S3(*)
      REAL*8 P1(0:3)
      REAL*8 M1
      COMPLEX*16 S1(3)
      REAL*8 W1
      COMPLEX*16 DENOM
      COMPLEX*16 COUP
      COMPLEX*16 S2(*)
      S1(1) = +S2(1)+S3(1)
      S1(2) = +S2(2)+S3(2)
      P1(0) = -DBLE(S1(1))
      P1(1) = -DBLE(S1(2))
      P1(2) = -DIMAG(S1(2))
      P1(3) = -DIMAG(S1(1))
      DENOM = COUP/(P1(0)**2-P1(1)**2-P1(2)**2-P1(3)**2 - M1 * (M1 -CI
     $ * W1))
      S1(3)= DENOM*CI * S3(3)*S2(3)
      END


