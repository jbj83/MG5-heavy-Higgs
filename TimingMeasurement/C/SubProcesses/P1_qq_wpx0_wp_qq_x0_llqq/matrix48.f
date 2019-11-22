      SUBROUTINE SMATRIX48(P,ANS)
C     
C     Generated by MadGraph5_aMC@NLO v. 2.6.6, 2018-06-28
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     MadGraph5_aMC@NLO for Madevent Version
C     
C     Returns amplitude squared summed/avg over colors
C     and helicities
C     for the point in phase space P(0:3,NEXTERNAL)
C     
C     Process: c d~ > w+ x0 QNP<=2 WEIGHTED<=4 @1
C     *   Decay: w+ > c s~ QNP<=2 WEIGHTED<=2
C     *   Decay: x0 > e- e+ s s~ QNP<=2 WEIGHTED<=6
C     Process: c d~ > w+ x0 QNP<=2 WEIGHTED<=4 @1
C     *   Decay: w+ > c s~ QNP<=2 WEIGHTED<=2
C     *   Decay: x0 > mu- mu+ s s~ QNP<=2 WEIGHTED<=6
C     
      USE DISCRETESAMPLER
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INCLUDE 'genps.inc'
      INCLUDE 'maxconfigs.inc'
      INCLUDE 'nexternal.inc'
      INCLUDE 'maxamps.inc'
      INTEGER                 NCOMB
      PARAMETER (             NCOMB=256)
      INTEGER    NGRAPHS
      PARAMETER (NGRAPHS=10)
      INTEGER    NDIAGS
      PARAMETER (NDIAGS=10)
      INTEGER    THEL
      PARAMETER (THEL=2*NCOMB)
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
C     
C     global (due to reading writting) 
C     
      LOGICAL GOODHEL(NCOMB,2)
      INTEGER NTRY(2)
      COMMON/BLOCK_GOODHEL/NTRY,GOODHEL
C     
C     LOCAL VARIABLES 
C     
      INTEGER NHEL(NEXTERNAL,NCOMB)
      INTEGER ISHEL(2)
      REAL*8 T,MATRIX48
      REAL*8 R,SUMHEL,TS(NCOMB)
      INTEGER I,IDEN
      INTEGER JC(NEXTERNAL),II
      REAL*8 HWGT, XTOT, XTRY, XREJ, XR, YFRAC(0:NCOMB)
      INTEGER NGOOD(2), IGOOD(NCOMB,2)
      INTEGER JHEL(2), J, JJ
      INTEGER THIS_NTRY(2)
      SAVE THIS_NTRY
      DATA THIS_NTRY /0,0/
C     This is just to temporarily store the reference grid for
C      helicity of the DiscreteSampler so as to obtain its number of
C      entries with ref_helicity_grid%n_tot_entries
      TYPE(SAMPLEDDIMENSION) REF_HELICITY_GRID
