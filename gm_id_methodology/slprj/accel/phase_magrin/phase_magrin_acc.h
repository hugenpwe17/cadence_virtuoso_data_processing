#ifndef RTW_HEADER_phase_magrin_acc_h_
#define RTW_HEADER_phase_magrin_acc_h_
#ifndef phase_magrin_acc_COMMON_INCLUDES_
#define phase_magrin_acc_COMMON_INCLUDES_
#include <stdlib.h>
#define S_FUNCTION_NAME simulink_only_sfcn
#define S_FUNCTION_LEVEL 2
#ifndef RTW_GENERATED_S_FUNCTION
#define RTW_GENERATED_S_FUNCTION
#endif
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#endif
#include "phase_magrin_acc_types.h"
#include <stddef.h>
#include <float.h>
#include "mwmathutil.h"
#include "rt_defines.h"
typedef struct { real_T B_0_0_0 ; real_T B_0_2_0 ; real_T B_0_5_0 ; }
B_phase_magrin_T ; typedef struct { struct { real_T modelTStart ; }
TransportDelay_RWORK ; struct { void * TUbufferPtrs [ 2 ] ; }
TransportDelay_PWORK ; void * Scope_PWORK ; void * Scope1_PWORK ; void *
Scope2_PWORK ; struct { int_T Tail ; int_T Head ; int_T Last ; int_T
CircularBufSize ; int_T MaxNewBufSize ; } TransportDelay_IWORK ; char_T
pad_TransportDelay_IWORK [ 4 ] ; } DW_phase_magrin_T ; struct
P_phase_magrin_T_ { real_T P_0 ; real_T P_1 ; real_T P_2 ; real_T P_3 ;
real_T P_4 ; real_T P_5 ; real_T P_6 ; } ; extern P_phase_magrin_T
phase_magrin_rtDefaultP ;
#endif
