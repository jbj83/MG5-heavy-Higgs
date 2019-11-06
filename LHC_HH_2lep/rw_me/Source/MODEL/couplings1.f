ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      SUBROUTINE COUP1()

      IMPLICIT NONE
      INCLUDE 'model_functions.inc'

      DOUBLE PRECISION PI, ZERO
      PARAMETER  (PI=3.141592653589793D0)
      PARAMETER  (ZERO=0D0)
      INCLUDE 'input.inc'
      INCLUDE 'coupl.inc'
      GC_13 = MDL_COMPLEXI*MDL_GHWW
      GC_14 = -(MDL_COMPLEXI*MDL_GHWW1)
      GC_15 = 2.000000D+00*MDL_COMPLEXI*MDL_GHWW2
      GC_16 = 2.000000D+00*MDL_COMPLEXI*MDL_GHZZ
      GC_17 = -(MDL_COMPLEXI*MDL_GHZZ1)
      GC_18 = 4.000000D+00*MDL_COMPLEXI*MDL_GHZZ2
      GC_33 = (MDL_CKM1X1*MDL_EE*MDL_COMPLEXI)/(MDL_SW*MDL_SQRT__2)
      GC_34 = (MDL_CKM1X2*MDL_EE*MDL_COMPLEXI)/(MDL_SW*MDL_SQRT__2)
      GC_35 = (MDL_CKM2X1*MDL_EE*MDL_COMPLEXI)/(MDL_SW*MDL_SQRT__2)
      GC_36 = (MDL_CKM2X2*MDL_EE*MDL_COMPLEXI)/(MDL_SW*MDL_SQRT__2)
      GC_37 = -(MDL_CW*MDL_EE*MDL_COMPLEXI)/(2.000000D+00*MDL_SW)
      GC_38 = (MDL_CW*MDL_EE*MDL_COMPLEXI)/(2.000000D+00*MDL_SW)
      GC_45 = -(MDL_EE*MDL_COMPLEXI*MDL_SW)/(6.000000D+00*MDL_CW)
      GC_46 = (MDL_EE*MDL_COMPLEXI*MDL_SW)/(2.000000D+00*MDL_CW)
      GC_77 = (MDL_EE*MDL_COMPLEXI*MDL_CONJG__CKM1X1)/(MDL_SW
     $ *MDL_SQRT__2)
      GC_78 = (MDL_EE*MDL_COMPLEXI*MDL_CONJG__CKM1X2)/(MDL_SW
     $ *MDL_SQRT__2)
      GC_79 = (MDL_EE*MDL_COMPLEXI*MDL_CONJG__CKM2X1)/(MDL_SW
     $ *MDL_SQRT__2)
      GC_80 = (MDL_EE*MDL_COMPLEXI*MDL_CONJG__CKM2X2)/(MDL_SW
     $ *MDL_SQRT__2)
      END