C     
C     GLOBAL VARIABLES
C     
      DOUBLE PRECISION AMP2(MAXAMPS), JAMP2(0:MAXFLOW)
      COMMON/TO_AMPS/  AMP2,       JAMP2

      CHARACTER*101         HEL_BUFF
      COMMON/TO_HELICITY/  HEL_BUFF

      INTEGER IMIRROR
      COMMON/TO_MIRROR/ IMIRROR

      REAL*8 POL(2)
      COMMON/TO_POLARIZATION/ POL

      DOUBLE PRECISION SMALL_WIDTH_TREATMENT
      COMMON/NARROW_WIDTH/SMALL_WIDTH_TREATMENT

      INTEGER          ISUM_HEL
      LOGICAL                    MULTI_CHANNEL
      COMMON/TO_MATRIX/ISUM_HEL, MULTI_CHANNEL
      INTEGER MAPCONFIG(0:LMAXCONFIGS), ICONFIG
      COMMON/TO_MCONFIGS/MAPCONFIG, ICONFIG
      INTEGER SUBDIAG(MAXSPROC),IB(2)
      COMMON/TO_SUB_DIAG/SUBDIAG,IB
      DATA XTRY, XREJ /0,0/
      DATA NGOOD /0,0/
      DATA ISHEL/0,0/
      SAVE YFRAC, IGOOD, JHEL
      DATA (NHEL(I,   1),I=1,8) / 1,-1,-1, 1,-1, 1,-1, 1/
      DATA (NHEL(I,   2),I=1,8) / 1,-1,-1, 1,-1, 1,-1,-1/
      DATA (NHEL(I,   3),I=1,8) / 1,-1,-1, 1,-1, 1, 1, 1/
      DATA (NHEL(I,   4),I=1,8) / 1,-1,-1, 1,-1, 1, 1,-1/
      DATA (NHEL(I,   5),I=1,8) / 1,-1,-1, 1,-1,-1,-1, 1/
      DATA (NHEL(I,   6),I=1,8) / 1,-1,-1, 1,-1,-1,-1,-1/
      DATA (NHEL(I,   7),I=1,8) / 1,-1,-1, 1,-1,-1, 1, 1/
      DATA (NHEL(I,   8),I=1,8) / 1,-1,-1, 1,-1,-1, 1,-1/
      DATA (NHEL(I,   9),I=1,8) / 1,-1,-1, 1, 1, 1,-1, 1/
      DATA (NHEL(I,  10),I=1,8) / 1,-1,-1, 1, 1, 1,-1,-1/
      DATA (NHEL(I,  11),I=1,8) / 1,-1,-1, 1, 1, 1, 1, 1/
      DATA (NHEL(I,  12),I=1,8) / 1,-1,-1, 1, 1, 1, 1,-1/
      DATA (NHEL(I,  13),I=1,8) / 1,-1,-1, 1, 1,-1,-1, 1/
      DATA (NHEL(I,  14),I=1,8) / 1,-1,-1, 1, 1,-1,-1,-1/
      DATA (NHEL(I,  15),I=1,8) / 1,-1,-1, 1, 1,-1, 1, 1/
      DATA (NHEL(I,  16),I=1,8) / 1,-1,-1, 1, 1,-1, 1,-1/
      DATA (NHEL(I,  17),I=1,8) / 1,-1,-1,-1,-1, 1,-1, 1/
      DATA (NHEL(I,  18),I=1,8) / 1,-1,-1,-1,-1, 1,-1,-1/
      DATA (NHEL(I,  19),I=1,8) / 1,-1,-1,-1,-1, 1, 1, 1/
      DATA (NHEL(I,  20),I=1,8) / 1,-1,-1,-1,-1, 1, 1,-1/
      DATA (NHEL(I,  21),I=1,8) / 1,-1,-1,-1,-1,-1,-1, 1/
      DATA (NHEL(I,  22),I=1,8) / 1,-1,-1,-1,-1,-1,-1,-1/
      DATA (NHEL(I,  23),I=1,8) / 1,-1,-1,-1,-1,-1, 1, 1/
      DATA (NHEL(I,  24),I=1,8) / 1,-1,-1,-1,-1,-1, 1,-1/
      DATA (NHEL(I,  25),I=1,8) / 1,-1,-1,-1, 1, 1,-1, 1/
      DATA (NHEL(I,  26),I=1,8) / 1,-1,-1,-1, 1, 1,-1,-1/
      DATA (NHEL(I,  27),I=1,8) / 1,-1,-1,-1, 1, 1, 1, 1/
      DATA (NHEL(I,  28),I=1,8) / 1,-1,-1,-1, 1, 1, 1,-1/
      DATA (NHEL(I,  29),I=1,8) / 1,-1,-1,-1, 1,-1,-1, 1/
      DATA (NHEL(I,  30),I=1,8) / 1,-1,-1,-1, 1,-1,-1,-1/
      DATA (NHEL(I,  31),I=1,8) / 1,-1,-1,-1, 1,-1, 1, 1/
      DATA (NHEL(I,  32),I=1,8) / 1,-1,-1,-1, 1,-1, 1,-1/
      DATA (NHEL(I,  33),I=1,8) / 1,-1, 1, 1,-1, 1,-1, 1/
      DATA (NHEL(I,  34),I=1,8) / 1,-1, 1, 1,-1, 1,-1,-1/
      DATA (NHEL(I,  35),I=1,8) / 1,-1, 1, 1,-1, 1, 1, 1/
      DATA (NHEL(I,  36),I=1,8) / 1,-1, 1, 1,-1, 1, 1,-1/
      DATA (NHEL(I,  37),I=1,8) / 1,-1, 1, 1,-1,-1,-1, 1/
      DATA (NHEL(I,  38),I=1,8) / 1,-1, 1, 1,-1,-1,-1,-1/
      DATA (NHEL(I,  39),I=1,8) / 1,-1, 1, 1,-1,-1, 1, 1/
      DATA (NHEL(I,  40),I=1,8) / 1,-1, 1, 1,-1,-1, 1,-1/
      DATA (NHEL(I,  41),I=1,8) / 1,-1, 1, 1, 1, 1,-1, 1/
      DATA (NHEL(I,  42),I=1,8) / 1,-1, 1, 1, 1, 1,-1,-1/
      DATA (NHEL(I,  43),I=1,8) / 1,-1, 1, 1, 1, 1, 1, 1/
      DATA (NHEL(I,  44),I=1,8) / 1,-1, 1, 1, 1, 1, 1,-1/
      DATA (NHEL(I,  45),I=1,8) / 1,-1, 1, 1, 1,-1,-1, 1/
      DATA (NHEL(I,  46),I=1,8) / 1,-1, 1, 1, 1,-1,-1,-1/
      DATA (NHEL(I,  47),I=1,8) / 1,-1, 1, 1, 1,-1, 1, 1/
      DATA (NHEL(I,  48),I=1,8) / 1,-1, 1, 1, 1,-1, 1,-1/
      DATA (NHEL(I,  49),I=1,8) / 1,-1, 1,-1,-1, 1,-1, 1/
      DATA (NHEL(I,  50),I=1,8) / 1,-1, 1,-1,-1, 1,-1,-1/
      DATA (NHEL(I,  51),I=1,8) / 1,-1, 1,-1,-1, 1, 1, 1/
      DATA (NHEL(I,  52),I=1,8) / 1,-1, 1,-1,-1, 1, 1,-1/
      DATA (NHEL(I,  53),I=1,8) / 1,-1, 1,-1,-1,-1,-1, 1/
      DATA (NHEL(I,  54),I=1,8) / 1,-1, 1,-1,-1,-1,-1,-1/
      DATA (NHEL(I,  55),I=1,8) / 1,-1, 1,-1,-1,-1, 1, 1/
      DATA (NHEL(I,  56),I=1,8) / 1,-1, 1,-1,-1,-1, 1,-1/
      DATA (NHEL(I,  57),I=1,8) / 1,-1, 1,-1, 1, 1,-1, 1/
      DATA (NHEL(I,  58),I=1,8) / 1,-1, 1,-1, 1, 1,-1,-1/
      DATA (NHEL(I,  59),I=1,8) / 1,-1, 1,-1, 1, 1, 1, 1/
      DATA (NHEL(I,  60),I=1,8) / 1,-1, 1,-1, 1, 1, 1,-1/
      DATA (NHEL(I,  61),I=1,8) / 1,-1, 1,-1, 1,-1,-1, 1/
      DATA (NHEL(I,  62),I=1,8) / 1,-1, 1,-1, 1,-1,-1,-1/
      DATA (NHEL(I,  63),I=1,8) / 1,-1, 1,-1, 1,-1, 1, 1/
      DATA (NHEL(I,  64),I=1,8) / 1,-1, 1,-1, 1,-1, 1,-1/
      DATA (NHEL(I,  65),I=1,8) / 1, 1,-1, 1,-1, 1,-1, 1/
      DATA (NHEL(I,  66),I=1,8) / 1, 1,-1, 1,-1, 1,-1,-1/
      DATA (NHEL(I,  67),I=1,8) / 1, 1,-1, 1,-1, 1, 1, 1/
      DATA (NHEL(I,  68),I=1,8) / 1, 1,-1, 1,-1, 1, 1,-1/
      DATA (NHEL(I,  69),I=1,8) / 1, 1,-1, 1,-1,-1,-1, 1/
      DATA (NHEL(I,  70),I=1,8) / 1, 1,-1, 1,-1,-1,-1,-1/
      DATA (NHEL(I,  71),I=1,8) / 1, 1,-1, 1,-1,-1, 1, 1/
      DATA (NHEL(I,  72),I=1,8) / 1, 1,-1, 1,-1,-1, 1,-1/
      DATA (NHEL(I,  73),I=1,8) / 1, 1,-1, 1, 1, 1,-1, 1/
      DATA (NHEL(I,  74),I=1,8) / 1, 1,-1, 1, 1, 1,-1,-1/
      DATA (NHEL(I,  75),I=1,8) / 1, 1,-1, 1, 1, 1, 1, 1/
      DATA (NHEL(I,  76),I=1,8) / 1, 1,-1, 1, 1, 1, 1,-1/
      DATA (NHEL(I,  77),I=1,8) / 1, 1,-1, 1, 1,-1,-1, 1/
      DATA (NHEL(I,  78),I=1,8) / 1, 1,-1, 1, 1,-1,-1,-1/
      DATA (NHEL(I,  79),I=1,8) / 1, 1,-1, 1, 1,-1, 1, 1/
      DATA (NHEL(I,  80),I=1,8) / 1, 1,-1, 1, 1,-1, 1,-1/
      DATA (NHEL(I,  81),I=1,8) / 1, 1,-1,-1,-1, 1,-1, 1/
      DATA (NHEL(I,  82),I=1,8) / 1, 1,-1,-1,-1, 1,-1,-1/
      DATA (NHEL(I,  83),I=1,8) / 1, 1,-1,-1,-1, 1, 1, 1/
      DATA (NHEL(I,  84),I=1,8) / 1, 1,-1,-1,-1, 1, 1,-1/
      DATA (NHEL(I,  85),I=1,8) / 1, 1,-1,-1,-1,-1,-1, 1/
      DATA (NHEL(I,  86),I=1,8) / 1, 1,-1,-1,-1,-1,-1,-1/
      DATA (NHEL(I,  87),I=1,8) / 1, 1,-1,-1,-1,-1, 1, 1/
      DATA (NHEL(I,  88),I=1,8) / 1, 1,-1,-1,-1,-1, 1,-1/
      DATA (NHEL(I,  89),I=1,8) / 1, 1,-1,-1, 1, 1,-1, 1/
      DATA (NHEL(I,  90),I=1,8) / 1, 1,-1,-1, 1, 1,-1,-1/
      DATA (NHEL(I,  91),I=1,8) / 1, 1,-1,-1, 1, 1, 1, 1/
      DATA (NHEL(I,  92),I=1,8) / 1, 1,-1,-1, 1, 1, 1,-1/
      DATA (NHEL(I,  93),I=1,8) / 1, 1,-1,-1, 1,-1,-1, 1/
      DATA (NHEL(I,  94),I=1,8) / 1, 1,-1,-1, 1,-1,-1,-1/
      DATA (NHEL(I,  95),I=1,8) / 1, 1,-1,-1, 1,-1, 1, 1/
      DATA (NHEL(I,  96),I=1,8) / 1, 1,-1,-1, 1,-1, 1,-1/
      DATA (NHEL(I,  97),I=1,8) / 1, 1, 1, 1,-1, 1,-1, 1/
      DATA (NHEL(I,  98),I=1,8) / 1, 1, 1, 1,-1, 1,-1,-1/
      DATA (NHEL(I,  99),I=1,8) / 1, 1, 1, 1,-1, 1, 1, 1/
      DATA (NHEL(I, 100),I=1,8) / 1, 1, 1, 1,-1, 1, 1,-1/
      DATA (NHEL(I, 101),I=1,8) / 1, 1, 1, 1,-1,-1,-1, 1/
      DATA (NHEL(I, 102),I=1,8) / 1, 1, 1, 1,-1,-1,-1,-1/
      DATA (NHEL(I, 103),I=1,8) / 1, 1, 1, 1,-1,-1, 1, 1/
      DATA (NHEL(I, 104),I=1,8) / 1, 1, 1, 1,-1,-1, 1,-1/
      DATA (NHEL(I, 105),I=1,8) / 1, 1, 1, 1, 1, 1,-1, 1/
      DATA (NHEL(I, 106),I=1,8) / 1, 1, 1, 1, 1, 1,-1,-1/
      DATA (NHEL(I, 107),I=1,8) / 1, 1, 1, 1, 1, 1, 1, 1/
      DATA (NHEL(I, 108),I=1,8) / 1, 1, 1, 1, 1, 1, 1,-1/
      DATA (NHEL(I, 109),I=1,8) / 1, 1, 1, 1, 1,-1,-1, 1/
      DATA (NHEL(I, 110),I=1,8) / 1, 1, 1, 1, 1,-1,-1,-1/
      DATA (NHEL(I, 111),I=1,8) / 1, 1, 1, 1, 1,-1, 1, 1/
      DATA (NHEL(I, 112),I=1,8) / 1, 1, 1, 1, 1,-1, 1,-1/
      DATA (NHEL(I, 113),I=1,8) / 1, 1, 1,-1,-1, 1,-1, 1/
      DATA (NHEL(I, 114),I=1,8) / 1, 1, 1,-1,-1, 1,-1,-1/
      DATA (NHEL(I, 115),I=1,8) / 1, 1, 1,-1,-1, 1, 1, 1/
      DATA (NHEL(I, 116),I=1,8) / 1, 1, 1,-1,-1, 1, 1,-1/
      DATA (NHEL(I, 117),I=1,8) / 1, 1, 1,-1,-1,-1,-1, 1/
      DATA (NHEL(I, 118),I=1,8) / 1, 1, 1,-1,-1,-1,-1,-1/
      DATA (NHEL(I, 119),I=1,8) / 1, 1, 1,-1,-1,-1, 1, 1/
      DATA (NHEL(I, 120),I=1,8) / 1, 1, 1,-1,-1,-1, 1,-1/
      DATA (NHEL(I, 121),I=1,8) / 1, 1, 1,-1, 1, 1,-1, 1/
      DATA (NHEL(I, 122),I=1,8) / 1, 1, 1,-1, 1, 1,-1,-1/
      DATA (NHEL(I, 123),I=1,8) / 1, 1, 1,-1, 1, 1, 1, 1/
      DATA (NHEL(I, 124),I=1,8) / 1, 1, 1,-1, 1, 1, 1,-1/
      DATA (NHEL(I, 125),I=1,8) / 1, 1, 1,-1, 1,-1,-1, 1/
      DATA (NHEL(I, 126),I=1,8) / 1, 1, 1,-1, 1,-1,-1,-1/
      DATA (NHEL(I, 127),I=1,8) / 1, 1, 1,-1, 1,-1, 1, 1/
      DATA (NHEL(I, 128),I=1,8) / 1, 1, 1,-1, 1,-1, 1,-1/
      DATA (NHEL(I, 129),I=1,8) /-1,-1,-1, 1,-1, 1,-1, 1/
      DATA (NHEL(I, 130),I=1,8) /-1,-1,-1, 1,-1, 1,-1,-1/
      DATA (NHEL(I, 131),I=1,8) /-1,-1,-1, 1,-1, 1, 1, 1/
      DATA (NHEL(I, 132),I=1,8) /-1,-1,-1, 1,-1, 1, 1,-1/
      DATA (NHEL(I, 133),I=1,8) /-1,-1,-1, 1,-1,-1,-1, 1/
      DATA (NHEL(I, 134),I=1,8) /-1,-1,-1, 1,-1,-1,-1,-1/
      DATA (NHEL(I, 135),I=1,8) /-1,-1,-1, 1,-1,-1, 1, 1/
      DATA (NHEL(I, 136),I=1,8) /-1,-1,-1, 1,-1,-1, 1,-1/
      DATA (NHEL(I, 137),I=1,8) /-1,-1,-1, 1, 1, 1,-1, 1/
      DATA (NHEL(I, 138),I=1,8) /-1,-1,-1, 1, 1, 1,-1,-1/
      DATA (NHEL(I, 139),I=1,8) /-1,-1,-1, 1, 1, 1, 1, 1/
      DATA (NHEL(I, 140),I=1,8) /-1,-1,-1, 1, 1, 1, 1,-1/
      DATA (NHEL(I, 141),I=1,8) /-1,-1,-1, 1, 1,-1,-1, 1/
      DATA (NHEL(I, 142),I=1,8) /-1,-1,-1, 1, 1,-1,-1,-1/
      DATA (NHEL(I, 143),I=1,8) /-1,-1,-1, 1, 1,-1, 1, 1/
      DATA (NHEL(I, 144),I=1,8) /-1,-1,-1, 1, 1,-1, 1,-1/
      DATA (NHEL(I, 145),I=1,8) /-1,-1,-1,-1,-1, 1,-1, 1/
      DATA (NHEL(I, 146),I=1,8) /-1,-1,-1,-1,-1, 1,-1,-1/
      DATA (NHEL(I, 147),I=1,8) /-1,-1,-1,-1,-1, 1, 1, 1/
      DATA (NHEL(I, 148),I=1,8) /-1,-1,-1,-1,-1, 1, 1,-1/
      DATA (NHEL(I, 149),I=1,8) /-1,-1,-1,-1,-1,-1,-1, 1/
      DATA (NHEL(I, 150),I=1,8) /-1,-1,-1,-1,-1,-1,-1,-1/
      DATA (NHEL(I, 151),I=1,8) /-1,-1,-1,-1,-1,-1, 1, 1/
      DATA (NHEL(I, 152),I=1,8) /-1,-1,-1,-1,-1,-1, 1,-1/
      DATA (NHEL(I, 153),I=1,8) /-1,-1,-1,-1, 1, 1,-1, 1/
      DATA (NHEL(I, 154),I=1,8) /-1,-1,-1,-1, 1, 1,-1,-1/
      DATA (NHEL(I, 155),I=1,8) /-1,-1,-1,-1, 1, 1, 1, 1/
      DATA (NHEL(I, 156),I=1,8) /-1,-1,-1,-1, 1, 1, 1,-1/
      DATA (NHEL(I, 157),I=1,8) /-1,-1,-1,-1, 1,-1,-1, 1/
      DATA (NHEL(I, 158),I=1,8) /-1,-1,-1,-1, 1,-1,-1,-1/
      DATA (NHEL(I, 159),I=1,8) /-1,-1,-1,-1, 1,-1, 1, 1/
      DATA (NHEL(I, 160),I=1,8) /-1,-1,-1,-1, 1,-1, 1,-1/
      DATA (NHEL(I, 161),I=1,8) /-1,-1, 1, 1,-1, 1,-1, 1/
      DATA (NHEL(I, 162),I=1,8) /-1,-1, 1, 1,-1, 1,-1,-1/
      DATA (NHEL(I, 163),I=1,8) /-1,-1, 1, 1,-1, 1, 1, 1/
      DATA (NHEL(I, 164),I=1,8) /-1,-1, 1, 1,-1, 1, 1,-1/
      DATA (NHEL(I, 165),I=1,8) /-1,-1, 1, 1,-1,-1,-1, 1/
      DATA (NHEL(I, 166),I=1,8) /-1,-1, 1, 1,-1,-1,-1,-1/
      DATA (NHEL(I, 167),I=1,8) /-1,-1, 1, 1,-1,-1, 1, 1/
      DATA (NHEL(I, 168),I=1,8) /-1,-1, 1, 1,-1,-1, 1,-1/
      DATA (NHEL(I, 169),I=1,8) /-1,-1, 1, 1, 1, 1,-1, 1/
      DATA (NHEL(I, 170),I=1,8) /-1,-1, 1, 1, 1, 1,-1,-1/
      DATA (NHEL(I, 171),I=1,8) /-1,-1, 1, 1, 1, 1, 1, 1/
      DATA (NHEL(I, 172),I=1,8) /-1,-1, 1, 1, 1, 1, 1,-1/
      DATA (NHEL(I, 173),I=1,8) /-1,-1, 1, 1, 1,-1,-1, 1/
      DATA (NHEL(I, 174),I=1,8) /-1,-1, 1, 1, 1,-1,-1,-1/
      DATA (NHEL(I, 175),I=1,8) /-1,-1, 1, 1, 1,-1, 1, 1/
      DATA (NHEL(I, 176),I=1,8) /-1,-1, 1, 1, 1,-1, 1,-1/
      DATA (NHEL(I, 177),I=1,8) /-1,-1, 1,-1,-1, 1,-1, 1/
      DATA (NHEL(I, 178),I=1,8) /-1,-1, 1,-1,-1, 1,-1,-1/
      DATA (NHEL(I, 179),I=1,8) /-1,-1, 1,-1,-1, 1, 1, 1/
      DATA (NHEL(I, 180),I=1,8) /-1,-1, 1,-1,-1, 1, 1,-1/
      DATA (NHEL(I, 181),I=1,8) /-1,-1, 1,-1,-1,-1,-1, 1/
      DATA (NHEL(I, 182),I=1,8) /-1,-1, 1,-1,-1,-1,-1,-1/
      DATA (NHEL(I, 183),I=1,8) /-1,-1, 1,-1,-1,-1, 1, 1/
      DATA (NHEL(I, 184),I=1,8) /-1,-1, 1,-1,-1,-1, 1,-1/
      DATA (NHEL(I, 185),I=1,8) /-1,-1, 1,-1, 1, 1,-1, 1/
      DATA (NHEL(I, 186),I=1,8) /-1,-1, 1,-1, 1, 1,-1,-1/
      DATA (NHEL(I, 187),I=1,8) /-1,-1, 1,-1, 1, 1, 1, 1/
      DATA (NHEL(I, 188),I=1,8) /-1,-1, 1,-1, 1, 1, 1,-1/
      DATA (NHEL(I, 189),I=1,8) /-1,-1, 1,-1, 1,-1,-1, 1/
      DATA (NHEL(I, 190),I=1,8) /-1,-1, 1,-1, 1,-1,-1,-1/
      DATA (NHEL(I, 191),I=1,8) /-1,-1, 1,-1, 1,-1, 1, 1/
      DATA (NHEL(I, 192),I=1,8) /-1,-1, 1,-1, 1,-1, 1,-1/
      DATA (NHEL(I, 193),I=1,8) /-1, 1,-1, 1,-1, 1,-1, 1/
      DATA (NHEL(I, 194),I=1,8) /-1, 1,-1, 1,-1, 1,-1,-1/
      DATA (NHEL(I, 195),I=1,8) /-1, 1,-1, 1,-1, 1, 1, 1/
      DATA (NHEL(I, 196),I=1,8) /-1, 1,-1, 1,-1, 1, 1,-1/
      DATA (NHEL(I, 197),I=1,8) /-1, 1,-1, 1,-1,-1,-1, 1/
      DATA (NHEL(I, 198),I=1,8) /-1, 1,-1, 1,-1,-1,-1,-1/
      DATA (NHEL(I, 199),I=1,8) /-1, 1,-1, 1,-1,-1, 1, 1/
      DATA (NHEL(I, 200),I=1,8) /-1, 1,-1, 1,-1,-1, 1,-1/
      DATA (NHEL(I, 201),I=1,8) /-1, 1,-1, 1, 1, 1,-1, 1/
      DATA (NHEL(I, 202),I=1,8) /-1, 1,-1, 1, 1, 1,-1,-1/
      DATA (NHEL(I, 203),I=1,8) /-1, 1,-1, 1, 1, 1, 1, 1/
      DATA (NHEL(I, 204),I=1,8) /-1, 1,-1, 1, 1, 1, 1,-1/
      DATA (NHEL(I, 205),I=1,8) /-1, 1,-1, 1, 1,-1,-1, 1/
      DATA (NHEL(I, 206),I=1,8) /-1, 1,-1, 1, 1,-1,-1,-1/
      DATA (NHEL(I, 207),I=1,8) /-1, 1,-1, 1, 1,-1, 1, 1/
      DATA (NHEL(I, 208),I=1,8) /-1, 1,-1, 1, 1,-1, 1,-1/
      DATA (NHEL(I, 209),I=1,8) /-1, 1,-1,-1,-1, 1,-1, 1/
      DATA (NHEL(I, 210),I=1,8) /-1, 1,-1,-1,-1, 1,-1,-1/
      DATA (NHEL(I, 211),I=1,8) /-1, 1,-1,-1,-1, 1, 1, 1/
      DATA (NHEL(I, 212),I=1,8) /-1, 1,-1,-1,-1, 1, 1,-1/
      DATA (NHEL(I, 213),I=1,8) /-1, 1,-1,-1,-1,-1,-1, 1/
      DATA (NHEL(I, 214),I=1,8) /-1, 1,-1,-1,-1,-1,-1,-1/
      DATA (NHEL(I, 215),I=1,8) /-1, 1,-1,-1,-1,-1, 1, 1/
      DATA (NHEL(I, 216),I=1,8) /-1, 1,-1,-1,-1,-1, 1,-1/
      DATA (NHEL(I, 217),I=1,8) /-1, 1,-1,-1, 1, 1,-1, 1/
      DATA (NHEL(I, 218),I=1,8) /-1, 1,-1,-1, 1, 1,-1,-1/
      DATA (NHEL(I, 219),I=1,8) /-1, 1,-1,-1, 1, 1, 1, 1/
      DATA (NHEL(I, 220),I=1,8) /-1, 1,-1,-1, 1, 1, 1,-1/
      DATA (NHEL(I, 221),I=1,8) /-1, 1,-1,-1, 1,-1,-1, 1/
      DATA (NHEL(I, 222),I=1,8) /-1, 1,-1,-1, 1,-1,-1,-1/
      DATA (NHEL(I, 223),I=1,8) /-1, 1,-1,-1, 1,-1, 1, 1/
      DATA (NHEL(I, 224),I=1,8) /-1, 1,-1,-1, 1,-1, 1,-1/
      DATA (NHEL(I, 225),I=1,8) /-1, 1, 1, 1,-1, 1,-1, 1/
      DATA (NHEL(I, 226),I=1,8) /-1, 1, 1, 1,-1, 1,-1,-1/
      DATA (NHEL(I, 227),I=1,8) /-1, 1, 1, 1,-1, 1, 1, 1/
      DATA (NHEL(I, 228),I=1,8) /-1, 1, 1, 1,-1, 1, 1,-1/
      DATA (NHEL(I, 229),I=1,8) /-1, 1, 1, 1,-1,-1,-1, 1/
      DATA (NHEL(I, 230),I=1,8) /-1, 1, 1, 1,-1,-1,-1,-1/
      DATA (NHEL(I, 231),I=1,8) /-1, 1, 1, 1,-1,-1, 1, 1/
      DATA (NHEL(I, 232),I=1,8) /-1, 1, 1, 1,-1,-1, 1,-1/
      DATA (NHEL(I, 233),I=1,8) /-1, 1, 1, 1, 1, 1,-1, 1/
      DATA (NHEL(I, 234),I=1,8) /-1, 1, 1, 1, 1, 1,-1,-1/
      DATA (NHEL(I, 235),I=1,8) /-1, 1, 1, 1, 1, 1, 1, 1/
      DATA (NHEL(I, 236),I=1,8) /-1, 1, 1, 1, 1, 1, 1,-1/
      DATA (NHEL(I, 237),I=1,8) /-1, 1, 1, 1, 1,-1,-1, 1/
      DATA (NHEL(I, 238),I=1,8) /-1, 1, 1, 1, 1,-1,-1,-1/
      DATA (NHEL(I, 239),I=1,8) /-1, 1, 1, 1, 1,-1, 1, 1/
      DATA (NHEL(I, 240),I=1,8) /-1, 1, 1, 1, 1,-1, 1,-1/
      DATA (NHEL(I, 241),I=1,8) /-1, 1, 1,-1,-1, 1,-1, 1/
      DATA (NHEL(I, 242),I=1,8) /-1, 1, 1,-1,-1, 1,-1,-1/
      DATA (NHEL(I, 243),I=1,8) /-1, 1, 1,-1,-1, 1, 1, 1/
      DATA (NHEL(I, 244),I=1,8) /-1, 1, 1,-1,-1, 1, 1,-1/
      DATA (NHEL(I, 245),I=1,8) /-1, 1, 1,-1,-1,-1,-1, 1/
      DATA (NHEL(I, 246),I=1,8) /-1, 1, 1,-1,-1,-1,-1,-1/
      DATA (NHEL(I, 247),I=1,8) /-1, 1, 1,-1,-1,-1, 1, 1/
      DATA (NHEL(I, 248),I=1,8) /-1, 1, 1,-1,-1,-1, 1,-1/
      DATA (NHEL(I, 249),I=1,8) /-1, 1, 1,-1, 1, 1,-1, 1/
      DATA (NHEL(I, 250),I=1,8) /-1, 1, 1,-1, 1, 1,-1,-1/
      DATA (NHEL(I, 251),I=1,8) /-1, 1, 1,-1, 1, 1, 1, 1/
      DATA (NHEL(I, 252),I=1,8) /-1, 1, 1,-1, 1, 1, 1,-1/
      DATA (NHEL(I, 253),I=1,8) /-1, 1, 1,-1, 1,-1,-1, 1/
      DATA (NHEL(I, 254),I=1,8) /-1, 1, 1,-1, 1,-1,-1,-1/
      DATA (NHEL(I, 255),I=1,8) /-1, 1, 1,-1, 1,-1, 1, 1/
      DATA (NHEL(I, 256),I=1,8) /-1, 1, 1,-1, 1,-1, 1,-1/
      DATA IDEN/36/

