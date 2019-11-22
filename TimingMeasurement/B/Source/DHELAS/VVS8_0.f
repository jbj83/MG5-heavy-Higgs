C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     P(1,1)*P(2,1) + P(1,2)*P(2,2) - P(-1,1)**2*Metric(1,2) -
C      P(-1,2)**2*Metric(1,2)
C     
      SUBROUTINE VVS8_0(V1, V2, S3, COUP,VERTEX)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 V2(*)
      COMPLEX*16 S3(*)
      REAL*8 P1(0:3)
      COMPLEX*16 TMP22
      REAL*8 P2(0:3)
      COMPLEX*16 TMP23
      COMPLEX*16 TMP21
      COMPLEX*16 TMP15
      COMPLEX*16 TMP14
      COMPLEX*16 VERTEX
      COMPLEX*16 TMP24
      COMPLEX*16 COUP
      COMPLEX*16 TMP9
      COMPLEX*16 V1(*)
      P1(0) = DBLE(V1(1))
      P1(1) = DBLE(V1(2))
      P1(2) = DIMAG(V1(2))
      P1(3) = DIMAG(V1(1))
      P2(0) = DBLE(V2(1))
      P2(1) = DBLE(V2(2))
      P2(2) = DIMAG(V2(2))
      P2(3) = DIMAG(V2(1))
      TMP24 = (P2(0)*P2(0)-P2(1)*P2(1)-P2(2)*P2(2)-P2(3)*P2(3))
      TMP21 = (P1(0)*V1(3)-P1(1)*V1(4)-P1(2)*V1(5)-P1(3)*V1(6))
      TMP22 = (P2(0)*V2(3)-P2(1)*V2(4)-P2(2)*V2(5)-P2(3)*V2(6))
      TMP23 = (P1(0)*P1(0)-P1(1)*P1(1)-P1(2)*P1(2)-P1(3)*P1(3))
      TMP9 = (P1(0)*V2(3)-P1(1)*V2(4)-P1(2)*V2(5)-P1(3)*V2(6))
      TMP15 = (V2(3)*V1(3)-V2(4)*V1(4)-V2(5)*V1(5)-V2(6)*V1(6))
      TMP14 = (P2(0)*V1(3)-P2(1)*V1(4)-P2(2)*V1(5)-P2(3)*V1(6))
      VERTEX = COUP*S3(3)*(TMP15*(+CI*(TMP23+TMP24))+(-CI*(TMP9*TMP21
     $ +TMP14*TMP22)))
      END


