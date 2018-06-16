/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/craig robertson/Desktop/FPGB/FPGB/rtl/dma_engine.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {4U, 0U};
static unsigned int ng5[] = {32768U, 0U};
static int ng6[] = {0, 0};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {5U, 0U};
static unsigned int ng9[] = {6U, 0U};
static unsigned int ng10[] = {7U, 0U};
static unsigned int ng11[] = {8U, 0U};
static unsigned int ng12[] = {9U, 0U};
static unsigned int ng13[] = {10U, 0U};
static unsigned int ng14[] = {40960U, 0U};
static unsigned int ng15[] = {11U, 0U};
static unsigned int ng16[] = {12U, 0U};
static unsigned int ng17[] = {49152U, 0U};
static unsigned int ng18[] = {13U, 0U};
static unsigned int ng19[] = {53248U, 0U};
static int ng20[] = {1, 0};



static void Always_89_0(char *t0)
{
    char t6[8];
    char t7[8];
    char t14[8];
    char t25[8];
    char t42[8];
    char t43[8];
    char t44[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;

LAB0:    t1 = (t0 + 10368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 11432);
    *((int *)t2) = 1;
    t3 = (t0 + 10400);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(89, ng0);

LAB5:    xsi_set_current_line(91, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 3368);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 16);
    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(99, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9128);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 8488);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t4);
    t11 = (t10 & t9);
    t12 = (t11 & 3U);
    if (t12 != 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t5) != 0)
        goto LAB18;

LAB19:    t15 = (t0 + 8328);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memset(t14, 0, 8);
    t18 = (t17 + 4);
    t19 = *((unsigned int *)t18);
    t20 = (~(t19));
    t21 = *((unsigned int *)t17);
    t22 = (t21 & t20);
    t23 = (t22 & 3U);
    if (t23 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t18) != 0)
        goto LAB22;

LAB23:    t26 = (t0 + 8168);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memset(t25, 0, 8);
    t29 = (t28 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t28);
    t33 = (t32 & t31);
    t34 = (t33 & 3U);
    if (t34 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t29) != 0)
        goto LAB26;

LAB27:    xsi_vlogtype_concat(t6, 3, 3, 3U, t25, 1, t14, 1, t7, 1);

LAB6:    t36 = ((char*)((ng2)));
    t37 = xsi_vlog_unsigned_case_compare(t6, 3, t36, 3);
    if (t37 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t37 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t37 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t37 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t37 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(127, ng0);

LAB31:    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9128);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(103, ng0);

LAB28:    xsi_set_current_line(104, ng0);
    t38 = (t0 + 8648);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 3368);
    xsi_vlogvar_assign_value(t41, t40, 0, 0, 16);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    memset(t14, 0, 8);
    t3 = (t14 + 4);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 4);
    *((unsigned int *)t14) = t9;
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 4);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t12 & 15U);
    t19 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t19 & 15U);
    t13 = (t0 + 1368U);
    t15 = *((char **)t13);
    xsi_vlogtype_concat(t7, 16, 16, 3U, t15, 8, t14, 4, t2, 4);
    t13 = (t0 + 8008);
    t16 = (t13 + 56U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng1)));
    xsi_vlogtype_concat(t25, 16, 16, 2U, t18, 4, t17, 12);
    memset(t42, 0, 8);
    xsi_vlog_unsigned_add(t42, 16, t7, 16, t25, 16);
    t24 = (t0 + 3208);
    xsi_vlogvar_assign_value(t24, t42, 0, 0, 16);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(107, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(108, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(109, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB15;

LAB9:    xsi_set_current_line(111, ng0);

LAB29:    xsi_set_current_line(112, ng0);
    t3 = (t0 + 7688);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t13 = (t0 + 3368);
    xsi_vlogvar_assign_value(t13, t5, 0, 0, 16);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    memset(t14, 0, 8);
    t3 = (t14 + 4);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 4);
    *((unsigned int *)t14) = t9;
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 4);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t12 & 15U);
    t19 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t19 & 15U);
    t13 = (t0 + 1368U);
    t15 = *((char **)t13);
    xsi_vlogtype_concat(t7, 16, 16, 3U, t15, 8, t14, 4, t2, 4);
    t13 = (t0 + 8008);
    t16 = (t13 + 56U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng1)));
    xsi_vlogtype_concat(t25, 16, 16, 2U, t18, 4, t17, 12);
    memset(t42, 0, 8);
    xsi_vlog_unsigned_add(t42, 16, t7, 16, t25, 16);
    t24 = (t0 + 3208);
    xsi_vlogvar_assign_value(t24, t42, 0, 0, 16);
    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB15;

LAB11:    xsi_set_current_line(116, ng0);