C     To be able to control when the matrix<i> subroutine can add
C      entries to the grid for the MC over helicity configuration
      LOGICAL ALLOW_HELICITY_GRID_ENTRIES
      COMMON/TO_ALLOW_HELICITY_GRID_ENTRIES/ALLOW_HELICITY_GRID_ENTRIES

C     ----------
C     BEGIN CODE
C     ----------

      NTRY(IMIRROR)=NTRY(IMIRROR)+1
      THIS_NTRY(IMIRROR) = THIS_NTRY(IMIRROR)+1
      DO I=1,NEXTERNAL
        JC(I) = +1
      ENDDO

      IF (MULTI_CHANNEL) THEN
        DO I=1,NDIAGS
          AMP2(I)=0D0
        ENDDO
        JAMP2(0)=1
        DO I=1,INT(JAMP2(0))
          JAMP2(I)=0D0
        ENDDO
      ENDIF
      ANS = 0D0
      WRITE(HEL_BUFF,'(20I5)') (0,I=1,NEXTERNAL)
      DO I=1,NCOMB
        TS(I)=0D0
      ENDDO

        !   If the helicity grid status is 0, this means that it is not yet initialized.
        !   If HEL_PICKED==-1, this means that calls to other matrix<i> where in initialization mode as well for the helicity.
      IF ((ISHEL(IMIRROR).EQ.0.AND.ISUM_HEL.EQ.0).OR.(DS_GET_DIM_STATUS
     $('Helicity').EQ.0).OR.(HEL_PICKED.EQ.-1)) THEN
        DO I=1,NCOMB
          IF (GOODHEL(I,IMIRROR) .OR. NTRY(IMIRROR).LE.MAXTRIES.OR.(ISU
     $M_HEL.NE.0).OR.THIS_NTRY(IMIRROR).LE.2) THEN
            T=MATRIX48(P ,NHEL(1,I),JC(1))
            DO JJ=1,NINCOMING
              IF(POL(JJ).NE.1D0.AND.NHEL(JJ,I).EQ.INT(SIGN(1D0,POL(JJ))
     $         )) THEN
                T=T*ABS(POL(JJ))
              ELSE IF(POL(JJ).NE.1D0)THEN
                T=T*(2D0-ABS(POL(JJ)))
              ENDIF
            ENDDO
            IF (ISUM_HEL.NE.0.AND.DS_GET_DIM_STATUS('Helicity')
     $       .EQ.0.AND.ALLOW_HELICITY_GRID_ENTRIES) THEN
              CALL DS_ADD_ENTRY('Helicity',I,T)
            ENDIF
            ANS=ANS+DABS(T)
            TS(I)=T
          ENDIF
        ENDDO
        IF(NTRY(IMIRROR).EQ.(MAXTRIES+1)) THEN
          CALL RESET_CUMULATIVE_VARIABLE()  ! avoid biais of the initialization
        ENDIF
        IF (ISUM_HEL.NE.0) THEN
            !         We set HEL_PICKED to -1 here so that later on, the call to DS_add_point in dsample.f does not add anything to the grid since it was already done here.
          HEL_PICKED = -1
            !         For safety, hardset the helicity sampling jacobian to 0.0d0 to make sure it is not .
          HEL_JACOBIAN   = 1.0D0
            !         We don't want to re-update the helicity grid if it was already updated by another matrix<i>, so we make sure that the reference grid is empty.
          REF_HELICITY_GRID = DS_GET_DIMENSION(REF_GRID,'Helicity')
          IF((DS_GET_DIM_STATUS('Helicity').EQ.1).AND.(REF_HELICITY_GRI
     $D%N_TOT_ENTRIES.EQ.0)) THEN
              !           If we finished the initialization we can update the grid so as to start sampling over it.
              !           However the grid will now be filled by dsample with different kind of weights (including pdf, flux, etc...) so by setting the grid_mode of the reference grid to 'initialization' we make sure it will be overwritten (as opposed to 'combined') by the running grid at the next update.
            CALL DS_UPDATE_GRID('Helicity')
            CALL DS_SET_GRID_MODE('Helicity','init')
          ENDIF
        ELSE
          JHEL(IMIRROR) = 1
          IF(NTRY(IMIRROR).LE.MAXTRIES.OR.THIS_NTRY(IMIRROR).LE.2)THEN
            DO I=1,NCOMB
              IF (.NOT.GOODHEL(I,IMIRROR) .AND. (DABS(TS(I)).GT.ANS
     $         *LIMHEL/NCOMB)) THEN
                GOODHEL(I,IMIRROR)=.TRUE.
                NGOOD(IMIRROR) = NGOOD(IMIRROR) +1
                IGOOD(NGOOD(IMIRROR),IMIRROR) = I
                PRINT *,'Added good helicity ',I,TS(I)*NCOMB/ANS,' in'
     $           //' event ',NTRY(IMIRROR), 'local:',THIS_NTRY(IMIRROR)
              ENDIF
            ENDDO
          ENDIF
          IF(NTRY(IMIRROR).EQ.MAXTRIES)THEN
            ISHEL(IMIRROR)=MIN(ISUM_HEL,NGOOD(IMIRROR))
          ENDIF
        ENDIF
      ELSE  ! random helicity 
