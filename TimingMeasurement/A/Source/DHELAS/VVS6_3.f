C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     P(1,2)*P(2,1) - P(-1,1)*P(-1,2)*Metric(1,2)
C     
      SUBROUTINE VVS6_3(V1, V2, COUP, M3, W3,S3)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 V2(*)
      COMPLEX*16 TMP2
      COMPLEX*16 S3(3)
      COMPLEX*16 TMP1
      REAL*8 P1(0:3)
      REAL*8 W3
      COMPLEX*16 TMP0
      REAL*8 P2(0:3)
      REAL*8 P3(0:3)
      REAL*8 M3
      COMPLEX*16 DENOM
      COMPLEX*16 COUP
      COMPLEX*16 V1(*)
      COMPLEX*16 TMP3
      P1(0) = DBLE(V1(1))
      P1(1) = DBLE(V1(2))
      P1(2) = DIMAG(V1(2))
      P1(3) = DIMAG(V1(1))
      P2(0) = DBLE(V2(1))
      P2(1) = DBLE(V2(2))
      P2(2) = DIMAG(V2(2))
      P2(3) = DIMAG(V2(1))
      S3(1) = +V1(1)+V2(1)
      S3(2) = +V1(2)+V2(2)
      P3(0) = -DBLE(S3(1))
      P3(1) = -DBLE(S3(2))
      P3(2) = -DIMAG(S3(2))
      P3(3) = -DIMAG(S3(1))
      TMP1 = (V1(3)*P2(0)-V1(4)*P2(1)-V1(5)*P2(2)-V1(6)*P2(3))
      TMP0 = (V2(3)*P1(0)-V2(4)*P1(1)-V2(5)*P1(2)-V2(6)*P1(3))
      TMP3 = (P1(0)*P2(0)-P1(1)*P2(1)-P1(2)*P2(2)-P1(3)*P2(3))
      TMP2 = (V2(3)*V1(3)-V2(4)*V1(4)-V2(5)*V1(5)-V2(6)*V1(6))
      DENOM = COUP/(P3(0)**2-P3(1)**2-P3(2)**2-P3(3)**2 - M3 * (M3 -CI
     $ * W3))
      S3(3)= DENOM*(-CI*(TMP2*TMP3)+CI*(TMP0*TMP1))
      END