LAB30:    xsi_set_current_line(117, ng0);
    t3 = (t0 + 7688);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t13 = (t0 + 8008);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng1)));
    xsi_vlogtype_concat(t7, 16, 16, 2U, t17, 4, t16, 12);
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 16, t5, 16, t7, 16);
    t18 = (t0 + 3368);
    xsi_vlogvar_assign_value(t18, t14, 0, 0, 16);
    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    memset(t14, 0, 8);
    t3 = (t14 + 4);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 4);
    *((unsigned int *)t14) = t9;
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 4);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t12 & 15U);
    t19 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t19 & 15U);
    t13 = (t0 + 1368U);
    t15 = *((char **)t13);
    xsi_vlogtype_concat(t7, 16, 16, 3U, t15, 8, t14, 4, t2, 4);
    t13 = (t0 + 8008);
    t16 = (t13 + 56U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng1)));
    xsi_vlogtype_concat(t25, 16, 16, 2U, t18, 4, t17, 12);
    memset(t42, 0, 8);
    xsi_vlog_unsigned_add(t42, 16, t7, 16, t25, 16);
    t24 = (t0 + 3208);
    xsi_vlogvar_assign_value(t24, t42, 0, 0, 16);
    xsi_set_current_line(119, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1848U);
    t4 = *((char **)t3);
    memset(t14, 0, 8);
    t3 = (t14 + 4);
    t5 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 4);
    *((unsigned int *)t14) = t9;
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 4);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t12 & 15U);
    t19 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t19 & 15U);
    t13 = (t0 + 1688U);
    t15 = *((char **)t13);
    memset(t25, 0, 8);
    t13 = (t25 + 4);
    t16 = (t15 + 4);
    t20 = *((unsigned int *)t15);
    t21 = (t20 >> 0);
    *((unsigned int *)t25) = t21;
    t22 = *((unsigned int *)t16);
    t23 = (t22 >> 0);
    *((unsigned int *)t13) = t23;
    t30 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t30 & 31U);
    t31 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t31 & 31U);
    t17 = ((char*)((ng4)));
    xsi_vlogtype_concat(t7, 16, 16, 4U, t17, 3, t25, 5, t14, 4, t2, 4);
    t18 = ((char*)((ng5)));
    memset(t42, 0, 8);
    xsi_vlog_unsigned_minus(t42, 16, t7, 16, t18, 16);
    t24 = (t0 + 7848);
    t26 = (t24 + 56U);
    t27 = *((char **)t26);
    t28 = ((char*)((ng1)));
    xsi_vlogtype_concat(t43, 16, 16, 2U, t28, 4, t27, 12);
    memset(t44, 0, 8);
    xsi_vlog_unsigned_add(t44, 16, t42, 16, t43, 16);
    t29 = (t0 + 3688);
    xsi_vlogvar_assign_value(t29, t44, 0, 0, 16);
    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 9288);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 9128);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB15;

LAB16:    *((unsigned int *)t7) = 1;
    goto LAB19;

LAB18:    t13 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB19;

LAB20:    *((unsigned int *)t14) = 1;
    goto LAB23;

LAB22:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB23;

LAB24:    *((unsigned int *)t25) = 1;
    goto LAB27;

LAB26:    t35 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB27;

}

static void Always_141_1(char *t0)
{
    char t4[8];
    char t22[8];
    char t25[8];
    char t38[8];
    char t46[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    int t21;
    char *t23;
    char *t24;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    int t70;
    int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;

LAB0:    t1 = (t0 + 10616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(141, ng0);
    t2 = (t0 + 11448);
    *((int *)t2) = 1;
    t3 = (t0 + 10648);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(141, ng0);

LAB5:    xsi_set_current_line(142, ng0);
    t5 = (t0 + 1208U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(153, ng0);

LAB14:    xsi_set_current_line(154, ng0);
    t2 = (t0 + 8168);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);

LAB15:    t6 = ((char*)((ng1)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 2, t6, 2);
    if (t21 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng2)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t21 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng3)));
    t21 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t21 == 1)
        goto LAB20;

LAB21:
LAB23:
LAB22:    xsi_set_current_line(191, ng0);

LAB71:    xsi_set_current_line(192, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB24:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(142, ng0);

LAB13:    xsi_set_current_line(143, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 8488);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 2, 0LL);
    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(146, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(147, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7688);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7528);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(151, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB12;

LAB16:    xsi_set_current_line(155, ng0);

LAB25:    xsi_set_current_line(156, ng0);
    t12 = (t0 + 2168U);
    t13 = *((char **)t12);
    memset(t4, 0, 8);
    t12 = (t13 + 4);
    t7 = *((unsigned int *)t12);
    t8 = (~(t7));
    t9 = *((unsigned int *)t13);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t12) != 0)
        goto LAB28;

LAB29:    t20 = (t4 + 4);
    t14 = *((unsigned int *)t4);
    t15 = *((unsigned int *)t20);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB30;

LAB31:    memcpy(t46, t4, 8);