C       The helicity configuration was chosen already by genps and put
C        in a common block defined in genps.inc.
        I = HEL_PICKED

        T=MATRIX48(P ,NHEL(1,I),JC(1))

        DO JJ=1,NINCOMING
          IF(POL(JJ).NE.1D0.AND.NHEL(JJ,I).EQ.INT(SIGN(1D0,POL(JJ))))
     $      THEN
            T=T*ABS(POL(JJ))
          ELSE IF(POL(JJ).NE.1D0)THEN
            T=T*(2D0-ABS(POL(JJ)))
          ENDIF
        ENDDO
C       Always one helicity at a time
        ANS = T
C       Include the Jacobian from helicity sampling
        ANS = ANS * HEL_JACOBIAN

        WRITE(HEL_BUFF,'(20i5)')(NHEL(II,I),II=1,NEXTERNAL)
      ENDIF
      IF (ANS.NE.0D0.AND.(ISUM_HEL .NE. 1.OR.HEL_PICKED.EQ.-1)) THEN
        CALL RANMAR(R)
        SUMHEL=0D0
        DO I=1,NCOMB
          SUMHEL=SUMHEL+DABS(TS(I))/ANS
          IF(R.LT.SUMHEL)THEN
            WRITE(HEL_BUFF,'(20i5)')(NHEL(II,I),II=1,NEXTERNAL)
