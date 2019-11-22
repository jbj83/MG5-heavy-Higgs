C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     P(2003,1)*Gamma(1003,2,1) - P(2003,2)*Gamma(1003,2,1) +
C      P(1003,1)*Gamma(2003,2,1) - P(1003,2)*Gamma(2003,2,1) -
C      2*P(-1,1)*Gamma(-1,2,1)*Metric(1003,2003) + 2*P(-1,2)*Gamma(-1,2
C     ,1)*Metric(1003,2003)
C     
      SUBROUTINE FFT2_2(F1, T3, COUP, M2, W2,F2)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 F2(6)
      REAL*8 P1(0:3)
      REAL*8 P2(0:3)
      REAL*8 W2
      COMPLEX*16 F1(*)
      REAL*8 M2
      COMPLEX*16 DENOM
      COMPLEX*16 TMP4
      COMPLEX*16 T3(*)
      COMPLEX*16 COUP
      P1(0) = DBLE(F1(1))
      P1(1) = DBLE(F1(2))
      P1(2) = DIMAG(F1(2))
      P1(3) = DIMAG(F1(1))
      F2(1) = +F1(1)+T3(1)
      F2(2) = +F1(2)+T3(2)
      P2(0) = -DBLE(F2(1))
      P2(1) = -DBLE(F2(2))
      P2(2) = -DIMAG(F2(2))
      P2(3) = -DIMAG(F2(1))
      TMP4 = (T3(3)-T3(8)-T3(13)-T3(18))
      DENOM = COUP/(P2(0)**2-P2(1)**2-P2(2)**2-P2(3)**2 - M2 * (M2 -CI
     $ * W2))
      F2(3)= DENOM*CI*(F1(4)*(P2(0)*(P2(3)*(T3(10)+T3(7)+T3(16)+T3(4)
     $ -CI*(T3(14)+T3(11)+T3(17)+T3(5)))+(P2(1)*(-1D0)*(T3(15)+T3(6)
     $ +CI*(T3(12)+T3(9))-2D0*(T3(8)+T3(3)))+(P2(2)*(T3(9)+T3(12)-2D0 
     $ * CI*(T3(13)+T3(3))+CI*(T3(15)+T3(6)))+(P1(0)*(T3(7)+T3(4)-CI
     $ *(T3(11)+T3(5)))+(P1(1)*(+CI*(T3(12)+T3(9))-2D0*(T3(8)+TMP4))
     $ +(P1(2)*(+2D0 * CI*(T3(13)+TMP4)-T3(9)-T3(12))+(P1(3)*(+CI
     $ *(T3(14)+T3(17))-T3(10)-T3(16))+P2(0)*(+CI*(T3(11)+T3(5))-T3(7)
     $ -T3(4)))))))))+(P2(1)*(P2(2)*(T3(17)+T3(14)-CI*(T3(16)+T3(10))
     $ +CI*(T3(4)+T3(7))-T3(5)-T3(11))+(P2(3)*(+2D0*(T3(18))+CI*(T3(12)
     $ +T3(9))-2D0*(T3(8))-T3(6)-T3(15))+(P1(0)*(T3(15)+T3(6)+2D0
     $ *(TMP4)-2D0*(T3(3)))+(P1(1)*(T3(4)+T3(7)-T3(16)-T3(10))+(P1(2)
     $ *(T3(5)+T3(11)-T3(17)-T3(14))+(P1(3)*(T3(6)+T3(15)-2D0*(T3(18)
     $ +TMP4))+P2(1)*(T3(16)+T3(10)-T3(4)-T3(7))))))))+(P2(2)*(P2(3)*(
     $ -2D0 * CI*(T3(18))+CI*(T3(6)+T3(15))+2D0 * CI*(T3(13))-T3(9)
     $ -T3(12))+(P1(0)*(-1D0)*(-2D0 * CI*(T3(3))+CI*(T3(15)+T3(6))+2D0
     $  * CI*(TMP4))+(P1(1)*(-CI*(T3(4)+T3(7))+CI*(T3(16)+T3(10)))
     $ +(P1(2)*(-CI*(T3(5)+T3(11))+CI*(T3(17)+T3(14)))+(P1(3)*(-CI
     $ *(T3(6)+T3(15))+2D0 * CI*(T3(18)+TMP4))+P2(2)*(-CI*(T3(17)
     $ +T3(14))+CI*(T3(5)+T3(11))))))))+P2(3)*(P1(0)*(+CI*(T3(11)+T3(5)
     $ )-T3(7)-T3(4))+(P1(1)*(+2D0*(T3(8)+TMP4)-CI*(T3(12)+T3(9)))
     $ +(P1(2)*(T3(9)+T3(12)-2D0 * CI*(T3(13)+TMP4))+(P1(3)*(T3(10)
     $ +T3(16)-CI*(T3(14)+T3(17)))+P2(3)*(+CI*(T3(14)+T3(17))-T3(10)
     $ -T3(16)))))))))+(F1(3)*(P2(0)*(P2(1)*(T3(16)+T3(10)+2D0*(T3(4)
     $ +T3(7))+CI*(T3(11)+T3(5)))+(P2(2)*(T3(17)+T3(14)+2D0*(T3(5)
     $ +T3(11))-CI*(T3(7)+T3(4)))+(P1(0)*(T3(15)+T3(6)+2D0*(T3(3))-2D0
     $ *(TMP4))+(P1(1)*(-1D0)*(T3(4)+T3(16)+T3(7)+T3(10))+(P1(2)*(-1D0)
     $ *(T3(5)+T3(17)+T3(11)+T3(14))+(P1(3)*(-1D0)*(T3(6)+T3(15)+2D0
     $ *(T3(18)+TMP4))+(P2(0)*(-1D0)*(T3(15)+T3(6)+2D0*(T3(3))-2D0
     $ *(TMP4))+2D0*(P2(3)*(T3(6)+T3(18)+T3(3)+T3(15))))))))))+(P2(3)
     $ *(P2(1)*(-1D0)*(T3(4)+T3(7)+2D0*(T3(10)+T3(16))+CI*(T3(14)
     $ +T3(17)))+(P2(2)*(-1D0)*(T3(5)+T3(11)-CI*(T3(10)+T3(16))+2D0
     $ *(T3(14)+T3(17)))+(P1(0)*(-1D0)*(T3(15)+T3(6)+2D0*(T3(3))-2D0
     $ *(TMP4))+(P1(1)*(T3(4)+T3(16)+T3(7)+T3(10))+(P1(2)*(T3(5)+T3(17)
     $ +T3(11)+T3(14))+(P1(3)*(T3(6)+T3(15)+2D0*(T3(18)+TMP4))-P2(3)
     $ *(T3(6)+T3(15)+2D0*(T3(18)+TMP4))))))))+(P2(1)*(P1(0)*(-1D0)
     $ *(T3(7)+T3(4)+CI*(T3(11)+T3(5)))+(P1(1)*(+2D0*(T3(8)+TMP4)+CI
     $ *(T3(12)+T3(9)))+(P1(2)*(T3(9)+T3(12)+2D0 * CI*(T3(13)+TMP4))
     $ +(P1(3)*(T3(10)+T3(16)+CI*(T3(14)+T3(17)))+(P2(1)*(-1D0)*(+2D0
     $ *(T3(8)+TMP4)+CI*(T3(12)+T3(9)))-2D0*(P2(2)*(T3(9)+T3(12)-CI
     $ *(T3(8))+CI*(T3(13)))))))))+P2(2)*(P1(0)*(+CI*(T3(7)+T3(4))
     $ -T3(11)-T3(5))+(P1(1)*(T3(12)+T3(9)-2D0 * CI*(T3(8)+TMP4))
     $ +(P1(2)*(-CI*(T3(9)+T3(12))+2D0*(T3(13)+TMP4))+(P1(3)*(T3(14)
     $ +T3(17)-CI*(T3(10)+T3(16)))+P2(2)*(+CI*(T3(9)+T3(12))-2D0
     $ *(T3(13)+TMP4)))))))))+M2*(F1(5)*(P1(0)*(-1D0)*(T3(15)+T3(6)
     $ +2D0*(TMP4)-2D0*(T3(3)))+(P1(1)*(T3(16)+T3(10)-T3(4)-T3(7))
     $ +(P1(2)*(T3(17)+T3(14)-T3(5)-T3(11))+(P1(3)*(+2D0*(T3(18)+TMP4)
     $ -T3(6)-T3(15))+(P2(0)*(T3(15)+T3(6)+2D0*(TMP4)-2D0*(T3(3)))
     $ +(P2(1)*(T3(4)+T3(7)-T3(16)-T3(10))+(P2(2)*(T3(5)+T3(11)-T3(17)
     $ -T3(14))+P2(3)*(T3(6)+T3(15)-2D0*(T3(18)+TMP4)))))))))+F1(6)
     $ *(P1(0)*(+CI*(T3(11)+T3(5))-T3(7)-T3(4))+(P1(1)*(+2D0*(T3(8)
     $ +TMP4)-CI*(T3(12)+T3(9)))+(P1(2)*(T3(9)+T3(12)-2D0 * CI*(T3(13)
     $ +TMP4))+(P1(3)*(T3(10)+T3(16)-CI*(T3(14)+T3(17)))+(P2(0)*(T3(7)
     $ +T3(4)-CI*(T3(11)+T3(5)))+(P2(1)*(+CI*(T3(12)+T3(9))-2D0*(T3(8)
     $ +TMP4))+(P2(2)*(+2D0 * CI*(T3(13)+TMP4)-T3(9)-T3(12))+P2(3)*(
     $ +CI*(T3(14)+T3(17))-T3(10)-T3(16))))))))))))
      F2(4)= DENOM*CI*(F1(3)*(P2(0)*(P2(3)*(T3(10)+T3(16)-CI*(T3(11)
     $ +T3(5))+CI*(T3(14)+T3(17))-T3(7)-T3(4))+(P2(1)*(T3(15)+T3(6)
     $ +2D0*(T3(8)+T3(3))+CI*(T3(12)+T3(9)))+(P2(2)*(T3(9)+T3(12)+CI
     $ *(T3(15)+T3(6))+2D0 * CI*(T3(13)+T3(3)))+(P1(0)*(T3(7)+T3(4)+CI
     $ *(T3(11)+T3(5)))+(P1(1)*(-1D0)*(+2D0*(T3(8)+TMP4)+CI*(T3(12)
     $ +T3(9)))+(P1(2)*(-1D0)*(T3(9)+T3(12)+2D0 * CI*(T3(13)+TMP4))
     $ +(P1(3)*(-1D0)*(T3(10)+T3(16)+CI*(T3(14)+T3(17)))-P2(0)*(T3(7)
     $ +T3(4)+CI*(T3(11)+T3(5))))))))))+(P2(1)*(P2(2)*(-1D0)*(T3(5)
     $ +T3(17)+T3(11)+T3(14)+CI*(T3(4)+T3(16)+T3(7)+T3(10)))+(P2(3)*(
     $ +2D0*(T3(8))+CI*(T3(12)+T3(9))-2D0*(T3(18))-T3(6)-T3(15))+(P1(0)
     $ *(-1D0)*(T3(15)+T3(6)+2D0*(T3(3))-2D0*(TMP4))+(P1(1)*(T3(4)
     $ +T3(16)+T3(7)+T3(10))+(P1(2)*(T3(5)+T3(17)+T3(11)+T3(14))+(P1(3)
     $ *(T3(6)+T3(15)+2D0*(T3(18)+TMP4))-P2(1)*(T3(4)+T3(16)+T3(7)
     $ +T3(10))))))))+(P2(2)*(P2(3)*(T3(9)+T3(12)-CI*(T3(6)+T3(15))
     $ -2D0 * CI*(T3(18))+2D0 * CI*(T3(13)))+(P1(0)*(-1D0)*(-2D0 * CI
     $ *(TMP4)+CI*(T3(15)+T3(6))+2D0 * CI*(T3(3)))+(P1(1)*(+CI*(T3(4)
     $ +T3(16)+T3(7)+T3(10)))+(P1(2)*(+CI*(T3(5)+T3(17)+T3(11)+T3(14)))
     $ +(P1(3)*(+CI*(T3(6)+T3(15))+2D0 * CI*(T3(18)+TMP4))-P2(2)*(+CI
     $ *(T3(5)+T3(17)+T3(11)+T3(14))))))))+P2(3)*(P1(0)*(T3(7)+T3(4)
     $ +CI*(T3(11)+T3(5)))+(P1(1)*(-1D0)*(+2D0*(T3(8)+TMP4)+CI*(T3(12)
     $ +T3(9)))+(P1(2)*(-1D0)*(T3(9)+T3(12)+2D0 * CI*(T3(13)+TMP4))
     $ +(P1(3)*(-1D0)*(T3(10)+T3(16)+CI*(T3(14)+T3(17)))+P2(3)*(T3(10)
     $ +T3(16)+CI*(T3(14)+T3(17))))))))))+(F1(4)*(P2(0)*(P2(1)*(-1D0)
     $ *(T3(16)+T3(10)+CI*(T3(11)+T3(5))-2D0*(T3(4)+T3(7)))+(P2(2)*(
     $ +2D0*(T3(5)+T3(11))+CI*(T3(7)+T3(4))-T3(17)-T3(14))+(P1(0)*(
     $ -1D0)*(T3(15)+T3(6)+2D0*(TMP4)-2D0*(T3(3)))+(P1(1)*(T3(16)
     $ +T3(10)-T3(4)-T3(7))+(P1(2)*(T3(17)+T3(14)-T3(5)-T3(11))+(P1(3)
     $ *(+2D0*(T3(18)+TMP4)-T3(6)-T3(15))+(P2(0)*(T3(15)+T3(6)+2D0
     $ *(TMP4)-2D0*(T3(3)))+2D0*(P2(3)*(T3(6)+T3(15)-T3(18)-T3(3)))))))
     $ )))+(P2(3)*(P2(1)*(T3(4)+T3(7)+CI*(T3(14)+T3(17))-2D0*(T3(10)
     $ +T3(16)))+(P2(2)*(-1D0)*(+2D0*(T3(14)+T3(17))+CI*(T3(10)+T3(16))
     $ -T3(5)-T3(11))+(P1(0)*(-1D0)*(T3(15)+T3(6)+2D0*(TMP4)-2D0*(T3(3)
     $ ))+(P1(1)*(T3(16)+T3(10)-T3(4)-T3(7))+(P1(2)*(T3(17)+T3(14)
     $ -T3(5)-T3(11))+(P1(3)*(+2D0*(T3(18)+TMP4)-T3(6)-T3(15))+P2(3)
     $ *(T3(6)+T3(15)-2D0*(T3(18)+TMP4))))))))+(P2(1)*(P1(0)*(+CI
     $ *(T3(11)+T3(5))-T3(7)-T3(4))+(P1(1)*(+2D0*(T3(8)+TMP4)-CI
     $ *(T3(12)+T3(9)))+(P1(2)*(T3(9)+T3(12)-2D0 * CI*(T3(13)+TMP4))
     $ +(P1(3)*(T3(10)+T3(16)-CI*(T3(14)+T3(17)))+(P2(1)*(+CI*(T3(12)
     $ +T3(9))-2D0*(T3(8)+TMP4))-2D0*(P2(2)*(T3(9)+T3(12)-CI*(T3(13))
     $ +CI*(T3(8)))))))))+P2(2)*(P1(0)*(-1D0)*(T3(11)+T3(5)+CI*(T3(7)
     $ +T3(4)))+(P1(1)*(T3(12)+T3(9)+2D0 * CI*(T3(8)+TMP4))+(P1(2)*(
     $ +2D0*(T3(13)+TMP4)+CI*(T3(9)+T3(12)))+(P1(3)*(T3(14)+T3(17)+CI
     $ *(T3(10)+T3(16)))-P2(2)*(+2D0*(T3(13)+TMP4)+CI*(T3(9)+T3(12)))))
     $ )))))+M2*(F1(5)*(P1(0)*(-1D0)*(T3(7)+T3(4)+CI*(T3(11)+T3(5)))
     $ +(P1(1)*(+2D0*(T3(8)+TMP4)+CI*(T3(12)+T3(9)))+(P1(2)*(T3(9)
     $ +T3(12)+2D0 * CI*(T3(13)+TMP4))+(P1(3)*(T3(10)+T3(16)+CI*(T3(14)
     $ +T3(17)))+(P2(0)*(T3(7)+T3(4)+CI*(T3(11)+T3(5)))+(P2(1)*(-1D0)
     $ *(+2D0*(T3(8)+TMP4)+CI*(T3(12)+T3(9)))+(P2(2)*(-1D0)*(T3(9)
     $ +T3(12)+2D0 * CI*(T3(13)+TMP4))-P2(3)*(T3(10)+T3(16)+CI*(T3(14)
     $ +T3(17))))))))))+F1(6)*(P1(0)*(T3(15)+T3(6)+2D0*(T3(3))-2D0
     $ *(TMP4))+(P1(1)*(-1D0)*(T3(4)+T3(16)+T3(7)+T3(10))+(P1(2)*(-1D0)
     $ *(T3(5)+T3(17)+T3(11)+T3(14))+(P1(3)*(-1D0)*(T3(6)+T3(15)+2D0
     $ *(T3(18)+TMP4))+(P2(0)*(-1D0)*(T3(15)+T3(6)+2D0*(T3(3))-2D0
     $ *(TMP4))+(P2(1)*(T3(4)+T3(16)+T3(7)+T3(10))+(P2(2)*(T3(5)+T3(17)
     $ +T3(11)+T3(14))+P2(3)*(T3(6)+T3(15)+2D0*(T3(18)+TMP4))))))))))))
      F2(5)= DENOM*CI*(F1(6)*(P2(0)*(P2(3)*(T3(7)+T3(4)-CI*(T3(11)
     $ +T3(5))+CI*(T3(14)+T3(17))-T3(10)-T3(16))+(P2(1)*(-1D0)*(T3(15)
     $ +T3(6)+2D0*(T3(8)+T3(3))-CI*(T3(12)+T3(9)))+(P2(2)*(+CI*(T3(15)
     $ +T3(6))+2D0 * CI*(T3(13)+T3(3))-T3(9)-T3(12))+(P1(0)*(+CI
     $ *(T3(11)+T3(5))-T3(7)-T3(4))+(P1(1)*(+2D0*(T3(8)+TMP4)-CI
     $ *(T3(12)+T3(9)))+(P1(2)*(T3(9)+T3(12)-2D0 * CI*(T3(13)+TMP4))
     $ +(P1(3)*(T3(10)+T3(16)-CI*(T3(14)+T3(17)))+P2(0)*(T3(7)+T3(4)
     $ -CI*(T3(11)+T3(5))))))))))+(P2(1)*(P2(2)*(T3(5)+T3(17)+T3(11)
     $ +T3(14)-CI*(T3(4)+T3(16)+T3(7)+T3(10)))+(P2(3)*(T3(6)+T3(15)
     $ +2D0*(T3(18))+CI*(T3(12)+T3(9))-2D0*(T3(8)))+(P1(0)*(T3(15)
     $ +T3(6)+2D0*(T3(3))-2D0*(TMP4))+(P1(1)*(-1D0)*(T3(4)+T3(16)+T3(7)
     $ +T3(10))+(P1(2)*(-1D0)*(T3(5)+T3(17)+T3(11)+T3(14))+(P1(3)*(
     $ -1D0)*(T3(6)+T3(15)+2D0*(T3(18)+TMP4))+P2(1)*(T3(4)+T3(16)+T3(7)
     $ +T3(10))))))))+(P2(2)*(P2(3)*(-1D0)*(T3(9)+T3(12)-2D0 * CI
     $ *(T3(13))+CI*(T3(6)+T3(15))+2D0 * CI*(T3(18)))+(P1(0)*(-1D0)*(
     $ -2D0 * CI*(TMP4)+CI*(T3(15)+T3(6))+2D0 * CI*(T3(3)))+(P1(1)*(
     $ +CI*(T3(4)+T3(16)+T3(7)+T3(10)))+(P1(2)*(+CI*(T3(5)+T3(17)
     $ +T3(11)+T3(14)))+(P1(3)*(+CI*(T3(6)+T3(15))+2D0 * CI*(T3(18)
     $ +TMP4))-P2(2)*(+CI*(T3(5)+T3(17)+T3(11)+T3(14))))))))+P2(3)
     $ *(P1(0)*(+CI*(T3(11)+T3(5))-T3(7)-T3(4))+(P1(1)*(+2D0*(T3(8)
     $ +TMP4)-CI*(T3(12)+T3(9)))+(P1(2)*(T3(9)+T3(12)-2D0 * CI*(T3(13)
     $ +TMP4))+(P1(3)*(T3(10)+T3(16)-CI*(T3(14)+T3(17)))+P2(3)*(+CI
     $ *(T3(14)+T3(17))-T3(10)-T3(16)))))))))+(F1(5)*(P2(0)*(P2(1)*(
     $ +2D0*(T3(4)+T3(7))+CI*(T3(11)+T3(5))-T3(16)-T3(10))+(P2(2)*(
     $ -1D0)*(T3(17)+T3(14)+CI*(T3(7)+T3(4))-2D0*(T3(5)+T3(11)))+(P1(0)
     $ *(-1D0)*(T3(15)+T3(6)+2D0*(TMP4)-2D0*(T3(3)))+(P1(1)*(T3(16)
     $ +T3(10)-T3(4)-T3(7))+(P1(2)*(T3(17)+T3(14)-T3(5)-T3(11))+(P1(3)
     $ *(+2D0*(T3(18)+TMP4)-T3(6)-T3(15))+(P2(0)*(T3(15)+T3(6)+2D0
     $ *(TMP4)-2D0*(T3(3)))+2D0*(P2(3)*(T3(6)+T3(15)-T3(18)-T3(3)))))))
     $ )))+(P2(3)*(P2(1)*(-1D0)*(+2D0*(T3(10)+T3(16))+CI*(T3(14)+T3(17)
     $ )-T3(4)-T3(7))+(P2(2)*(T3(5)+T3(11)+CI*(T3(10)+T3(16))-2D0
     $ *(T3(14)+T3(17)))+(P1(0)*(-1D0)*(T3(15)+T3(6)+2D0*(TMP4)-2D0
     $ *(T3(3)))+(P1(1)*(T3(16)+T3(10)-T3(4)-T3(7))+(P1(2)*(T3(17)
     $ +T3(14)-T3(5)-T3(11))+(P1(3)*(+2D0*(T3(18)+TMP4)-T3(6)-T3(15))
     $ +P2(3)*(T3(6)+T3(15)-2D0*(T3(18)+TMP4))))))))+(P2(1)*(P1(0)*(
     $ -1D0)*(T3(7)+T3(4)+CI*(T3(11)+T3(5)))+(P1(1)*(+2D0*(T3(8)+TMP4)
     $ +CI*(T3(12)+T3(9)))+(P1(2)*(T3(9)+T3(12)+2D0 * CI*(T3(13)+TMP4))
     $ +(P1(3)*(T3(10)+T3(16)+CI*(T3(14)+T3(17)))+(P2(1)*(-1D0)*(+2D0
     $ *(T3(8)+TMP4)+CI*(T3(12)+T3(9)))-2D0*(P2(2)*(T3(9)+T3(12)-CI
     $ *(T3(8))+CI*(T3(13)))))))))+P2(2)*(P1(0)*(+CI*(T3(7)+T3(4))
     $ -T3(11)-T3(5))+(P1(1)*(T3(12)+T3(9)-2D0 * CI*(T3(8)+TMP4))
     $ +(P1(2)*(-CI*(T3(9)+T3(12))+2D0*(T3(13)+TMP4))+(P1(3)*(T3(14)
     $ +T3(17)-CI*(T3(10)+T3(16)))+P2(2)*(+CI*(T3(9)+T3(12))-2D0
     $ *(T3(13)+TMP4)))))))))+M2*(F1(3)*(P1(0)*(T3(15)+T3(6)+2D0*(T3(3)
     $ )-2D0*(TMP4))+(P1(1)*(-1D0)*(T3(4)+T3(16)+T3(7)+T3(10))+(P1(2)
     $ *(-1D0)*(T3(5)+T3(17)+T3(11)+T3(14))+(P1(3)*(-1D0)*(T3(6)+T3(15)
     $ +2D0*(T3(18)+TMP4))+(P2(0)*(-1D0)*(T3(15)+T3(6)+2D0*(T3(3))-2D0
     $ *(TMP4))+(P2(1)*(T3(4)+T3(16)+T3(7)+T3(10))+(P2(2)*(T3(5)+T3(17)
     $ +T3(11)+T3(14))+P2(3)*(T3(6)+T3(15)+2D0*(T3(18)+TMP4)))))))))
     $ +F1(4)*(P1(0)*(T3(7)+T3(4)-CI*(T3(11)+T3(5)))+(P1(1)*(+CI
     $ *(T3(12)+T3(9))-2D0*(T3(8)+TMP4))+(P1(2)*(+2D0 * CI*(T3(13)
     $ +TMP4)-T3(9)-T3(12))+(P1(3)*(+CI*(T3(14)+T3(17))-T3(10)-T3(16))
     $ +(P2(0)*(+CI*(T3(11)+T3(5))-T3(7)-T3(4))+(P2(1)*(+2D0*(T3(8)
     $ +TMP4)-CI*(T3(12)+T3(9)))+(P2(2)*(T3(9)+T3(12)-2D0 * CI*(T3(13)
     $ +TMP4))+P2(3)*(T3(10)+T3(16)-CI*(T3(14)+T3(17)))))))))))))
      F2(6)= DENOM*(-CI)*(F1(5)*(P2(0)*(P2(3)*(T3(10)+T3(7)+T3(16)
     $ +T3(4)+CI*(T3(14)+T3(11)+T3(17)+T3(5)))+(P2(1)*(+2D0*(T3(8)
     $ +T3(3))+CI*(T3(12)+T3(9))-T3(15)-T3(6))+(P2(2)*(T3(9)+T3(12)-CI
     $ *(T3(15)+T3(6))+2D0 * CI*(T3(13)+T3(3)))+(P1(0)*(T3(7)+T3(4)+CI
     $ *(T3(11)+T3(5)))+(P1(1)*(-1D0)*(+2D0*(T3(8)+TMP4)+CI*(T3(12)
     $ +T3(9)))+(P1(2)*(-1D0)*(T3(9)+T3(12)+2D0 * CI*(T3(13)+TMP4))
     $ +(P1(3)*(-1D0)*(T3(10)+T3(16)+CI*(T3(14)+T3(17)))-P2(0)*(T3(7)
     $ +T3(4)+CI*(T3(11)+T3(5))))))))))+(P2(1)*(P2(2)*(T3(17)+T3(14)
     $ -CI*(T3(4)+T3(7))+CI*(T3(16)+T3(10))-T3(5)-T3(11))+(P2(3)*(-1D0)
     $ *(T3(6)+T3(15)+2D0*(T3(8))+CI*(T3(12)+T3(9))-2D0*(T3(18)))
     $ +(P1(0)*(T3(15)+T3(6)+2D0*(TMP4)-2D0*(T3(3)))+(P1(1)*(T3(4)
     $ +T3(7)-T3(16)-T3(10))+(P1(2)*(T3(5)+T3(11)-T3(17)-T3(14))+(P1(3)
     $ *(T3(6)+T3(15)-2D0*(T3(18)+TMP4))+P2(1)*(T3(16)+T3(10)-T3(4)
     $ -T3(7))))))))+(P2(2)*(P2(3)*(-1D0)*(T3(9)+T3(12)-2D0 * CI
     $ *(T3(18))+CI*(T3(6)+T3(15))+2D0 * CI*(T3(13)))+(P1(0)*(-2D0 *
     $  CI*(T3(3))+CI*(T3(15)+T3(6))+2D0 * CI*(TMP4))+(P1(1)*(-CI
     $ *(T3(16)+T3(10))+CI*(T3(4)+T3(7)))+(P1(2)*(-CI*(T3(17)+T3(14))
     $ +CI*(T3(5)+T3(11)))+(P1(3)*(-2D0 * CI*(T3(18)+TMP4)+CI*(T3(6)
     $ +T3(15)))+P2(2)*(-CI*(T3(5)+T3(11))+CI*(T3(17)+T3(14))))))))
     $ +P2(3)*(P1(0)*(-1D0)*(T3(7)+T3(4)+CI*(T3(11)+T3(5)))+(P1(1)*(
     $ +2D0*(T3(8)+TMP4)+CI*(T3(12)+T3(9)))+(P1(2)*(T3(9)+T3(12)+2D0 *
     $  CI*(T3(13)+TMP4))+(P1(3)*(T3(10)+T3(16)+CI*(T3(14)+T3(17)))
     $ -P2(3)*(T3(10)+T3(16)+CI*(T3(14)+T3(17))))))))))+(F1(6)*(P2(0)
     $ *(P2(1)*(-1D0)*(T3(16)+T3(10)+2D0*(T3(4)+T3(7))-CI*(T3(11)+T3(5)
     $ ))+(P2(2)*(-1D0)*(T3(17)+T3(14)+2D0*(T3(5)+T3(11))+CI*(T3(7)
     $ +T3(4)))+(P1(0)*(-1D0)*(T3(15)+T3(6)+2D0*(T3(3))-2D0*(TMP4))
     $ +(P1(1)*(T3(4)+T3(16)+T3(7)+T3(10))+(P1(2)*(T3(5)+T3(17)+T3(11)
     $ +T3(14))+(P1(3)*(T3(6)+T3(15)+2D0*(T3(18)+TMP4))+(P2(0)*(T3(15)
     $ +T3(6)+2D0*(T3(3))-2D0*(TMP4))-2D0*(P2(3)*(T3(6)+T3(18)+T3(3)
     $ +T3(15))))))))))+(P2(3)*(P2(1)*(T3(4)+T3(7)+2D0*(T3(10)+T3(16))
     $ -CI*(T3(14)+T3(17)))+(P2(2)*(T3(5)+T3(11)+2D0*(T3(14)+T3(17))
     $ +CI*(T3(10)+T3(16)))+(P1(0)*(T3(15)+T3(6)+2D0*(T3(3))-2D0*(TMP4)
     $ )+(P1(1)*(-1D0)*(T3(4)+T3(16)+T3(7)+T3(10))+(P1(2)*(-1D0)*(T3(5)
     $ +T3(17)+T3(11)+T3(14))+(P1(3)*(-1D0)*(T3(6)+T3(15)+2D0*(T3(18)
     $ +TMP4))+P2(3)*(T3(6)+T3(15)+2D0*(T3(18)+TMP4))))))))+(P2(1)
     $ *(P1(0)*(T3(7)+T3(4)-CI*(T3(11)+T3(5)))+(P1(1)*(+CI*(T3(12)
     $ +T3(9))-2D0*(T3(8)+TMP4))+(P1(2)*(+2D0 * CI*(T3(13)+TMP4)-T3(9)
     $ -T3(12))+(P1(3)*(+CI*(T3(14)+T3(17))-T3(10)-T3(16))+(P2(1)*(
     $ +2D0*(T3(8)+TMP4)-CI*(T3(12)+T3(9)))+2D0*(P2(2)*(T3(9)+T3(12)
     $ -CI*(T3(13))+CI*(T3(8)))))))))+P2(2)*(P1(0)*(T3(11)+T3(5)+CI
     $ *(T3(7)+T3(4)))+(P1(1)*(-1D0)*(T3(12)+T3(9)+2D0 * CI*(T3(8)
     $ +TMP4))+(P1(2)*(-1D0)*(+2D0*(T3(13)+TMP4)+CI*(T3(9)+T3(12)))
     $ +(P1(3)*(-1D0)*(T3(14)+T3(17)+CI*(T3(10)+T3(16)))+P2(2)*(+2D0
     $ *(T3(13)+TMP4)+CI*(T3(9)+T3(12))))))))))+M2*(F1(3)*(P1(0)*(-1D0)
     $ *(T3(7)+T3(4)+CI*(T3(11)+T3(5)))+(P1(1)*(+2D0*(T3(8)+TMP4)+CI
     $ *(T3(12)+T3(9)))+(P1(2)*(T3(9)+T3(12)+2D0 * CI*(T3(13)+TMP4))
     $ +(P1(3)*(T3(10)+T3(16)+CI*(T3(14)+T3(17)))+(P2(0)*(T3(7)+T3(4)
     $ +CI*(T3(11)+T3(5)))+(P2(1)*(-1D0)*(+2D0*(T3(8)+TMP4)+CI*(T3(12)
     $ +T3(9)))+(P2(2)*(-1D0)*(T3(9)+T3(12)+2D0 * CI*(T3(13)+TMP4))
     $ -P2(3)*(T3(10)+T3(16)+CI*(T3(14)+T3(17))))))))))+F1(4)*(P1(0)
     $ *(T3(15)+T3(6)+2D0*(TMP4)-2D0*(T3(3)))+(P1(1)*(T3(4)+T3(7)
     $ -T3(16)-T3(10))+(P1(2)*(T3(5)+T3(11)-T3(17)-T3(14))+(P1(3)
     $ *(T3(6)+T3(15)-2D0*(T3(18)+TMP4))+(P2(0)*(-1D0)*(T3(15)+T3(6)
     $ +2D0*(TMP4)-2D0*(T3(3)))+(P2(1)*(T3(16)+T3(10)-T3(4)-T3(7))
     $ +(P2(2)*(T3(17)+T3(14)-T3(5)-T3(11))+P2(3)*(+2D0*(T3(18)+TMP4)
     $ -T3(6)-T3(15))))))))))))
      END


