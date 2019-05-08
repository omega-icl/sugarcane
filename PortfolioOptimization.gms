
***             Single-Sugarcane Mill Optimization - PWL  ***
*********************************************************************************

*********************************  Sets  ****************************************

Sets
  i resources  /sug, eth, fert, fre, reg, cane, jui, mol, bag, vin, el-r, el-c, el-b, et2g/
  ii(i) products  /sug, eth, fert, fre, reg, cane, jui, mol, bag, vin, el-r, el-c, el-b, et2g/
  j(i) saleable products /sug, eth, fert, fre, reg/
  l(i) bagasse scenarios /el-r, el-c, et2g/
  u processes /mill, fact, dist, hydro, treat, rank, cond, biog/
  uu(u) investment options /hydro, rank, cond, biog/
  k breakpoints of juice fraction /1*11/
  kk(k) subset of breakpoints /2*11/
  kkk(kk) subsubset of breakpoints /2*10/
  q price time observation  / t1*t868/
  o commodity /p_fr, p_su, p_et/;

********************************  Parameters ************************************

SCALARS

price_reg Price Scenarios for Regulated Market /72.5/
min_profit Minimum Expected Profit used to build the Pareto Frontier /66256143.82/

Ca Annual sugarcane processed /3000000/
beta Confidence level /0.90/
N Number of scenarios /868/
;


Parameters M(u) Maximum Annual Capacity of process u
       / mill   3000000
         fact   1541400
         dist   2202000
         treat  100000000
         rank   200000
         cond   305000
         hydro  60000
         biog   26000
       /;
**Here maximum capacity for the sugar factory is at 70% of the total juice processed.

Parameters IC(uu) cost of investment option uu
        /
         hydro 44433000
         rank  0
         cond  5524301.58
         biog  1029907.15
        /;

Parameters PC(j) production costs of product j
       / sug   321.92
         eth   502.01
         fert  0.00054
         fre   1.98
         reg   1.98
       /;

Table theta(i,u,ii) production conversion rates from resource i used in process u to produce product ii
                 sug     eth     fert     fre     reg    cane    jui     mol     bag     vin     el-r    el-c    el-b    et2g
        sug.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        sug.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        sug.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        sug.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        sug.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        sug.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        sug.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        sug.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        eth.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        eth.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        eth.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        eth.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        eth.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        eth.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        eth.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        eth.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       fert.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       fert.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       fert.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       fert.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       fert.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       fert.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       fert.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       fert.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        fre.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        fre.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        fre.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        fre.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        fre.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        fre.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        fre.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        fre.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        reg.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        reg.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        reg.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        reg.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        reg.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        reg.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        reg.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        reg.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       cane.mill  0       0       0       0       0      0       0.734   0       0.266   0       0       0       0       0
       cane.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       cane.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       cane.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       cane.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       cane.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       cane.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       cane.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        jui.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        jui.fact  0.1227  0       0       0       0      0       0       0       0       0       0       0       0       0
        jui.dist  0       0.1226  0       0       0      0       0       0       0       0       0       0       0       0
        jui.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        jui.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        jui.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        jui.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        jui.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        mol.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        mol.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        mol.dist  0       0.373   0       0       0      0       0       0       0       0       0       0       0       0
        mol.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        mol.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        mol.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        mol.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        mol.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        bag.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        bag.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        bag.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        bag.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        bag.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        bag.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        bag.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        bag.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        vin.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        vin.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        vin.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        vin.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
        vin.treat 0       0       1       0       0      0       0       0       0       0       0       0       0       0
        vin.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        vin.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
        vin.biog  0       0       0       0       0      0       0       0       0       0       0       0       0.0329  0
       el-r.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-r.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-r.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-r.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-r.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-r.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-r.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-r.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-c.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-c.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-c.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-c.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-c.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-c.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-c.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-c.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-b.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-b.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-b.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-b.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-b.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-b.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-b.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       el-b.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       et2g.mill  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       et2g.fact  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       et2g.dist  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       et2g.hydro 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       et2g.treat 0       0       0       0       0      0       0       0       0       0       0       0       0       0
       et2g.rank  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       et2g.cond  0       0       0       0       0      0       0       0       0       0       0       0       0       0
       et2g.biog  0       0       0       0       0      0       0       0       0       0       0       0       0       0