C           Set right sign for ANS, based on sign of chosen helicity
            ANS=DSIGN(ANS,TS(I))
            GOTO 10
          ENDIF
        ENDDO
 10     CONTINUE
      ENDIF
      IF (MULTI_CHANNEL) THEN
        XTOT=0D0
        DO I=1,NDIAGS
          XTOT=XTOT+AMP2(I)
        ENDDO
        IF (XTOT.NE.0D0) THEN
          ANS=ANS*AMP2(SUBDIAG(48))/XTOT
        ELSE IF(ANS.NE.0D0) THEN
          WRITE(*,*) 'Problem in the multi-channeling. All amp2 are'
     $     //' zero but not the total matrix-element'
          STOP 1
        ENDIF
      ENDIF
      ANS=ANS/DBLE(IDEN)
      END


      REAL*8 FUNCTION MATRIX48(P,NHEL,IC)
C     
C     Generated by MadGraph5_aMC@NLO v. 2.6.6, 2018-06-28
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     Returns amplitude squared summed/avg over colors
C     for the point with external lines W(0:6,NEXTERNAL)
C     
C     Process: c d~ > w+ x0 QNP<=2 WEIGHTED<=4 @1
C     *   Decay: w+ > c s~ QNP<=2 WEIGHTED<=2
C     *   Decay: x0 > e- e+ s s~ QNP<=2 WEIGHTED<=6
C     Process: c d~ > w+ x0 QNP<=2 WEIGHTED<=4 @1
C     *   Decay: w+ > c s~ QNP<=2 WEIGHTED<=2
C     *   Decay: x0 > mu- mu+ s s~ QNP<=2 WEIGHTED<=6
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NGRAPHS
      PARAMETER (NGRAPHS=10)
      INCLUDE 'genps.inc'
      INCLUDE 'nexternal.inc'
      INCLUDE 'maxamps.inc'
      INTEGER    NWAVEFUNCS,     NCOLOR
      PARAMETER (NWAVEFUNCS=11, NCOLOR=1)
      REAL*8     ZERO
      PARAMETER (ZERO=0D0)
      COMPLEX*16 IMAG1
      PARAMETER (IMAG1=(0D0,1D0))
      INTEGER NAMPSO, NSQAMPSO
      PARAMETER (NAMPSO=1, NSQAMPSO=1)
      LOGICAL CHOSEN_SO_CONFIGS(NSQAMPSO)
      DATA CHOSEN_SO_CONFIGS/.TRUE./
      SAVE CHOSEN_SO_CONFIGS
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL)
      INTEGER NHEL(NEXTERNAL), IC(NEXTERNAL)
