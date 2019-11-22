C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     Gamma(3,2,-1)*ProjM(-1,1) + 2*Gamma(3,2,-1)*ProjP(-1,1)
C     
      SUBROUTINE FFV5_3(F1, F2, COUP, M3, W3,V3)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 TMP2
      COMPLEX*16 V3(6)
      COMPLEX*16 TMP1
      REAL*8 W3
      REAL*8 P3(0:3)
      REAL*8 M3
      COMPLEX*16 F1(*)
      COMPLEX*16 F2(*)
      REAL*8 OM3
      COMPLEX*16 DENOM
      COMPLEX*16 COUP
      OM3 = 0D0
      IF (M3.NE.0D0) OM3=1D0/M3**2
      V3(1) = +F1(1)+F2(1)
      V3(2) = +F1(2)+F2(2)
      P3(0) = -DBLE(V3(1))
      P3(1) = -DBLE(V3(2))
      P3(2) = -DIMAG(V3(2))
      P3(3) = -DIMAG(V3(1))
      TMP1 = (F1(3)*(F2(5)*(P3(0)+P3(3))+F2(6)*(P3(1)+CI*(P3(2))))
     $ +F1(4)*(F2(5)*(P3(1)-CI*(P3(2)))+F2(6)*(P3(0)-P3(3))))
      TMP2 = (F1(5)*(F2(3)*(P3(0)-P3(3))-F2(4)*(P3(1)+CI*(P3(2))))
     $ +F1(6)*(F2(3)*(+CI*(P3(2))-P3(1))+F2(4)*(P3(0)+P3(3))))
      DENOM = COUP/(P3(0)**2-P3(1)**2-P3(2)**2-P3(3)**2 - M3 * (M3 -CI
     $ * W3))
      V3(3)= DENOM*(-2D0 * CI)*(OM3*-1D0/2D0 * P3(0)*(TMP1+2D0*(TMP2))
     $ +(+1D0/2D0*(F1(3)*F2(5)+F1(4)*F2(6))+F1(5)*F2(3)+F1(6)*F2(4)))
      V3(4)= DENOM*(-2D0 * CI)*(OM3*-1D0/2D0 * P3(1)*(TMP1+2D0*(TMP2))
     $ +(-1D0/2D0*(F1(3)*F2(6)+F1(4)*F2(5))+F1(5)*F2(4)+F1(6)*F2(3)))
      V3(5)= DENOM*2D0 * CI*(OM3*1D0/2D0 * P3(2)*(TMP1+2D0*(TMP2))+(
     $ +1D0/2D0 * CI*(F1(3)*F2(6))-1D0/2D0 * CI*(F1(4)*F2(5))-CI*(F1(5)
     $ *F2(4))+CI*(F1(6)*F2(3))))
      V3(6)= DENOM*2D0 * CI*(OM3*1D0/2D0 * P3(3)*(TMP1+2D0*(TMP2))+(
     $ +1D0/2D0*(F1(3)*F2(5))-1D0/2D0*(F1(4)*F2(6))-F1(5)*F2(3)+F1(6)
     $ *F2(4)))
      END