;

Table gamma(u,i) generation of resource (by-product) i in process u
                sug eth fert    fre    reg    cane     jui     mol     bag     vin     el-r     el-c   el-b
         mill   0   0   0       0       0       0       0       0       0       0       0       0       0
         fact   0   0   0       0       0       0       0       1.05    0       0       0       0       0
         dist   0   0   0       0       0       0       0       0       0       10      0       0       0
         hydro  0   0   0       0       0       0       0       0       0       0       0       0       0
         treat  0   0   0       0       0       0       0       0       0       0       0       0       0
         rank   0   0   0       0       0       0       0       0       0       0       0       0       0
         cond   0   0   0       0       0       0       0       0       0       0       0       0       0
         biog   0   0   0       0       0       0       0       0       0       0       0       0       0;

Table p_hat(k,l) linear coefficient for equation l in configuration for the use of bagasse k
                 el-r    el-c            et2g
         1    159751.18  248693.08       38185.01
         2    162949.07  248143.76       36568.61
         3    158476.52  248935.88       38829.31
         4    153680.05  249806.67       41253.74
         5    148630.44  250672.07       43806.19
         6    144014.18  251506.29       46139.57
         7    141974.18  251863.26       47170.70
         8    151740.19  250130.61       42234.34
         9    161504.85  248402.82       37298.59
         10   171264.61  246580.31       32365.39
         11   188235.00  243668.84       23787.41
;

Parameters f(k) fraction of juice at breakpoint k
       / 1       0
         2       0.10
         3       0.20
         4       0.30
         5       0.40
         6       0.50
         7       0.60
         8       0.70
         9       0.80
         10      0.90
         11      1.00
       /;

Table HP(q, o) q price observation of each commodity o
$Include prices_historical.txt
;


*********************************  Variables  ***********************************
FREE VARIABLES Profit(q), Shortfall(q), alpha, CVaR, EP, Result ;

POSITIVE VARIABLES p(i), r(i,u), csi(kk);

INTEGER VARIABLES z(uu);

BINARY VARIABLES y(kkk);


EQUATIONS OBJ, EQPROFIT1, EQPROFIT2, EQCVaR1, EQCVaR2(q),EQCVaR3(q),EQCVaR4(q),
EQ_MILL_1,EQ_MILL_2,
EQ_JU_1, EQ_JU_2, EQ_JU_3,
EQ_SU_1, EQ_SU_2,
EQ_ET_1, EQ_ET_2,
EQ_VIN_1, EQ_VIN_2, EQ_VIN_3, EQ_VIN_4,
EQ_INV_0, EQ_INV_1,EQ_INV_2, EQ_INV_3, EQ_INV_4(uu),
EQ_ELEC_1,
EQ_PWL_0, EQ_PWL_1, EQ_PWL_2, EQ_PWL_3,
EQ_PWL_4_1, EQ_PWL_4_2, EQ_PWL_4_3, EQ_PWL_4_4, EQ_PWL_4_5, EQ_PWL_4_6, EQ_PWL_4_7, EQ_PWL_4_8, EQ_PWL_4_9, EQ_PWL_4_10,
EQ_PWL_5_1, EQ_PWL_5_2, EQ_PWL_5_3, EQ_PWL_5_4, EQ_PWL_5_5, EQ_PWL_5_6, EQ_PWL_5_7, EQ_PWL_5_8, EQ_PWL_5_9, EQ_PWL_5_10, EQ_PWL_5_11,
EQ_PWL_5_12, EQ_PWL_5_13, EQ_PWL_5_14, EQ_PWL_5_15, EQ_PWL_5_16, EQ_PWL_5_17, EQ_PWL_5_18
;


*********************************  Equations  ***********************************
OBJ.. CVaR =E= Result;

*****Equation to Calculate Profit************************************************
EQCVaR1.. CVaR =E= alpha - ((1/(N*(1-beta)))*sum[q, Shortfall(q)]);