C     
C     LOCAL VARIABLES 
C     
      INTEGER I,J,M,N
      COMPLEX*16 ZTEMP
      REAL*8 DENOM(NCOLOR), CF(NCOLOR,NCOLOR)
      COMPLEX*16 AMP(NGRAPHS), JAMP(NCOLOR,NAMPSO)
      COMPLEX*16 W(18,NWAVEFUNCS)
C     Needed for v4 models
      COMPLEX*16 DUM0,DUM1
      DATA DUM0, DUM1/(0D0, 0D0), (1D0, 0D0)/

      DOUBLE PRECISION FK_MDL_WX0
      DOUBLE PRECISION FK_MDL_WZ
      DOUBLE PRECISION FK_ZERO
      DOUBLE PRECISION FK_MDL_WW
      SAVE FK_MDL_WX0
      SAVE FK_MDL_WZ
      SAVE FK_ZERO
      SAVE FK_MDL_WW

      LOGICAL FIRST
      DATA FIRST /.TRUE./
      SAVE FIRST
C     
C     FUNCTION
C     
      INTEGER SQSOINDEX48
C     
C     GLOBAL VARIABLES
C     
      DOUBLE PRECISION AMP2(MAXAMPS), JAMP2(0:MAXFLOW)
      COMMON/TO_AMPS/  AMP2,       JAMP2
      INCLUDE 'coupl.inc'

      DOUBLE PRECISION SMALL_WIDTH_TREATMENT
      COMMON/NARROW_WIDTH/SMALL_WIDTH_TREATMENT