LAB32:    t78 = (t46 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (~(t79));
    t81 = *((unsigned int *)t46);
    t82 = (t81 & t80);
    t83 = (t82 != 0);
    if (t83 > 0)
        goto LAB44;

LAB45:    xsi_set_current_line(159, ng0);

LAB48:    xsi_set_current_line(160, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB46:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 9448);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 7688);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 16, 0LL);
    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2008U);
    t6 = *((char **)t3);
    memset(t25, 0, 8);
    t3 = (t25 + 4);
    t12 = (t6 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (t7 >> 0);
    *((unsigned int *)t25) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 0);
    *((unsigned int *)t3) = t10;
    t11 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t11 & 127U);
    t14 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t14 & 127U);
    t13 = ((char*)((ng1)));
    xsi_vlogtype_concat(t22, 8, 8, 2U, t13, 1, t25, 7);
    t19 = ((char*)((ng2)));
    memset(t38, 0, 8);
    xsi_vlog_unsigned_add(t38, 8, t22, 8, t19, 8);
    xsi_vlogtype_concat(t4, 12, 12, 2U, t38, 8, t2, 4);
    t20 = (t0 + 7528);
    xsi_vlogvar_wait_assign_value(t20, t4, 0, 0, 12, 0LL);
    xsi_set_current_line(164, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    xsi_set_current_line(165, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(166, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    xsi_set_current_line(167, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB24;

LAB18:    xsi_set_current_line(169, ng0);

LAB49:    xsi_set_current_line(170, ng0);
    t3 = ((char*)((ng3)));
    t6 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t6, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(171, ng0);
    t2 = (t0 + 8008);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 12, t6, 12, t12, 12);
    t13 = (t0 + 8008);
    xsi_vlogvar_wait_assign_value(t13, t4, 0, 0, 12, 0LL);
    xsi_set_current_line(172, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 9288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB24;

LAB20:    xsi_set_current_line(174, ng0);

LAB50:    xsi_set_current_line(175, ng0);
    t3 = (t0 + 7848);
    t6 = (t3 + 56U);
    t12 = *((char **)t6);
    t13 = (t0 + 7528);
    t19 = (t13 + 56U);
    t20 = *((char **)t19);
    t23 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_minus(t4, 12, t20, 12, t23, 12);
    memset(t22, 0, 8);
    t24 = (t12 + 4);
    if (*((unsigned int *)t24) != 0)
        goto LAB52;

LAB51:    t26 = (t4 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB52;

LAB55:    if (*((unsigned int *)t12) < *((unsigned int *)t4))
        goto LAB53;

LAB54:    t37 = (t22 + 4);
    t7 = *((unsigned int *)t37);
    t8 = (~(t7));
    t9 = *((unsigned int *)t22);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB56;

LAB57:    xsi_set_current_line(179, ng0);

LAB60:    xsi_set_current_line(180, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(181, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB58:    xsi_set_current_line(184, ng0);
    t2 = (t0 + 8008);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 7528);
    t13 = (t12 + 56U);
    t19 = *((char **)t13);
    t20 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_minus(t4, 12, t19, 12, t20, 12);
    memset(t22, 0, 8);
    t23 = (t6 + 4);
    if (*((unsigned int *)t23) != 0)
        goto LAB62;

LAB61:    t24 = (t4 + 4);
    if (*((unsigned int *)t24) != 0)
        goto LAB62;

LAB65:    if (*((unsigned int *)t6) < *((unsigned int *)t4))
        goto LAB63;

LAB64:    t31 = (t22 + 4);
    t7 = *((unsigned int *)t31);
    t8 = (~(t7));
    t9 = *((unsigned int *)t22);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB66;

LAB67:    xsi_set_current_line(187, ng0);

LAB70:    xsi_set_current_line(188, ng0);
    t2 = (t0 + 8008);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = (t0 + 8008);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 12, 0LL);

LAB68:    goto LAB24;

LAB26:    *((unsigned int *)t4) = 1;
    goto LAB29;

LAB28:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB29;

LAB30:    t23 = (t0 + 2008U);
    t24 = *((char **)t23);
    memset(t25, 0, 8);
    t23 = (t25 + 4);
    t26 = (t24 + 4);
    t17 = *((unsigned int *)t24);
    t18 = (t17 >> 7);
    t27 = (t18 & 1);
    *((unsigned int *)t25) = t27;
    t28 = *((unsigned int *)t26);
    t29 = (t28 >> 7);
    t30 = (t29 & 1);
    *((unsigned int *)t23) = t30;
    memset(t22, 0, 8);
    t31 = (t25 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t25);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB36;

LAB34:    if (*((unsigned int *)t31) == 0)
        goto LAB33;

LAB35:    t37 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t37) = 1;

LAB36:    memset(t38, 0, 8);
    t39 = (t22 + 4);
    t40 = *((unsigned int *)t39);
    t41 = (~(t40));
    t42 = *((unsigned int *)t22);
    t43 = (t42 & t41);
    t44 = (t43 & 1U);
    if (t44 != 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t39) != 0)
        goto LAB39;

LAB40:    t47 = *((unsigned int *)t4);
    t48 = *((unsigned int *)t38);
    t49 = (t47 & t48);
    *((unsigned int *)t46) = t49;
    t50 = (t4 + 4);
    t51 = (t38 + 4);
    t52 = (t46 + 4);
    t53 = *((unsigned int *)t50);
    t54 = *((unsigned int *)t51);
    t55 = (t53 | t54);
    *((unsigned int *)t52) = t55;
    t56 = *((unsigned int *)t52);
    t57 = (t56 != 0);
    if (t57 == 1)
        goto LAB41;

LAB42:
LAB43:    goto LAB32;

LAB33:    *((unsigned int *)t22) = 1;
    goto LAB36;

LAB37:    *((unsigned int *)t38) = 1;
    goto LAB40;

LAB39:    t45 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB40;

LAB41:    t58 = *((unsigned int *)t46);
    t59 = *((unsigned int *)t52);
    *((unsigned int *)t46) = (t58 | t59);
    t60 = (t4 + 4);
    t61 = (t38 + 4);
    t62 = *((unsigned int *)t4);
    t63 = (~(t62));
    t64 = *((unsigned int *)t60);
    t65 = (~(t64));
    t66 = *((unsigned int *)t38);
    t67 = (~(t66));
    t68 = *((unsigned int *)t61);
    t69 = (~(t68));
    t70 = (t63 & t65);
    t71 = (t67 & t69);
    t72 = (~(t70));
    t73 = (~(t71));
    t74 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t74 & t72);
    t75 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t75 & t73);
    t76 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t76 & t72);
    t77 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t77 & t73);
    goto LAB43;

LAB44:    xsi_set_current_line(156, ng0);

LAB47:    xsi_set_current_line(157, ng0);
    t84 = ((char*)((ng2)));
    t85 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t85, t84, 0, 0, 2, 0LL);
    goto LAB46;

LAB52:    t31 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB54;

LAB53:    *((unsigned int *)t22) = 1;
    goto LAB54;

LAB56:    xsi_set_current_line(175, ng0);