***************** CVaR constraints***********************************************
EQCVaR2(q).. Shortfall(q) =G= 0;
EQCVaR3(q).. Profit(q) =E= p('sug')*HP(q,'p_su') + p('eth')*HP(q,'p_et') + p('fre')*HP(q,'p_fr') + p('reg')*price_reg - sum[j, p(j)*PC(j)] - sum[uu, IC(uu)*z(uu)];
EQCVaR4(q).. Profit(q) + Shortfall(q) - alpha  =G= 0;

*****Equation to Calculate Profit**************************************
EQPROFIT1.. EP =E= (1/N)*sum[q, Profit(q)];
EQPROFIT2.. EP =G= min_profit ;

*************** Operational Constraints*****************************************

**********************************************************************************
EQ_MILL_1.. p('jui')=E= Ca*theta('cane','mill','jui');
EQ_MILL_2.. p('bag') =E= Ca*theta('cane','mill','bag');

**************************The use of juice*******************************
EQ_JU_1.. p('jui') =E= r('jui','fact') + r('jui','dist');
EQ_JU_2.. r('jui','fact') =L= M('fact');
EQ_JU_3.. r('jui','dist') =L= M('dist');

**************************Sugar Factory***************************************
EQ_SU_1.. p('sug') =E= theta('jui','fact','sug')*r('jui','fact');
EQ_SU_2.. p('mol')=E= gamma('fact','mol')*p('sug');

**************************Ethanol Production*************************************
EQ_ET_1.. p('eth') =E= theta('jui','dist','eth')*r('jui','dist') + theta('mol','dist','eth')*p('mol') + p('et2g');
EQ_ET_2.. p('vin') =E= gamma('dist', 'vin')*p('eth');

*************************Vinasse's Use*********************************************
EQ_VIN_1.. p('vin')=E= r('vin', 'treat') + r('vin','biog');
EQ_VIN_2.. p('fert') =E= theta('vin','treat','fert')*r('vin', 'treat');
EQ_VIN_3.. p('el-b') =E= theta('vin','biog','el-b')*r('vin', 'biog');
EQ_VIN_4.. p('el-b') =L= M('biog')*z('biog');

**************************Investment Decisions **********************************
EQ_INV_0.. 1 =E= z('rank') + z('cond') + z('hydro');
EQ_INV_1.. p('el-r') =L= M('rank')*(z('rank')+z('hydro'));
EQ_INV_2.. p('el-c') =L= M('cond')*z('cond');
EQ_INV_3.. p('et2g') =L= M('hydro')*z('hydro');
EQ_INV_4(uu).. z(uu) =G= 0;

**************************Sales of Electricity **********************************
EQ_ELEC_1.. p('fre')+ p('reg')=L= p('el-r') + p('el-c') + p('el-b');