C     
C     COLOR DATA
C     
      DATA DENOM(1)/1/
      DATA (CF(I,  1),I=  1,  1) /   27/
C     1 T(2,1) T(3,4) T(7,8)
C     ----------
C     BEGIN CODE
C     ----------
      IF (FIRST) THEN
        FIRST=.FALSE.
        FK_MDL_WX0 = SIGN(MAX(ABS(MDL_WX0), ABS(MDL_MX0
     $   *SMALL_WIDTH_TREATMENT)), MDL_WX0)
        FK_MDL_WW = SIGN(MAX(ABS(MDL_WW), ABS(MDL_MW
     $   *SMALL_WIDTH_TREATMENT)), MDL_WW)
        FK_MDL_WZ = SIGN(MAX(ABS(MDL_WZ), ABS(MDL_MZ
     $   *SMALL_WIDTH_TREATMENT)), MDL_WZ)
        FK_ZERO = SIGN(MAX(ABS(ZERO), ABS(ZERO*SMALL_WIDTH_TREATMENT))
     $   , ZERO)
      ENDIF


      CALL IXXXXX(P(0,1),ZERO,NHEL(1),+1*IC(1),W(1,1))
      CALL OXXXXX(P(0,2),ZERO,NHEL(2),-1*IC(2),W(1,2))
      CALL OXXXXX(P(0,3),ZERO,NHEL(3),+1*IC(3),W(1,3))
      CALL IXXXXX(P(0,4),ZERO,NHEL(4),-1*IC(4),W(1,4))
      CALL FFV3_3(W(1,4),W(1,3),GC_76,MDL_MW, FK_MDL_WW,W(1,5))
      CALL OXXXXX(P(0,5),ZERO,NHEL(5),+1*IC(5),W(1,4))
      CALL IXXXXX(P(0,6),ZERO,NHEL(6),-1*IC(6),W(1,3))
      CALL OXXXXX(P(0,7),ZERO,NHEL(7),+1*IC(7),W(1,6))
      CALL IXXXXX(P(0,8),ZERO,NHEL(8),-1*IC(8),W(1,7))
      CALL FFV1P0_3(W(1,3),W(1,4),GC_3,ZERO, FK_ZERO,W(1,8))
      CALL FFV1P0_3(W(1,7),W(1,6),GC_1,ZERO, FK_ZERO,W(1,9))
      CALL VVS3_6_3(W(1,8),W(1,9),GC_61,GC_9,MDL_MX0, FK_MDL_WX0,W(1
     $ ,10))
      CALL FFV3_3(W(1,1),W(1,2),GC_109,MDL_MW, FK_MDL_WW,W(1,11))
C     Amplitude(s) for diagram number 1
      CALL VVS4_0(W(1,11),W(1,5),W(1,10),GC_99,AMP(1))
      CALL FFV3_4_3(W(1,7),W(1,6),GC_77,GC_89,MDL_MZ, FK_MDL_WZ,W(1,2))
      CALL VVS1_5_6_3(W(1,8),W(1,2),GC_66,GC_38,GC_16,MDL_MX0,
     $  FK_MDL_WX0,W(1,7))
C     Amplitude(s) for diagram number 2
      CALL VVS4_0(W(1,11),W(1,5),W(1,7),GC_99,AMP(2))
      CALL FFV3_5_3(W(1,3),W(1,4),GC_77,GC_90,MDL_MZ, FK_MDL_WZ,W(1,8))
      CALL VVS1_5_6_3(W(1,9),W(1,8),GC_66,GC_38,GC_16,MDL_MX0,
     $  FK_MDL_WX0,W(1,3))
C     Amplitude(s) for diagram number 3
      CALL VVS4_0(W(1,11),W(1,5),W(1,3),GC_99,AMP(3))
      CALL VVS4_3(W(1,8),W(1,2),GC_100,MDL_MX0, FK_MDL_WX0,W(1,9))
C     Amplitude(s) for diagram number 4
      CALL VVS4_0(W(1,11),W(1,5),W(1,9),GC_99,AMP(4))
      CALL VVS3_6_8_3(W(1,8),W(1,2),GC_68,GC_42,GC_40,MDL_MX0,
     $  FK_MDL_WX0,W(1,4))
C     Amplitude(s) for diagram number 5
      CALL VVS4_0(W(1,11),W(1,5),W(1,4),GC_99,AMP(5))
C     Amplitude(s) for diagram number 6
      CALL VVS1_5_6_7_0(W(1,11),W(1,5),W(1,10),GC_67,GC_39,GC_41
     $ ,GC_111,AMP(6))
C     Amplitude(s) for diagram number 7
      CALL VVS1_5_6_7_0(W(1,11),W(1,5),W(1,7),GC_67,GC_39,GC_41,GC_111
     $ ,AMP(7))
C     Amplitude(s) for diagram number 8
      CALL VVS1_5_6_7_0(W(1,11),W(1,5),W(1,3),GC_67,GC_39,GC_41,GC_111
     $ ,AMP(8))
C     Amplitude(s) for diagram number 9
      CALL VVS1_5_6_7_0(W(1,11),W(1,5),W(1,9),GC_67,GC_39,GC_41,GC_111
     $ ,AMP(9))
C     Amplitude(s) for diagram number 10
      CALL VVS1_5_6_7_0(W(1,11),W(1,5),W(1,4),GC_67,GC_39,GC_41,GC_111
     $ ,AMP(10))
C     JAMPs contributing to orders ALL_ORDERS=1
      JAMP(1,1)=-AMP(1)-AMP(2)-AMP(3)-AMP(4)-AMP(5)-AMP(6)-AMP(7)
     $ -AMP(8)-AMP(9)-AMP(10)

      MATRIX48 = 0.D0
      DO M = 1, NAMPSO
        DO I = 1, NCOLOR
          ZTEMP = (0.D0,0.D0)
          DO J = 1, NCOLOR
            ZTEMP = ZTEMP + CF(J,I)*JAMP(J,M)
          ENDDO
          DO N = 1, NAMPSO
            IF (CHOSEN_SO_CONFIGS(SQSOINDEX48(M,N))) THEN
              MATRIX48 = MATRIX48 + ZTEMP*DCONJG(JAMP(I,N))/DENOM(I)
            ENDIF
          ENDDO
        ENDDO
      ENDDO

      AMP2(1)=AMP2(1)+(AMP(1)+AMP(6))*DCONJG(AMP(1)+AMP(6))
      AMP2(2)=AMP2(2)+(AMP(2)+AMP(7))*DCONJG(AMP(2)+AMP(7))
      AMP2(3)=AMP2(3)+(AMP(3)+AMP(8))*DCONJG(AMP(3)+AMP(8))
      AMP2(4)=AMP2(4)+(AMP(4)+AMP(5)+AMP(9)+AMP(10))*DCONJG(AMP(4)
     $ +AMP(5)+AMP(9)+AMP(10))
      DO I = 1, NCOLOR
        DO M = 1, NAMPSO
          DO N = 1, NAMPSO
            IF (CHOSEN_SO_CONFIGS(SQSOINDEX48(M,N))) THEN
              JAMP2(I)=JAMP2(I)+DABS(DBLE(JAMP(I,M)*DCONJG(JAMP(I,N))))
            ENDIF
          ENDDO
        ENDDO
      ENDDO

      END