LAB59:    xsi_set_current_line(176, ng0);
    t39 = ((char*)((ng3)));
    t45 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t45, t39, 0, 0, 2, 0LL);
    xsi_set_current_line(177, ng0);
    t2 = (t0 + 7848);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t12 = ((char*)((ng2)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 12, t6, 12, t12, 12);
    t13 = (t0 + 7848);
    xsi_vlogvar_wait_assign_value(t13, t4, 0, 0, 12, 0LL);
    goto LAB58;

LAB62:    t26 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB64;

LAB63:    *((unsigned int *)t22) = 1;
    goto LAB64;

LAB66:    xsi_set_current_line(184, ng0);

LAB69:    xsi_set_current_line(185, ng0);
    t37 = (t0 + 8008);
    t39 = (t37 + 56U);
    t45 = *((char **)t39);
    t50 = ((char*)((ng2)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_add(t25, 12, t45, 12, t50, 12);
    t51 = (t0 + 8008);
    xsi_vlogvar_wait_assign_value(t51, t25, 0, 0, 12, 0LL);
    goto LAB68;

}

static void Always_199_2(char *t0)
{
    char t6[8];
    char t17[8];
    char t26[8];
    char t28[8];
    char t40[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    int t25;
    char *t27;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;

LAB0:    t1 = (t0 + 10864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(199, ng0);
    t2 = (t0 + 11464);
    *((int *)t2) = 1;
    t3 = (t0 + 10896);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(199, ng0);

LAB5:    xsi_set_current_line(201, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(202, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(203, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(204, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(205, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4808);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(206, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4968);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(207, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5128);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(208, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5288);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(209, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(210, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(211, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(212, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(213, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(214, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(215, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6408);
    t4 = (t0 + 6408);
    t5 = (t4 + 72U);
    t7 = *((char **)t5);
    t8 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t6, t7, 2, t8, 32, 1);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (!(t10));
    if (t11 == 1)
        goto LAB6;

LAB7:    xsi_set_current_line(216, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6568);
    t4 = (t0 + 6568);
    t5 = (t4 + 72U);
    t7 = *((char **)t5);
    t8 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t6, t7, 2, t8, 32, 1);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (!(t10));
    if (t11 == 1)
        goto LAB8;

LAB9:    xsi_set_current_line(218, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t10 = *((unsigned int *)t3);
    t12 = (t10 >> 4);
    *((unsigned int *)t6) = t12;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 4);
    *((unsigned int *)t2) = t14;
    t15 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t15 & 15U);
    t16 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t16 & 15U);

LAB10:    t5 = ((char*)((ng1)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t5, 4);
    if (t11 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng2)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng3)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng4)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng8)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng9)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng10)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng11)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng12)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng13)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng15)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng16)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng18)));
    t11 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t11 == 1)
        goto LAB37;

LAB38:
LAB40:
LAB39:    xsi_set_current_line(416, ng0);

LAB200:    xsi_set_current_line(417, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t7 = *((char **)t3);
    memset(t40, 0, 8);
    t3 = (t40 + 4);
    t8 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t12 = (t10 >> 4);
    *((unsigned int *)t40) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 4);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t15 & 15U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 15U);
    t9 = (t0 + 1368U);
    t24 = *((char **)t9);
    xsi_vlogtype_concat(t28, 16, 16, 3U, t24, 8, t40, 4, t2, 4);
    t9 = (t0 + 9448);
    xsi_vlogvar_assign_value(t9, t28, 0, 0, 16);
    xsi_set_current_line(418, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t0 + 4328);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);

LAB41:    goto LAB2;

LAB6:    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t6), 1);
    goto LAB7;

LAB8:    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t6), 1);
    goto LAB9;

LAB11:    xsi_set_current_line(219, ng0);

LAB42:    xsi_set_current_line(220, ng0);
    t7 = (t0 + 1368U);
    t8 = *((char **)t7);
    memset(t17, 0, 8);
    t7 = (t17 + 4);
    t9 = (t8 + 4);
    t18 = *((unsigned int *)t8);
    t19 = (t18 >> 0);
    *((unsigned int *)t17) = t19;
    t20 = *((unsigned int *)t9);
    t21 = (t20 >> 0);
    *((unsigned int *)t7) = t21;
    t22 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t22 & 15U);
    t23 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t23 & 15U);

LAB43:    t24 = ((char*)((ng1)));
    t25 = xsi_vlog_unsigned_case_compare(t17, 4, t24, 4);
    if (t25 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng2)));
    t11 = xsi_vlog_unsigned_case_compare(t17, 4, t2, 4);
    if (t11 == 1)
        goto LAB46;

LAB47:    t2 = ((char*)((ng3)));
    t11 = xsi_vlog_unsigned_case_compare(t17, 4, t2, 4);
    if (t11 == 1)
        goto LAB48;

LAB49:    t2 = ((char*)((ng7)));
    t11 = xsi_vlog_unsigned_case_compare(t17, 4, t2, 4);
    if (t11 == 1)
        goto LAB50;

LAB51:    t2 = ((char*)((ng4)));
    t11 = xsi_vlog_unsigned_case_compare(t17, 4, t2, 4);
    if (t11 == 1)
        goto LAB52;

LAB53:    t2 = ((char*)((ng8)));
    t11 = xsi_vlog_unsigned_case_compare(t17, 4, t2, 4);
    if (t11 == 1)
        goto LAB54;

LAB55:    t2 = ((char*)((ng9)));
    t11 = xsi_vlog_unsigned_case_compare(t17, 4, t2, 4);
    if (t11 == 1)
        goto LAB56;

LAB57:    t2 = ((char*)((ng10)));
    t11 = xsi_vlog_unsigned_case_compare(t17, 4, t2, 4);
    if (t11 == 1)
        goto LAB58;

LAB59:    t2 = ((char*)((ng11)));
    t11 = xsi_vlog_unsigned_case_compare(t17, 4, t2, 4);
    if (t11 == 1)
        goto LAB60;

LAB61:
LAB63:
LAB62:    xsi_set_current_line(297, ng0);

LAB114:    xsi_set_current_line(298, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    memset(t28, 0, 8);
    t3 = (t28 + 4);
    t5 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t5);
    t14 = (t13 >> 4);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 15U);
    t7 = (t0 + 1368U);
    t8 = *((char **)t7);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t8, 8, t28, 4, t2, 4);
    t7 = (t0 + 9448);
    xsi_vlogvar_assign_value(t7, t26, 0, 0, 16);
    xsi_set_current_line(299, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4328);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);

LAB64:    goto LAB41;

LAB13:    xsi_set_current_line(303, ng0);