***************PWL Equations for the use of surplus bagasse**********************
EQ_PWL_0.. r('jui','fact')/(Ca*theta('cane','mill','jui')) =E= f('1') + ((f('2')-f('1'))*csi('2')) + ((f('3')-f('2'))*csi('3')) + ((f('4')-f('3'))*csi('4')) + ((f('5')-f('4'))*csi('5')) + ((f('6')-f('5'))*csi('6')) + ((f('7')-f('6'))*csi('7')) + ((f('8')-f('7'))*csi('8')) + ((f('9')-f('8'))*csi('9')) + ((f('10')-f('9'))*csi('10')) + ((f('11')-f('10'))*csi('11'));
EQ_PWL_1.. p('el-r') =L= p_hat('1','el-r') + (csi('2')*(p_hat('2','el-r')- p_hat('1','el-r'))) + (csi('3')*(p_hat('3','el-r')- p_hat('2','el-r'))) + (csi('4')*(p_hat('4','el-r')- p_hat('3','el-r'))) + (csi('5')*(p_hat('5','el-r')- p_hat('4','el-r'))) + (csi('6')*(p_hat('6','el-r')- p_hat('5','el-r'))) + (csi('7')*(p_hat('7','el-r')- p_hat('6','el-r'))) + (csi('8')*(p_hat('8','el-r')- p_hat('7','el-r'))) + (csi('9')*(p_hat('9','el-r')- p_hat('8','el-r'))) + (csi('10')*(p_hat('10','el-r')- p_hat('9','el-r'))) + (csi('11')*(p_hat('11','el-r')- p_hat('10','el-r')));
EQ_PWL_2.. p('el-c') =L= p_hat('1','el-c') + (csi('2')*(p_hat('2','el-c')- p_hat('1','el-c'))) + (csi('3')*(p_hat('3','el-c')- p_hat('2','el-c'))) + (csi('4')*(p_hat('4','el-c')- p_hat('3','el-c'))) + (csi('5')*(p_hat('5','el-c')- p_hat('4','el-c'))) + (csi('6')*(p_hat('6','el-c')- p_hat('5','el-c'))) + (csi('7')*(p_hat('7','el-c')- p_hat('6','el-c'))) + (csi('8')*(p_hat('8','el-c')- p_hat('7','el-c'))) + (csi('9')*(p_hat('9','el-c')- p_hat('8','el-c'))) + (csi('10')*(p_hat('10','el-c')- p_hat('9','el-c'))) + (csi('11')*(p_hat('11','el-c')- p_hat('10','el-c')));
EQ_PWL_3.. p('et2g') =L= p_hat('1','et2g') + (csi('2')*(p_hat('2','et2g')- p_hat('1','et2g'))) + (csi('3')*(p_hat('3','et2g')- p_hat('2','et2g'))) + (csi('4')*(p_hat('4','et2g')- p_hat('3','et2g'))) + (csi('5')*(p_hat('5','et2g')- p_hat('4','et2g'))) + (csi('6')*(p_hat('6','et2g')- p_hat('5','et2g'))) + (csi('7')*(p_hat('7','et2g')- p_hat('6','et2g'))) + (csi('8')*(p_hat('8','et2g')- p_hat('7','et2g'))) + (csi('9')*(p_hat('9','et2g')- p_hat('8','et2g'))) + (csi('10')*(p_hat('10','et2g')- p_hat('9','et2g'))) + (csi('11')*(p_hat('11','et2g')- p_hat('10','et2g')));

EQ_PWL_4_1.. csi('2')=L= 1;
EQ_PWL_4_2.. csi('3')=L= 1;
EQ_PWL_4_3.. csi('4')=L= 1;
EQ_PWL_4_4.. csi('5')=L= 1;
EQ_PWL_4_5..  csi('6')=L= 1;
EQ_PWL_4_6..  csi('7')=L= 1;
EQ_PWL_4_7..  csi('8')=L= 1;
EQ_PWL_4_8..  csi('9')=L= 1;
EQ_PWL_4_9..  csi('10')=L= 1;
EQ_PWL_4_10..  csi('11')=L= 1;

EQ_PWL_5_1.. csi('2')=G= y('2');
EQ_PWL_5_2.. y('2') =G= csi('3');
EQ_PWL_5_3.. csi('3')=G= y('3');
EQ_PWL_5_4.. y('3') =G= csi('4');
EQ_PWL_5_5.. csi('4')=G= y('4');
EQ_PWL_5_6.. y('4') =G= csi('5');
EQ_PWL_5_7.. csi('5')=G= y('5');
EQ_PWL_5_8.. y('5') =G= csi('6');
EQ_PWL_5_9.. csi('6')=G= y('6');
EQ_PWL_5_10.. y('6') =G= csi('7');
EQ_PWL_5_11.. csi('7')=G= y('7');
EQ_PWL_5_12.. y('7') =G= csi('8');
EQ_PWL_5_13.. csi('8')=G= y('8');
EQ_PWL_5_14.. y('8') =G= csi('9');
EQ_PWL_5_15.. csi('9')=G= y('9');
EQ_PWL_5_16.. y('9') =G= csi('10');
EQ_PWL_5_17.. csi('10')=G= y('10');
EQ_PWL_5_18.. y('10') =G= csi('11');


**********************************  Solution  ***********************************
MODEL Problem / ALL /;
Option OptCR = 0.0000001;
SOLVE Problem USING MIP MAXIMIZING Result;

*********************************************************************************
