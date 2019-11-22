C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     Identity(2,1)*Metric(1003,2003)
C     
      SUBROUTINE FFT1_3(F1, F2, COUP, M3, W3,T3)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 TMP5
      REAL*8 W3
      REAL*8 P3(0:3)
      REAL*8 M3
      COMPLEX*16 F1(*)
      COMPLEX*16 TMP6
      COMPLEX*16 F2(*)
      REAL*8 OM3
      COMPLEX*16 DENOM
      COMPLEX*16 T3(18)
      COMPLEX*16 COUP
      OM3 = 0D0
      IF (M3.NE.0D0) OM3=1D0/M3**2
      T3(1) = +F1(1)+F2(1)
      T3(2) = +F1(2)+F2(2)
      P3(0) = -DBLE(T3(1))
      P3(1) = -DBLE(T3(2))
      P3(2) = -DIMAG(T3(2))
      P3(3) = -DIMAG(T3(1))
      TMP5 = (F2(3)*F1(3)+F2(4)*F1(4)+F2(5)*F1(5)+F2(6)*F1(6))
      TMP6 = (P3(0)*P3(0)-P3(1)*P3(1)-P3(2)*P3(2)-P3(3)*P3(3))
      DENOM = COUP/(P3(0)**2-P3(1)**2-P3(2)**2-P3(3)**2 - M3 * (M3 -CI
     $ * W3))
      T3(3)= DENOM*TMP5*(OM3*(P3(0)*2D0/3D0 * P3(0)*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)+1D0/3D0 * CI*(TMP6))+ -1D0/3D0 * CI)
      T3(4)= DENOM*2D0/3D0 * OM3*P3(0)*P3(1)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(5)= DENOM*2D0/3D0 * OM3*P3(0)*P3(2)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(6)= DENOM*2D0/3D0 * OM3*P3(0)*P3(3)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(7)= DENOM*2D0/3D0 * OM3*P3(0)*P3(1)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(8)= DENOM*TMP5*(OM3*(P3(1)*2D0/3D0 * P3(1)*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)-1D0/3D0 * CI*(TMP6))+ 1D0/3D0 * CI)
      T3(9)= DENOM*2D0/3D0 * OM3*P3(1)*P3(2)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(10)= DENOM*2D0/3D0 * OM3*P3(1)*P3(3)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(11)= DENOM*2D0/3D0 * OM3*P3(0)*P3(2)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(12)= DENOM*2D0/3D0 * OM3*P3(1)*P3(2)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(13)= DENOM*TMP5*(OM3*(P3(2)*2D0/3D0 * P3(2)*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)-1D0/3D0 * CI*(TMP6))+ 1D0/3D0 * CI)
      T3(14)= DENOM*2D0/3D0 * OM3*P3(2)*P3(3)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(15)= DENOM*2D0/3D0 * OM3*P3(0)*P3(3)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(16)= DENOM*2D0/3D0 * OM3*P3(1)*P3(3)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(17)= DENOM*2D0/3D0 * OM3*P3(2)*P3(3)*TMP5*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)
      T3(18)= DENOM*TMP5*(OM3*(P3(3)*2D0/3D0 * P3(3)*(+CI*(OM3*TMP6)+ 
     $ -1D0/1D0 * CI)-1D0/3D0 * CI*(TMP6))+ 1D0/3D0 * CI)
      END


C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     Identity(2,1)*Metric(1003,2003)
C     
      SUBROUTINE FFT1_2_3(F1, F2, COUP1, COUP2, M3, W3,T3)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 TTMP(18)
      REAL*8 W3
      REAL*8 P3(0:3)
      REAL*8 M3
      COMPLEX*16 F1(*)
      COMPLEX*16 F2(*)
      COMPLEX*16 COUP1
      REAL*8 OM3
      INTEGER*4 I
      COMPLEX*16 DENOM
      COMPLEX*16 COUP2
      COMPLEX*16 T3(18)
      CALL FFT1_3(F1,F2,COUP1,M3,W3,T3)
      CALL FFT2_3(F1,F2,COUP2,M3,W3,TTMP)
      DO I = 3, 18
        T3(I) = T3(I) + TTMP(I)
      ENDDO
      END