LAB115:    xsi_set_current_line(304, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(305, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4328);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB41;

LAB15:    xsi_set_current_line(307, ng0);

LAB116:    xsi_set_current_line(308, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(309, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4328);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB41;

LAB17:    xsi_set_current_line(311, ng0);

LAB117:    xsi_set_current_line(312, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(313, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4328);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB41;

LAB19:    xsi_set_current_line(315, ng0);

LAB118:    xsi_set_current_line(316, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(317, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4328);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB41;

LAB21:    xsi_set_current_line(319, ng0);

LAB119:    xsi_set_current_line(320, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(321, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4328);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB41;

LAB23:    xsi_set_current_line(323, ng0);

LAB120:    xsi_set_current_line(324, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(325, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4328);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB41;

LAB25:    xsi_set_current_line(327, ng0);

LAB121:    xsi_set_current_line(328, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(329, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4328);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB41;

LAB27:    xsi_set_current_line(331, ng0);

LAB122:    xsi_set_current_line(332, ng0);
    t3 = (t0 + 2808U);
    t4 = *((char **)t3);
    memset(t26, 0, 8);
    t3 = (t26 + 4);
    t5 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t12 = (t10 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t26) = t13;
    t14 = *((unsigned int *)t5);
    t15 = (t14 >> 0);
    t16 = (t15 & 1);
    *((unsigned int *)t3) = t16;
    t7 = (t26 + 4);
    t18 = *((unsigned int *)t7);
    t19 = (~(t18));
    t20 = *((unsigned int *)t26);
    t21 = (t20 & t19);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB123;

LAB124:    xsi_set_current_line(335, ng0);

LAB129:    xsi_set_current_line(336, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6408);
    t7 = (t0 + 6408);
    t8 = (t7 + 72U);
    t9 = *((char **)t8);
    t24 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t26, t9, 2, t24, 32, 1);
    t27 = (t26 + 4);
    t10 = *((unsigned int *)t27);
    t11 = (!(t10));
    if (t11 == 1)
        goto LAB130;

LAB131:
LAB125:    xsi_set_current_line(338, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    memset(t28, 0, 8);
    t3 = (t28 + 4);
    t5 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t5);
    t14 = (t13 >> 4);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 15U);
    t7 = (t0 + 1368U);
    t8 = *((char **)t7);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t8, 8, t28, 4, t2, 4);
    t7 = ((char*)((ng5)));
    memset(t40, 0, 8);
    xsi_vlog_unsigned_minus(t40, 16, t26, 16, t7, 16);
    t9 = (t0 + 9448);
    xsi_vlogvar_assign_value(t9, t40, 0, 0, 16);
    goto LAB41;

LAB29:    xsi_set_current_line(340, ng0);

LAB132:    xsi_set_current_line(341, ng0);
    t3 = (t0 + 2808U);
    t4 = *((char **)t3);
    memset(t26, 0, 8);
    t3 = (t26 + 4);
    t5 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t12 = (t10 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t26) = t13;
    t14 = *((unsigned int *)t5);
    t15 = (t14 >> 0);
    t16 = (t15 & 1);
    *((unsigned int *)t3) = t16;
    t7 = (t26 + 4);
    t18 = *((unsigned int *)t7);
    t19 = (~(t18));
    t20 = *((unsigned int *)t26);
    t21 = (t20 & t19);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB133;

LAB134:    xsi_set_current_line(344, ng0);

LAB139:    xsi_set_current_line(345, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6408);
    t7 = (t0 + 6408);
    t8 = (t7 + 72U);
    t9 = *((char **)t8);
    t24 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t26, t9, 2, t24, 32, 1);
    t27 = (t26 + 4);
    t10 = *((unsigned int *)t27);
    t11 = (!(t10));
    if (t11 == 1)
        goto LAB140;

LAB141:
LAB135:    xsi_set_current_line(347, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    memset(t28, 0, 8);
    t3 = (t28 + 4);
    t5 = (t4 + 4);
    t10 = *((unsigned int *)t4);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t5);
    t14 = (t13 >> 4);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 15U);
    t7 = (t0 + 1368U);
    t8 = *((char **)t7);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t8, 8, t28, 4, t2, 4);
    t7 = ((char*)((ng5)));
    memset(t40, 0, 8);
    xsi_vlog_unsigned_minus(t40, 16, t26, 16, t7, 16);
    t9 = (t0 + 9448);
    xsi_vlogvar_assign_value(t9, t40, 0, 0, 16);
    goto LAB41;

LAB31:    xsi_set_current_line(349, ng0);

LAB142:    xsi_set_current_line(350, ng0);
    t3 = (t0 + 2488U);
    t4 = *((char **)t3);

LAB143:    t3 = ((char*)((ng1)));
    t25 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 2);
    if (t25 == 1)
        goto LAB144;

LAB145:    t2 = ((char*)((ng2)));
    t11 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t11 == 1)
        goto LAB146;

LAB147:    t2 = ((char*)((ng3)));
    t11 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t11 == 1)
        goto LAB148;

LAB149:    t2 = ((char*)((ng7)));
    t11 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t11 == 1)
        goto LAB150;

LAB151:
LAB152:    xsi_set_current_line(364, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t5 = *((char **)t3);
    memset(t28, 0, 8);
    t3 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t2, 4);
    t8 = ((char*)((ng14)));
    memset(t40, 0, 8);
    xsi_vlog_unsigned_minus(t40, 16, t26, 16, t8, 16);
    t24 = (t0 + 9448);
    xsi_vlogvar_assign_value(t24, t40, 0, 0, 16);
    goto LAB41;

LAB33:    xsi_set_current_line(366, ng0);

LAB157:    xsi_set_current_line(367, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);

LAB158:    t3 = ((char*)((ng1)));
    t25 = xsi_vlog_unsigned_case_compare(t5, 2, t3, 2);
    if (t25 == 1)
        goto LAB159;

