C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     -4*Epsilon(1,2,3,-1)*P(-1,1) - 4*Epsilon(1,2,3,-1)*P(-1,2) -
C      4*Epsilon(1,2,3,-1)*P(-1,3)
C     
      SUBROUTINE VVVS1_4(V1, V2, V3, COUP, M4, W4,S4)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 V2(*)
      COMPLEX*16 V3(*)
      COMPLEX*16 S4(3)
      REAL*8 P1(0:3)
      REAL*8 P2(0:3)
      REAL*8 P3(0:3)
      REAL*8 W4
      COMPLEX*16 DENOM
      COMPLEX*16 TMP26
      COMPLEX*16 TMP27
      REAL*8 P4(0:3)
      COMPLEX*16 COUP
      COMPLEX*16 TMP25
      COMPLEX*16 V1(*)
      REAL*8 M4
      P1(0) = DBLE(V1(1))
      P1(1) = DBLE(V1(2))
      P1(2) = DIMAG(V1(2))
      P1(3) = DIMAG(V1(1))
      P2(0) = DBLE(V2(1))
      P2(1) = DBLE(V2(2))
      P2(2) = DIMAG(V2(2))
      P2(3) = DIMAG(V2(1))
      P3(0) = DBLE(V3(1))
      P3(1) = DBLE(V3(2))
      P3(2) = DIMAG(V3(2))
      P3(3) = DIMAG(V3(1))
      S4(1) = +V1(1)+V2(1)+V3(1)
      S4(2) = +V1(2)+V2(2)+V3(2)
      P4(0) = -DBLE(S4(1))
      P4(1) = -DBLE(S4(2))
      P4(2) = -DIMAG(S4(2))
      P4(3) = -DIMAG(S4(1))
      TMP25 = (-1D0)*(P1(0)*(V1(4)*(V3(6)*V2(5)-V3(5)*V2(6))+(V1(5)
     $ *(V3(4)*V2(6)-V3(6)*V2(4))+V1(6)*(V3(5)*V2(4)-V3(4)*V2(5))))
     $ +(P1(1)*(V1(3)*(V3(5)*V2(6)-V3(6)*V2(5))+(V1(5)*(V3(6)*V2(3)
     $ -V3(3)*V2(6))+V1(6)*(V3(3)*V2(5)-V3(5)*V2(3))))+(P1(2)*(V1(3)
     $ *(V3(6)*V2(4)-V3(4)*V2(6))+(V1(4)*(V3(3)*V2(6)-V3(6)*V2(3))
     $ +V1(6)*(V3(4)*V2(3)-V3(3)*V2(4))))+P1(3)*(V1(3)*(V3(4)*V2(5)
     $ -V3(5)*V2(4))+(V1(4)*(V3(5)*V2(3)-V3(3)*V2(5))+V1(5)*(V3(3)
     $ *V2(4)-V3(4)*V2(3)))))))
      TMP26 = (-1D0)*(P2(0)*(V1(4)*(V3(6)*V2(5)-V3(5)*V2(6))+(V1(5)
     $ *(V3(4)*V2(6)-V3(6)*V2(4))+V1(6)*(V3(5)*V2(4)-V3(4)*V2(5))))
     $ +(P2(1)*(V1(3)*(V3(5)*V2(6)-V3(6)*V2(5))+(V1(5)*(V3(6)*V2(3)
     $ -V3(3)*V2(6))+V1(6)*(V3(3)*V2(5)-V3(5)*V2(3))))+(P2(2)*(V1(3)
     $ *(V3(6)*V2(4)-V3(4)*V2(6))+(V1(4)*(V3(3)*V2(6)-V3(6)*V2(3))
     $ +V1(6)*(V3(4)*V2(3)-V3(3)*V2(4))))+P2(3)*(V1(3)*(V3(4)*V2(5)
     $ -V3(5)*V2(4))+(V1(4)*(V3(5)*V2(3)-V3(3)*V2(5))+V1(5)*(V3(3)
     $ *V2(4)-V3(4)*V2(3)))))))
      TMP27 = (-1D0)*(P3(0)*(V1(4)*(V3(6)*V2(5)-V3(5)*V2(6))+(V1(5)
     $ *(V3(4)*V2(6)-V3(6)*V2(4))+V1(6)*(V3(5)*V2(4)-V3(4)*V2(5))))
     $ +(P3(1)*(V1(3)*(V3(5)*V2(6)-V3(6)*V2(5))+(V1(5)*(V3(6)*V2(3)
     $ -V3(3)*V2(6))+V1(6)*(V3(3)*V2(5)-V3(5)*V2(3))))+(P3(2)*(V1(3)
     $ *(V3(6)*V2(4)-V3(4)*V2(6))+(V1(4)*(V3(3)*V2(6)-V3(6)*V2(3))
     $ +V1(6)*(V3(4)*V2(3)-V3(3)*V2(4))))+P3(3)*(V1(3)*(V3(4)*V2(5)
     $ -V3(5)*V2(4))+(V1(4)*(V3(5)*V2(3)-V3(3)*V2(5))+V1(5)*(V3(3)
     $ *V2(4)-V3(4)*V2(3)))))))
      DENOM = COUP/(P4(0)**2-P4(1)**2-P4(2)**2-P4(3)**2 - M4 * (M4 -CI
     $ * W4))
      S4(3)= DENOM*(-4D0)*(+CI*(TMP25+TMP26+TMP27))
      END


C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     -4*Epsilon(1,2,3,-1)*P(-1,1) - 4*Epsilon(1,2,3,-1)*P(-1,2) -
C      4*Epsilon(1,2,3,-1)*P(-1,3)
C     
      SUBROUTINE VVVS1_2_4(V1, V2, V3, COUP1, COUP2, M4, W4,S4)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 V2(*)
      COMPLEX*16 COUP2
      COMPLEX*16 V3(*)
      COMPLEX*16 S4(3)
      REAL*8 P1(0:3)
      REAL*8 P2(0:3)
      REAL*8 P3(0:3)
      REAL*8 W4
      COMPLEX*16 COUP1
      COMPLEX*16 DENOM
      COMPLEX*16 STMP(3)
      INTEGER*4 I
      REAL*8 P4(0:3)
      COMPLEX*16 V1(*)
      REAL*8 M4
      CALL VVVS1_4(V1,V2,V3,COUP1,M4,W4,S4)
      CALL VVVS2_4(V1,V2,V3,COUP2,M4,W4,STMP)
      DO I = 3, 3
        S4(I) = S4(I) + STMP(I)
      ENDDO
      END