C     Set of functions to handle the array indices of the split orders


      INTEGER FUNCTION SQSOINDEX48(ORDERINDEXA, ORDERINDEXB)
C     
C     This functions plays the role of the interference matrix. It can
C      be hardcoded or 
C     made more elegant using hashtables if its execution speed ever
C      becomes a relevant
C     factor. From two split order indices, it return the
C      corresponding index in the squared 
C     order canonical ordering.
C     
C     CONSTANTS
C     

      INTEGER    NSO, NSQUAREDSO, NAMPSO
      PARAMETER (NSO=1, NSQUAREDSO=1, NAMPSO=1)
C     
C     ARGUMENTS
C     
      INTEGER ORDERINDEXA, ORDERINDEXB
C     
C     LOCAL VARIABLES
C     
      INTEGER I, SQORDERS(NSO)
      INTEGER AMPSPLITORDERS(NAMPSO,NSO)
      DATA (AMPSPLITORDERS(  1,I),I=  1,  1) /    1/
      COMMON/AMPSPLITORDERS48/AMPSPLITORDERS
C     
C     FUNCTION
C     
      INTEGER SOINDEX_FOR_SQUARED_ORDERS48
C     
C     BEGIN CODE
C     
      DO I=1,NSO
        SQORDERS(I)=AMPSPLITORDERS(ORDERINDEXA,I)+AMPSPLITORDERS(ORDERI
     $NDEXB,I)
      ENDDO
      SQSOINDEX48=SOINDEX_FOR_SQUARED_ORDERS48(SQORDERS)
      END

      INTEGER FUNCTION SOINDEX_FOR_SQUARED_ORDERS48(ORDERS)
C     
C     This functions returns the integer index identifying the squared
C      split orders list passed in argument which corresponds to the
C      values of the following list of couplings (and in this order).
C     []
C     
C     CONSTANTS
C     
      INTEGER    NSO, NSQSO, NAMPSO
      PARAMETER (NSO=1, NSQSO=1, NAMPSO=1)
C     
C     ARGUMENTS
C     
      INTEGER ORDERS(NSO)
C     
C     LOCAL VARIABLES
C     
      INTEGER I,J
      INTEGER SQSPLITORDERS(NSQSO,NSO)
      DATA (SQSPLITORDERS(  1,I),I=  1,  1) /    2/
      COMMON/SQPLITORDERS48/SQPLITORDERS
C     
C     BEGIN CODE
C     
      DO I=1,NSQSO
        DO J=1,NSO
          IF (ORDERS(J).NE.SQSPLITORDERS(I,J)) GOTO 1009
        ENDDO
        SOINDEX_FOR_SQUARED_ORDERS48 = I
        RETURN
 1009   CONTINUE
      ENDDO

      WRITE(*,*) 'ERROR:: Stopping in function'
      WRITE(*,*) 'SOINDEX_FOR_SQUARED_ORDERS48'
      WRITE(*,*) 'Could not find squared orders ',(ORDERS(I),I=1,NSO)
      STOP

      END

      SUBROUTINE GET_NSQSO_BORN48(NSQSO)
C     
C     Simple subroutine returning the number of squared split order
C     contributions returned when calling smatrix_split_orders 
C     

      INTEGER    NSQUAREDSO
      PARAMETER  (NSQUAREDSO=1)

      INTEGER NSQSO

      NSQSO=NSQUAREDSO

      END

C     This is the inverse subroutine of SOINDEX_FOR_SQUARED_ORDERS.
C      Not directly useful, but provided nonetheless.
      SUBROUTINE GET_SQUARED_ORDERS_FOR_SOINDEX48(SOINDEX,ORDERS)
C     
C     This functions returns the orders identified by the squared
C      split order index in argument. Order values correspond to
C      following list of couplings (and in this order):
C     []
C     
C     CONSTANTS
C     
      INTEGER    NSO, NSQSO
      PARAMETER (NSO=1, NSQSO=1)
C     
C     ARGUMENTS
C     
      INTEGER SOINDEX, ORDERS(NSO)
C     
C     LOCAL VARIABLES
C     
      INTEGER I
      INTEGER SQPLITORDERS(NSQSO,NSO)
      COMMON/SQPLITORDERS48/SQPLITORDERS
C     
C     BEGIN CODE
C     
      IF (SOINDEX.GT.0.AND.SOINDEX.LE.NSQSO) THEN
        DO I=1,NSO
          ORDERS(I) =  SQPLITORDERS(SOINDEX,I)
        ENDDO
        RETURN
      ENDIF

      WRITE(*,*) 'ERROR:: Stopping function GET_SQUARED_ORDERS_FOR_SOIN'
     $ //'DEX48'
      WRITE(*,*) 'Could not find squared orders index ',SOINDEX
      STOP

      END SUBROUTINE

C     This is the inverse subroutine of getting amplitude SO orders.
C      Not directly useful, but provided nonetheless.
      SUBROUTINE GET_ORDERS_FOR_AMPSOINDEX48(SOINDEX,ORDERS)
C     
C     This functions returns the orders identified by the split order
C      index in argument. Order values correspond to following list of
C      couplings (and in this order):
C     []
C     
C     CONSTANTS
C     
      INTEGER    NSO, NAMPSO
      PARAMETER (NSO=1, NAMPSO=1)
C     
C     ARGUMENTS
C     
      INTEGER SOINDEX, ORDERS(NSO)
C     
C     LOCAL VARIABLES
C     
      INTEGER I
      INTEGER AMPSPLITORDERS(NAMPSO,NSO)
      COMMON/AMPSPLITORDERS48/AMPSPLITORDERS
C     
C     BEGIN CODE
C     
      IF (SOINDEX.GT.0.AND.SOINDEX.LE.NAMPSO) THEN
        DO I=1,NSO
          ORDERS(I) =  AMPSPLITORDERS(SOINDEX,I)
        ENDDO
        RETURN
      ENDIF

      WRITE(*,*) 'ERROR:: Stopping function GET_ORDERS_FOR_AMPSOINDEX48'
     $ //''
      WRITE(*,*) 'Could not find amplitude split orders index ',SOINDEX
      STOP

      END SUBROUTINE

C     This function is not directly useful, but included for
C      completeness
      INTEGER FUNCTION SOINDEX_FOR_AMPORDERS48(ORDERS)
C     
C     This functions returns the integer index identifying the
C      amplitude split orders passed in argument which correspond to
C      the values of the following list of couplings (and in this
C      order):
C     []
C     
C     CONSTANTS
C     
      INTEGER    NSO, NAMPSO
      PARAMETER (NSO=1, NAMPSO=1)
C     
C     ARGUMENTS
C     
      INTEGER ORDERS(NSO)
C     
C     LOCAL VARIABLES
C     
      INTEGER I,J
      INTEGER AMPSPLITORDERS(NAMPSO,NSO)
      COMMON/AMPSPLITORDERS48/AMPSPLITORDERS
C     
C     BEGIN CODE
C     
      DO I=1,NAMPSO
        DO J=1,NSO
          IF (ORDERS(J).NE.AMPSPLITORDERS(I,J)) GOTO 1009
        ENDDO
        SOINDEX_FOR_AMPORDERS48 = I
        RETURN
 1009   CONTINUE
      ENDDO

      WRITE(*,*) 'ERROR:: Stopping function SOINDEX_FOR_AMPORDERS48'
      WRITE(*,*) 'Could not find squared orders ',(ORDERS(I),I=1,NSO)
      STOP

      END