LAB160:    t2 = ((char*)((ng2)));
    t11 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t11 == 1)
        goto LAB161;

LAB162:    t2 = ((char*)((ng3)));
    t11 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t11 == 1)
        goto LAB163;

LAB164:    t2 = ((char*)((ng7)));
    t11 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t11 == 1)
        goto LAB165;

LAB166:
LAB167:    xsi_set_current_line(381, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t7 = *((char **)t3);
    memset(t28, 0, 8);
    t3 = (t28 + 4);
    t8 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 4);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 15U);
    t9 = (t0 + 1368U);
    t24 = *((char **)t9);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t24, 8, t28, 4, t2, 4);
    t9 = ((char*)((ng14)));
    memset(t40, 0, 8);
    xsi_vlog_unsigned_minus(t40, 16, t26, 16, t9, 16);
    t27 = (t0 + 9448);
    xsi_vlogvar_assign_value(t27, t40, 0, 0, 16);
    goto LAB41;

LAB35:    xsi_set_current_line(383, ng0);

LAB172:    xsi_set_current_line(384, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 5128);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    xsi_set_current_line(385, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t7 = *((char **)t3);
    memset(t28, 0, 8);
    t3 = (t28 + 4);
    t8 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 4);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 15U);
    t9 = (t0 + 1368U);
    t24 = *((char **)t9);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t24, 8, t28, 4, t2, 4);
    t9 = ((char*)((ng17)));
    memset(t40, 0, 8);
    xsi_vlog_unsigned_minus(t40, 16, t26, 16, t9, 16);
    t27 = (t0 + 9448);
    xsi_vlogvar_assign_value(t27, t40, 0, 0, 16);
    goto LAB41;

LAB37:    xsi_set_current_line(387, ng0);

LAB173:    xsi_set_current_line(388, ng0);
    t3 = (t0 + 2648U);
    t7 = *((char **)t3);
    memset(t26, 0, 8);
    t3 = (t26 + 4);
    t8 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t12 = (t10 >> 0);
    *((unsigned int *)t26) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t15 & 7U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 7U);

LAB174:    t9 = ((char*)((ng1)));
    t25 = xsi_vlog_unsigned_case_compare(t26, 3, t9, 3);
    if (t25 == 1)
        goto LAB175;

LAB176:    t2 = ((char*)((ng2)));
    t11 = xsi_vlog_unsigned_case_compare(t26, 3, t2, 3);
    if (t11 == 1)
        goto LAB177;

LAB178:    t2 = ((char*)((ng3)));
    t11 = xsi_vlog_unsigned_case_compare(t26, 3, t2, 3);
    if (t11 == 1)
        goto LAB179;

LAB180:    t2 = ((char*)((ng7)));
    t11 = xsi_vlog_unsigned_case_compare(t26, 3, t2, 3);
    if (t11 == 1)
        goto LAB181;

LAB182:    t2 = ((char*)((ng4)));
    t11 = xsi_vlog_unsigned_case_compare(t26, 3, t2, 3);
    if (t11 == 1)
        goto LAB183;

LAB184:    t2 = ((char*)((ng8)));
    t11 = xsi_vlog_unsigned_case_compare(t26, 3, t2, 3);
    if (t11 == 1)
        goto LAB185;

LAB186:    t2 = ((char*)((ng9)));
    t11 = xsi_vlog_unsigned_case_compare(t26, 3, t2, 3);
    if (t11 == 1)
        goto LAB187;

LAB188:    t2 = ((char*)((ng10)));
    t11 = xsi_vlog_unsigned_case_compare(t26, 3, t2, 3);
    if (t11 == 1)
        goto LAB189;

LAB190:
LAB191:    xsi_set_current_line(414, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1528U);
    t7 = *((char **)t3);
    memset(t40, 0, 8);
    t3 = (t40 + 4);
    t8 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t12 = (t10 >> 4);
    *((unsigned int *)t40) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 4);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t15 & 15U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 15U);
    t9 = (t0 + 1368U);
    t24 = *((char **)t9);
    xsi_vlogtype_concat(t28, 16, 16, 3U, t24, 8, t40, 4, t2, 4);
    t9 = ((char*)((ng19)));
    memset(t41, 0, 8);
    xsi_vlog_unsigned_minus(t41, 16, t28, 16, t9, 16);
    t27 = (t0 + 9448);
    xsi_vlogvar_assign_value(t27, t41, 0, 0, 16);
    goto LAB41;

LAB44:    xsi_set_current_line(221, ng0);

LAB65:    xsi_set_current_line(222, ng0);
    t27 = ((char*)((ng1)));
    t29 = (t0 + 1528U);
    t30 = *((char **)t29);
    memset(t28, 0, 8);
    t29 = (t28 + 4);
    t31 = (t30 + 4);
    t32 = *((unsigned int *)t30);
    t33 = (t32 >> 4);
    *((unsigned int *)t28) = t33;
    t34 = *((unsigned int *)t31);
    t35 = (t34 >> 4);
    *((unsigned int *)t29) = t35;
    t36 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t36 & 15U);
    t37 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t37 & 15U);
    t38 = (t0 + 1368U);
    t39 = *((char **)t38);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t39, 8, t28, 4, t27, 4);
    t38 = (t0 + 9448);
    xsi_vlogvar_assign_value(t38, t26, 0, 0, 16);
    xsi_set_current_line(223, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t12 = (~(t10));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB66;

LAB67:    xsi_set_current_line(226, ng0);

LAB70:    xsi_set_current_line(227, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);

LAB68:    goto LAB64;

LAB46:    xsi_set_current_line(230, ng0);

LAB71:    xsi_set_current_line(231, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(232, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB64;

LAB48:    xsi_set_current_line(234, ng0);

LAB72:    xsi_set_current_line(235, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(236, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t12 = (~(t10));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB73;

LAB74:    xsi_set_current_line(239, ng0);

LAB77:    xsi_set_current_line(240, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);

LAB75:    goto LAB64;

LAB50:    xsi_set_current_line(243, ng0);

LAB78:    xsi_set_current_line(244, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(245, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t12 = (~(t10));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB79;

LAB80:    xsi_set_current_line(248, ng0);

LAB83:    xsi_set_current_line(249, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);

LAB81:    goto LAB64;

LAB52:    xsi_set_current_line(252, ng0);

LAB84:    xsi_set_current_line(253, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(254, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t12 = (~(t10));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB85;

LAB86:    xsi_set_current_line(257, ng0);

LAB89:    xsi_set_current_line(258, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);

LAB87:    goto LAB64;

LAB54:    xsi_set_current_line(261, ng0);

LAB90:    xsi_set_current_line(262, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(263, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t12 = (~(t10));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB91;

LAB92:    xsi_set_current_line(266, ng0);

LAB95:    xsi_set_current_line(267, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);

LAB93:    goto LAB64;

LAB56:    xsi_set_current_line(270, ng0);

LAB96:    xsi_set_current_line(271, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(272, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t12 = (~(t10));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB97;

LAB98:    xsi_set_current_line(275, ng0);

LAB101:    xsi_set_current_line(276, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);

LAB99:    goto LAB64;

LAB58:    xsi_set_current_line(279, ng0);

LAB102:    xsi_set_current_line(280, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(281, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t12 = (~(t10));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB103;

LAB104:    xsi_set_current_line(284, ng0);

LAB107:    xsi_set_current_line(285, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);

LAB105:    goto LAB64;

LAB60:    xsi_set_current_line(288, ng0);

LAB108:    xsi_set_current_line(289, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t12 = (t10 >> 4);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 4);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t15 & 15U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 15U);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t26, 16, 16, 3U, t9, 8, t28, 4, t3, 4);
    t8 = (t0 + 9448);
    xsi_vlogvar_assign_value(t8, t26, 0, 0, 16);
    xsi_set_current_line(290, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t12 = (~(t10));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB109;

LAB110:    xsi_set_current_line(293, ng0);

LAB113:    xsi_set_current_line(294, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);

LAB111:    goto LAB64;

LAB66:    xsi_set_current_line(223, ng0);

LAB69:    xsi_set_current_line(224, ng0);
    t4 = (t0 + 8808);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4328);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB68;

LAB73:    xsi_set_current_line(236, ng0);

LAB76:    xsi_set_current_line(237, ng0);
    t4 = (t0 + 8808);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4328);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB75;

LAB79:    xsi_set_current_line(245, ng0);

LAB82:    xsi_set_current_line(246, ng0);
    t4 = (t0 + 8808);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4328);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB81;

LAB85:    xsi_set_current_line(254, ng0);

LAB88:    xsi_set_current_line(255, ng0);
    t4 = (t0 + 8808);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4328);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB87;

LAB91:    xsi_set_current_line(263, ng0);

LAB94:    xsi_set_current_line(264, ng0);
    t4 = (t0 + 8808);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4328);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB93;

LAB97:    xsi_set_current_line(272, ng0);

LAB100:    xsi_set_current_line(273, ng0);
    t4 = (t0 + 8808);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4328);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB99;

LAB103:    xsi_set_current_line(281, ng0);

LAB106:    xsi_set_current_line(282, ng0);
    t4 = (t0 + 8808);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4328);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB105;

LAB109:    xsi_set_current_line(290, ng0);

LAB112:    xsi_set_current_line(291, ng0);
    t4 = (t0 + 8808);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4328);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB111;

LAB123:    xsi_set_current_line(332, ng0);

LAB126:    xsi_set_current_line(333, ng0);
    t8 = (t0 + 8808);
    t9 = (t8 + 56U);
    t24 = *((char **)t9);
    t27 = (t0 + 6568);
    t29 = (t0 + 6568);
    t30 = (t29 + 72U);
    t31 = *((char **)t30);
    t38 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t28, t31, 2, t38, 32, 1);
    t39 = (t28 + 4);
    t23 = *((unsigned int *)t39);
    t25 = (!(t23));
    if (t25 == 1)
        goto LAB127;

LAB128:    goto LAB125;

LAB127:    xsi_vlogvar_assign_value(t27, t24, 0, *((unsigned int *)t28), 1);
    goto LAB128;

LAB130:    xsi_vlogvar_assign_value(t5, t4, 0, *((unsigned int *)t26), 1);
    goto LAB131;

LAB133:    xsi_set_current_line(341, ng0);

LAB136:    xsi_set_current_line(342, ng0);
    t8 = (t0 + 8808);
    t9 = (t8 + 56U);
    t24 = *((char **)t9);
    t27 = (t0 + 6568);
    t29 = (t0 + 6568);
    t30 = (t29 + 72U);
    t31 = *((char **)t30);
    t38 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t28, t31, 2, t38, 32, 1);
    t39 = (t28 + 4);
    t23 = *((unsigned int *)t39);
    t25 = (!(t23));
    if (t25 == 1)
        goto LAB137;

LAB138:    goto LAB135;

LAB137:    xsi_vlogvar_assign_value(t27, t24, 0, *((unsigned int *)t28), 1);
    goto LAB138;

LAB140:    xsi_vlogvar_assign_value(t5, t4, 0, *((unsigned int *)t26), 1);
    goto LAB141;

LAB144:    xsi_set_current_line(351, ng0);

LAB153:    xsi_set_current_line(352, ng0);
    t5 = (t0 + 8808);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 4488);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB152;

LAB146:    xsi_set_current_line(354, ng0);

LAB154:    xsi_set_current_line(355, ng0);
    t3 = (t0 + 8808);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4648);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB152;

LAB148:    xsi_set_current_line(357, ng0);

LAB155:    xsi_set_current_line(358, ng0);
    t3 = (t0 + 8808);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4808);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB152;

LAB150:    xsi_set_current_line(360, ng0);

LAB156:    xsi_set_current_line(361, ng0);
    t3 = (t0 + 8808);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 4968);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB152;

LAB159:    xsi_set_current_line(368, ng0);

LAB168:    xsi_set_current_line(369, ng0);
    t7 = (t0 + 8808);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t24 = (t0 + 4488);
    xsi_vlogvar_assign_value(t24, t9, 0, 0, 1);
    goto LAB167;

LAB161:    xsi_set_current_line(371, ng0);

LAB169:    xsi_set_current_line(372, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 4648);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB167;

LAB163:    xsi_set_current_line(374, ng0);

LAB170:    xsi_set_current_line(375, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 4808);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB167;

LAB165:    xsi_set_current_line(377, ng0);

LAB171:    xsi_set_current_line(378, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 4968);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB167;

LAB175:    xsi_set_current_line(389, ng0);

LAB192:    xsi_set_current_line(390, ng0);
    t24 = (t0 + 8808);
    t27 = (t24 + 56U);
    t29 = *((char **)t27);
    t30 = (t0 + 5288);
    xsi_vlogvar_assign_value(t30, t29, 0, 0, 1);
    goto LAB191;

LAB177:    xsi_set_current_line(392, ng0);

LAB193:    xsi_set_current_line(393, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 5288);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB191;

LAB179:    xsi_set_current_line(395, ng0);

LAB194:    xsi_set_current_line(396, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 5448);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB191;

LAB181:    xsi_set_current_line(398, ng0);

LAB195:    xsi_set_current_line(399, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 5608);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB191;

LAB183:    xsi_set_current_line(401, ng0);

LAB196:    xsi_set_current_line(402, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 5768);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB191;

LAB185:    xsi_set_current_line(404, ng0);

LAB197:    xsi_set_current_line(405, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 5928);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB191;

LAB187:    xsi_set_current_line(407, ng0);

LAB198:    xsi_set_current_line(408, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 6088);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB191;

LAB189:    xsi_set_current_line(410, ng0);

LAB199:    xsi_set_current_line(411, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 6248);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 1);
    goto LAB191;

}

static void Always_424_3(char *t0)
{
    char t6[8];
    char t19[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t24;
    int t25;

LAB0:    t1 = (t0 + 11112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(424, ng0);
    t2 = (t0 + 11480);
    *((int *)t2) = 1;
    t3 = (t0 + 11144);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(424, ng0);

LAB5:    xsi_set_current_line(426, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 6408);
    t7 = (t0 + 6408);
    t8 = (t7 + 72U);
    t9 = *((char **)t8);
    t10 = ((char*)((ng20)));
    xsi_vlog_generic_convert_bit_index(t6, t9, 2, t10, 32, 1);
    t11 = (t6 + 4);
    t12 = *((unsigned int *)t11);
    t13 = (!(t12));
    if (t13 == 1)
        goto LAB6;

LAB7:    xsi_set_current_line(427, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6568);
    t4 = (t0 + 6568);
    t5 = (t4 + 72U);
    t7 = *((char **)t5);
    t8 = ((char*)((ng20)));
    xsi_vlog_generic_convert_bit_index(t6, t7, 2, t8, 32, 1);
    t9 = (t6 + 4);
    t12 = *((unsigned int *)t9);
    t13 = (!(t12));
    if (t13 == 1)
        goto LAB8;

LAB9:    xsi_set_current_line(428, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(429, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(431, ng0);
    t2 = (t0 + 2808U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t12 = *((unsigned int *)t3);
    t14 = (t12 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t6) = t15;
    t16 = *((unsigned int *)t4);
    t17 = (t16 >> 0);
    t18 = (t17 & 1);
    *((unsigned int *)t2) = t18;

LAB10:    t5 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 1, t5, 1);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 1, t2, 1);
    if (t13 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB6:    xsi_vlogvar_assign_value(t5, t4, 0, *((unsigned int *)t6), 1);
    goto LAB7;

LAB8:    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t6), 1);
    goto LAB9;

LAB11:    xsi_set_current_line(432, ng0);

LAB16:    xsi_set_current_line(433, ng0);
    t7 = (t0 + 8968);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t0 + 6568);
    t11 = (t0 + 6568);
    t20 = (t11 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng20)));
    xsi_vlog_generic_convert_bit_index(t19, t21, 2, t22, 32, 1);
    t23 = (t19 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (!(t24));
    if (t25 == 1)
        goto LAB17;

LAB18:    xsi_set_current_line(434, ng0);
    t2 = (t0 + 9128);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7048);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB15;

LAB13:    xsi_set_current_line(436, ng0);

LAB19:    xsi_set_current_line(437, ng0);
    t3 = (t0 + 8968);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 6408);
    t8 = (t0 + 6408);
    t9 = (t8 + 72U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng20)));
    xsi_vlog_generic_convert_bit_index(t19, t10, 2, t11, 32, 1);
    t20 = (t19 + 4);
    t12 = *((unsigned int *)t20);
    t25 = (!(t12));
    if (t25 == 1)
        goto LAB20;

LAB21:    xsi_set_current_line(438, ng0);
    t2 = (t0 + 9128);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6888);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB15;

LAB17:    xsi_vlogvar_assign_value(t10, t9, 0, *((unsigned int *)t19), 1);
    goto LAB18;

LAB20:    xsi_vlogvar_assign_value(t7, t5, 0, *((unsigned int *)t19), 1);
    goto LAB21;

}


extern void work_m_00000000000916122190_4071936101_init()
{
	static char *pe[] = {(void *)Always_89_0,(void *)Always_141_1,(void *)Always_199_2,(void *)Always_424_3};
	xsi_register_didat("work_m_00000000000916122190_4071936101", "isim/tb_isim_beh.exe.sim/work/m_00000000000916122190_4071936101.didat");
	xsi_register_executes(pe);
}
