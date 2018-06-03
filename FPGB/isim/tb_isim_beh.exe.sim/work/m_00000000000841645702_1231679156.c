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
static const char *ng0 = "C:/Users/craig robertson/Desktop/FPGB/FPGB/rtl/memory_router.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {4U, 0U};
static unsigned int ng6[] = {5U, 0U};
static unsigned int ng7[] = {6U, 0U};
static unsigned int ng8[] = {7U, 0U};
static unsigned int ng9[] = {8U, 0U};
static unsigned int ng10[] = {9U, 0U};
static unsigned int ng11[] = {10U, 0U};
static unsigned int ng12[] = {11U, 0U};
static unsigned int ng13[] = {12U, 0U};
static unsigned int ng14[] = {13U, 0U};
static unsigned int ng15[] = {14U, 0U};
static unsigned int ng16[] = {15U, 0U};
static unsigned int ng17[] = {32768U, 0U};
static unsigned int ng18[] = {40960U, 0U};
static unsigned int ng19[] = {49152U, 0U};
static unsigned int ng20[] = {53248U, 0U};
static unsigned int ng21[] = {8192U, 0U};
static unsigned int ng22[] = {65024U, 0U};
static unsigned int ng23[] = {65184U, 0U};
static unsigned int ng24[] = {65408U, 0U};
static unsigned int ng25[] = {65535U, 0U};



static void Cont_141_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 12608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 14048);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void Always_145_1(char *t0)
{
    char t4[8];
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

LAB0:    t1 = (t0 + 12856U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 13920);
    *((int *)t2) = 1;
    t3 = (t0 + 12888);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(145, ng0);

LAB5:    xsi_set_current_line(146, ng0);
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

LAB11:    xsi_set_current_line(149, ng0);

LAB14:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB15;

LAB16:
LAB17:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(146, ng0);

LAB13:    xsi_set_current_line(147, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 11688);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 16, 0LL);
    goto LAB12;

LAB15:    xsi_set_current_line(150, ng0);

LAB18:    xsi_set_current_line(151, ng0);
    t5 = (t0 + 1368U);
    t6 = *((char **)t5);
    t5 = (t0 + 11688);
    xsi_vlogvar_wait_assign_value(t5, t6, 0, 0, 16, 0LL);
    goto LAB17;

}

static void Always_155_2(char *t0)
{
    char t4[8];
    char t18[8];
    char t41[8];
    char t42[8];
    char t43[8];
    char t44[8];
    char t45[8];
    char t46[8];
    char t48[8];
    char t49[8];
    char t50[8];
    char t51[8];
    char t52[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    int t17;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    int t47;

LAB0:    t1 = (t0 + 13104U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(155, ng0);
    t2 = (t0 + 13936);
    *((int *)t2) = 1;
    t3 = (t0 + 13136);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(155, ng0);

LAB5:    xsi_set_current_line(156, ng0);
    t5 = (t0 + 11688);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t4, 0, 8);
    t8 = (t4 + 4);
    t9 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 12);
    *((unsigned int *)t4) = t11;
    t12 = *((unsigned int *)t9);
    t13 = (t12 >> 12);
    *((unsigned int *)t8) = t13;
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 15U);
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 15U);

LAB6:    t16 = ((char*)((ng1)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t16, 4);
    if (t17 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng7)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng8)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng9)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng10)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng11)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng12)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng13)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng14)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng15)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng16)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t17 == 1)
        goto LAB37;

LAB38:
LAB39:    goto LAB2;

LAB7:    xsi_set_current_line(157, ng0);

LAB40:    xsi_set_current_line(158, ng0);
    t19 = (t0 + 11688);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memset(t18, 0, 8);
    t22 = (t18 + 4);
    t23 = (t21 + 4);
    t24 = *((unsigned int *)t21);
    t25 = (t24 >> 8);
    *((unsigned int *)t18) = t25;
    t26 = *((unsigned int *)t23);
    t27 = (t26 >> 8);
    *((unsigned int *)t22) = t27;
    t28 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t28 & 15U);
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t29 & 15U);

LAB41:    t30 = ((char*)((ng1)));
    t31 = xsi_vlog_unsigned_case_compare(t18, 4, t30, 4);
    if (t31 == 1)
        goto LAB42;

LAB43:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t18, 4, t2, 4);
    if (t17 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t18, 4, t2, 4);
    if (t17 == 1)
        goto LAB46;

LAB47:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t18, 4, t2, 4);
    if (t17 == 1)
        goto LAB48;

LAB49:    t2 = ((char*)((ng5)));
    t17 = xsi_vlog_unsigned_case_compare(t18, 4, t2, 4);
    if (t17 == 1)
        goto LAB50;

LAB51:    t2 = ((char*)((ng6)));
    t17 = xsi_vlog_unsigned_case_compare(t18, 4, t2, 4);
    if (t17 == 1)
        goto LAB52;

LAB53:    t2 = ((char*)((ng7)));
    t17 = xsi_vlog_unsigned_case_compare(t18, 4, t2, 4);
    if (t17 == 1)
        goto LAB54;

LAB55:    t2 = ((char*)((ng8)));
    t17 = xsi_vlog_unsigned_case_compare(t18, 4, t2, 4);
    if (t17 == 1)
        goto LAB56;

LAB57:    t2 = ((char*)((ng9)));
    t17 = xsi_vlog_unsigned_case_compare(t18, 4, t2, 4);
    if (t17 == 1)
        goto LAB58;

LAB59:
LAB61:
LAB60:    xsi_set_current_line(235, ng0);

LAB112:    xsi_set_current_line(236, ng0);
    t2 = (t0 + 2808U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB62:    goto LAB39;

LAB9:    xsi_set_current_line(241, ng0);

LAB113:    xsi_set_current_line(242, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB11:    xsi_set_current_line(245, ng0);

LAB114:    xsi_set_current_line(246, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB13:    xsi_set_current_line(249, ng0);

LAB115:    xsi_set_current_line(250, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB15:    xsi_set_current_line(253, ng0);

LAB116:    xsi_set_current_line(254, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB17:    xsi_set_current_line(257, ng0);

LAB117:    xsi_set_current_line(258, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB19:    xsi_set_current_line(261, ng0);

LAB118:    xsi_set_current_line(262, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB21:    xsi_set_current_line(265, ng0);

LAB119:    xsi_set_current_line(266, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB23:    xsi_set_current_line(269, ng0);

LAB120:    xsi_set_current_line(270, ng0);
    t3 = (t0 + 6648U);
    t5 = *((char **)t3);
    memset(t41, 0, 8);
    t3 = (t41 + 4);
    t6 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t41) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t3) = t15;
    t7 = (t41 + 4);
    t24 = *((unsigned int *)t7);
    t25 = (~(t24));
    t26 = *((unsigned int *)t41);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB121;

LAB122:    xsi_set_current_line(273, ng0);

LAB125:    xsi_set_current_line(274, ng0);
    t2 = (t0 + 2968U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB123:    goto LAB39;

LAB25:    xsi_set_current_line(278, ng0);

LAB126:    xsi_set_current_line(279, ng0);
    t3 = (t0 + 6648U);
    t5 = *((char **)t3);
    memset(t41, 0, 8);
    t3 = (t41 + 4);
    t6 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t41) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t3) = t15;
    t7 = (t41 + 4);
    t24 = *((unsigned int *)t7);
    t25 = (~(t24));
    t26 = *((unsigned int *)t41);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB127;

LAB128:    xsi_set_current_line(282, ng0);

LAB131:    xsi_set_current_line(283, ng0);
    t2 = (t0 + 2968U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB129:    goto LAB39;

LAB27:    xsi_set_current_line(287, ng0);

LAB132:    xsi_set_current_line(288, ng0);
    t3 = (t0 + 2328U);
    t5 = *((char **)t3);

LAB133:    t3 = ((char*)((ng1)));
    t31 = xsi_vlog_unsigned_case_compare(t5, 2, t3, 2);
    if (t31 == 1)
        goto LAB134;

LAB135:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t17 == 1)
        goto LAB136;

LAB137:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t17 == 1)
        goto LAB138;

LAB139:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t17 == 1)
        goto LAB140;

LAB141:
LAB142:    goto LAB39;

LAB29:    xsi_set_current_line(304, ng0);

LAB147:    xsi_set_current_line(305, ng0);
    t3 = (t0 + 2328U);
    t6 = *((char **)t3);

LAB148:    t3 = ((char*)((ng1)));
    t31 = xsi_vlog_unsigned_case_compare(t6, 2, t3, 2);
    if (t31 == 1)
        goto LAB149;

LAB150:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t17 == 1)
        goto LAB151;

LAB152:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t17 == 1)
        goto LAB153;

LAB154:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t17 == 1)
        goto LAB155;

LAB156:
LAB157:    goto LAB39;

LAB31:    xsi_set_current_line(321, ng0);

LAB162:    xsi_set_current_line(322, ng0);
    t3 = (t0 + 3928U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB39;

LAB33:    xsi_set_current_line(325, ng0);

LAB163:    xsi_set_current_line(326, ng0);
    t3 = (t0 + 8088U);
    t7 = *((char **)t3);
    memset(t41, 0, 8);
    t3 = (t41 + 4);
    t8 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t41) = t11;
    t12 = *((unsigned int *)t8);
    t13 = (t12 >> 0);
    *((unsigned int *)t3) = t13;
    t14 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t14 & 7U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 7U);

LAB164:    t9 = ((char*)((ng1)));
    t31 = xsi_vlog_unsigned_case_compare(t41, 3, t9, 3);
    if (t31 == 1)
        goto LAB165;

LAB166:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t41, 3, t2, 3);
    if (t17 == 1)
        goto LAB167;

LAB168:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t41, 3, t2, 3);
    if (t17 == 1)
        goto LAB169;

LAB170:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t41, 3, t2, 3);
    if (t17 == 1)
        goto LAB171;

LAB172:    t2 = ((char*)((ng5)));
    t17 = xsi_vlog_unsigned_case_compare(t41, 3, t2, 3);
    if (t17 == 1)
        goto LAB173;

LAB174:    t2 = ((char*)((ng6)));
    t17 = xsi_vlog_unsigned_case_compare(t41, 3, t2, 3);
    if (t17 == 1)
        goto LAB175;

LAB176:    t2 = ((char*)((ng7)));
    t17 = xsi_vlog_unsigned_case_compare(t41, 3, t2, 3);
    if (t17 == 1)
        goto LAB177;

LAB178:    t2 = ((char*)((ng8)));
    t17 = xsi_vlog_unsigned_case_compare(t41, 3, t2, 3);
    if (t17 == 1)
        goto LAB179;

LAB180:
LAB181:    goto LAB39;

LAB35:    xsi_set_current_line(354, ng0);

LAB190:    xsi_set_current_line(355, ng0);
    t3 = (t0 + 3928U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB39;

LAB37:    xsi_set_current_line(358, ng0);

LAB191:    xsi_set_current_line(359, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    memset(t42, 0, 8);
    t9 = (t42 + 4);
    t16 = (t8 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (t10 >> 8);
    *((unsigned int *)t42) = t11;
    t12 = *((unsigned int *)t16);
    t13 = (t12 >> 8);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t14 & 15U);
    t15 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t15 & 15U);

LAB192:
LAB194:    t2 = ((char*)((ng15)));
    t17 = xsi_vlog_unsigned_case_compare(t42, 4, t2, 4);
    if (t17 == 1)
        goto LAB195;

LAB196:    t2 = ((char*)((ng16)));
    t17 = xsi_vlog_unsigned_case_compare(t42, 4, t2, 4);
    if (t17 == 1)
        goto LAB197;

LAB198:
LAB193:    xsi_set_current_line(360, ng0);

LAB200:    xsi_set_current_line(361, ng0);
    t19 = (t0 + 8088U);
    t20 = *((char **)t19);
    memset(t43, 0, 8);
    t19 = (t43 + 4);
    t21 = (t20 + 4);
    t24 = *((unsigned int *)t20);
    t25 = (t24 >> 0);
    *((unsigned int *)t43) = t25;
    t26 = *((unsigned int *)t21);
    t27 = (t26 >> 0);
    *((unsigned int *)t19) = t27;
    t28 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t28 & 7U);
    t29 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t29 & 7U);

LAB201:    t22 = ((char*)((ng1)));
    t31 = xsi_vlog_unsigned_case_compare(t43, 3, t22, 3);
    if (t31 == 1)
        goto LAB202;

LAB203:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t43, 3, t2, 3);
    if (t17 == 1)
        goto LAB204;

LAB205:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t43, 3, t2, 3);
    if (t17 == 1)
        goto LAB206;

LAB207:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t43, 3, t2, 3);
    if (t17 == 1)
        goto LAB208;

LAB209:    t2 = ((char*)((ng5)));
    t17 = xsi_vlog_unsigned_case_compare(t43, 3, t2, 3);
    if (t17 == 1)
        goto LAB210;

LAB211:    t2 = ((char*)((ng6)));
    t17 = xsi_vlog_unsigned_case_compare(t43, 3, t2, 3);
    if (t17 == 1)
        goto LAB212;

LAB213:    t2 = ((char*)((ng7)));
    t17 = xsi_vlog_unsigned_case_compare(t43, 3, t2, 3);
    if (t17 == 1)
        goto LAB214;

LAB215:    t2 = ((char*)((ng8)));
    t17 = xsi_vlog_unsigned_case_compare(t43, 3, t2, 3);
    if (t17 == 1)
        goto LAB216;

LAB217:
LAB218:
LAB199:    goto LAB39;

LAB42:    xsi_set_current_line(159, ng0);

LAB63:    xsi_set_current_line(160, ng0);
    t32 = (t0 + 2488U);
    t33 = *((char **)t32);
    t32 = (t33 + 4);
    t34 = *((unsigned int *)t32);
    t35 = (~(t34));
    t36 = *((unsigned int *)t33);
    t37 = (t36 & t35);
    t38 = (t37 != 0);
    if (t38 > 0)
        goto LAB64;

LAB65:    xsi_set_current_line(163, ng0);

LAB68:    xsi_set_current_line(164, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB66:    goto LAB62;

LAB44:    xsi_set_current_line(168, ng0);

LAB69:    xsi_set_current_line(169, ng0);
    t3 = (t0 + 2648U);
    t5 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB62;

LAB46:    xsi_set_current_line(172, ng0);

LAB70:    xsi_set_current_line(173, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB71;

LAB72:    xsi_set_current_line(176, ng0);

LAB75:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB73:    goto LAB62;

LAB48:    xsi_set_current_line(181, ng0);

LAB76:    xsi_set_current_line(182, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB77;

LAB78:    xsi_set_current_line(185, ng0);

LAB81:    xsi_set_current_line(186, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB79:    goto LAB62;

LAB50:    xsi_set_current_line(190, ng0);

LAB82:    xsi_set_current_line(191, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB83;

LAB84:    xsi_set_current_line(194, ng0);

LAB87:    xsi_set_current_line(195, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB85:    goto LAB62;

LAB52:    xsi_set_current_line(199, ng0);

LAB88:    xsi_set_current_line(200, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB89;

LAB90:    xsi_set_current_line(203, ng0);

LAB93:    xsi_set_current_line(204, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB91:    goto LAB62;

LAB54:    xsi_set_current_line(208, ng0);

LAB94:    xsi_set_current_line(209, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB95;

LAB96:    xsi_set_current_line(212, ng0);

LAB99:    xsi_set_current_line(213, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB97:    goto LAB62;

LAB56:    xsi_set_current_line(217, ng0);

LAB100:    xsi_set_current_line(218, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB101;

LAB102:    xsi_set_current_line(221, ng0);

LAB105:    xsi_set_current_line(222, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB103:    goto LAB62;

LAB58:    xsi_set_current_line(226, ng0);

LAB106:    xsi_set_current_line(227, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB107;

LAB108:    xsi_set_current_line(230, ng0);

LAB111:    xsi_set_current_line(231, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB109:    goto LAB62;

LAB64:    xsi_set_current_line(160, ng0);

LAB67:    xsi_set_current_line(161, ng0);
    t39 = (t0 + 2808U);
    t40 = *((char **)t39);
    t39 = (t0 + 8808);
    xsi_vlogvar_assign_value(t39, t40, 0, 0, 8);
    goto LAB66;

LAB71:    xsi_set_current_line(173, ng0);

LAB74:    xsi_set_current_line(174, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8808);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB73;

LAB77:    xsi_set_current_line(182, ng0);

LAB80:    xsi_set_current_line(183, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8808);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB79;

LAB83:    xsi_set_current_line(191, ng0);

LAB86:    xsi_set_current_line(192, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8808);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB85;

LAB89:    xsi_set_current_line(200, ng0);

LAB92:    xsi_set_current_line(201, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8808);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB91;

LAB95:    xsi_set_current_line(209, ng0);

LAB98:    xsi_set_current_line(210, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8808);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB97;

LAB101:    xsi_set_current_line(218, ng0);

LAB104:    xsi_set_current_line(219, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8808);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB103;

LAB107:    xsi_set_current_line(227, ng0);

LAB110:    xsi_set_current_line(228, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8808);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB109;

LAB121:    xsi_set_current_line(270, ng0);

LAB124:    xsi_set_current_line(271, ng0);
    t8 = (t0 + 3128U);
    t9 = *((char **)t8);
    t8 = (t0 + 8808);
    xsi_vlogvar_assign_value(t8, t9, 0, 0, 8);
    goto LAB123;

LAB127:    xsi_set_current_line(279, ng0);

LAB130:    xsi_set_current_line(280, ng0);
    t8 = (t0 + 3128U);
    t9 = *((char **)t8);
    t8 = (t0 + 8808);
    xsi_vlogvar_assign_value(t8, t9, 0, 0, 8);
    goto LAB129;

LAB134:    xsi_set_current_line(289, ng0);

LAB143:    xsi_set_current_line(290, ng0);
    t6 = (t0 + 3288U);
    t7 = *((char **)t6);
    t6 = (t0 + 8808);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB142;

LAB136:    xsi_set_current_line(292, ng0);

LAB144:    xsi_set_current_line(293, ng0);
    t3 = (t0 + 3448U);
    t6 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 8);
    goto LAB142;

LAB138:    xsi_set_current_line(295, ng0);

LAB145:    xsi_set_current_line(296, ng0);
    t3 = (t0 + 3608U);
    t6 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 8);
    goto LAB142;

LAB140:    xsi_set_current_line(298, ng0);

LAB146:    xsi_set_current_line(299, ng0);
    t3 = (t0 + 3768U);
    t6 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 8);
    goto LAB142;

LAB149:    xsi_set_current_line(306, ng0);

LAB158:    xsi_set_current_line(307, ng0);
    t7 = (t0 + 3288U);
    t8 = *((char **)t7);
    t7 = (t0 + 8808);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 8);
    goto LAB157;

LAB151:    xsi_set_current_line(309, ng0);

LAB159:    xsi_set_current_line(310, ng0);
    t3 = (t0 + 3448U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB157;

LAB153:    xsi_set_current_line(312, ng0);

LAB160:    xsi_set_current_line(313, ng0);
    t3 = (t0 + 3608U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB157;

LAB155:    xsi_set_current_line(315, ng0);

LAB161:    xsi_set_current_line(316, ng0);
    t3 = (t0 + 3768U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB157;

LAB165:    xsi_set_current_line(327, ng0);

LAB182:    xsi_set_current_line(328, ng0);
    t16 = (t0 + 4088U);
    t19 = *((char **)t16);
    t16 = (t0 + 8808);
    xsi_vlogvar_assign_value(t16, t19, 0, 0, 8);
    goto LAB181;

LAB167:    xsi_set_current_line(330, ng0);

LAB183:    xsi_set_current_line(331, ng0);
    t3 = (t0 + 4088U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB169:    xsi_set_current_line(333, ng0);

LAB184:    xsi_set_current_line(334, ng0);
    t3 = (t0 + 4248U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB171:    xsi_set_current_line(336, ng0);

LAB185:    xsi_set_current_line(337, ng0);
    t3 = (t0 + 4408U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB173:    xsi_set_current_line(339, ng0);

LAB186:    xsi_set_current_line(340, ng0);
    t3 = (t0 + 4568U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB175:    xsi_set_current_line(342, ng0);

LAB187:    xsi_set_current_line(343, ng0);
    t3 = (t0 + 4728U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB177:    xsi_set_current_line(345, ng0);

LAB188:    xsi_set_current_line(346, ng0);
    t3 = (t0 + 4888U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB179:    xsi_set_current_line(348, ng0);

LAB189:    xsi_set_current_line(349, ng0);
    t3 = (t0 + 5048U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB195:    xsi_set_current_line(389, ng0);

LAB227:    xsi_set_current_line(390, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    memset(t44, 0, 8);
    t9 = (t44 + 4);
    t16 = (t8 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (t10 >> 4);
    *((unsigned int *)t44) = t11;
    t12 = *((unsigned int *)t16);
    t13 = (t12 >> 4);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t14 & 15U);
    t15 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t15 & 15U);

LAB228:    t19 = ((char*)((ng1)));
    t31 = xsi_vlog_unsigned_case_compare(t44, 4, t19, 4);
    if (t31 == 1)
        goto LAB229;

LAB230:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB231;

LAB232:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB233;

LAB234:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB235;

LAB236:    t2 = ((char*)((ng5)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB237;

LAB238:    t2 = ((char*)((ng6)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB239;

LAB240:    t2 = ((char*)((ng7)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB241;

LAB242:    t2 = ((char*)((ng8)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB243;

LAB244:    t2 = ((char*)((ng9)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB245;

LAB246:    t2 = ((char*)((ng10)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB247;

LAB248:    t2 = ((char*)((ng11)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB249;

LAB250:    t2 = ((char*)((ng12)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB251;

LAB252:    t2 = ((char*)((ng13)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB253;

LAB254:    t2 = ((char*)((ng14)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB255;

LAB256:    t2 = ((char*)((ng15)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB257;

LAB258:    t2 = ((char*)((ng16)));
    t17 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t17 == 1)
        goto LAB259;

LAB260:
LAB261:    goto LAB199;

LAB197:    xsi_set_current_line(457, ng0);

LAB278:    xsi_set_current_line(458, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    memset(t45, 0, 8);
    t9 = (t45 + 4);
    t16 = (t8 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (t10 >> 4);
    *((unsigned int *)t45) = t11;
    t12 = *((unsigned int *)t16);
    t13 = (t12 >> 4);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t14 & 15U);
    t15 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t15 & 15U);

LAB279:    t19 = ((char*)((ng1)));
    t31 = xsi_vlog_unsigned_case_compare(t45, 4, t19, 4);
    if (t31 == 1)
        goto LAB280;

LAB281:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB282;

LAB283:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB284;

LAB285:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB286;

LAB287:    t2 = ((char*)((ng5)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB288;

LAB289:    t2 = ((char*)((ng6)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB290;

LAB291:    t2 = ((char*)((ng7)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB292;

LAB293:    t2 = ((char*)((ng8)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB294;

LAB295:    t2 = ((char*)((ng9)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB296;

LAB297:    t2 = ((char*)((ng10)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB298;

LAB299:    t2 = ((char*)((ng11)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB300;

LAB301:    t2 = ((char*)((ng12)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB302;

LAB303:    t2 = ((char*)((ng13)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB304;

LAB305:    t2 = ((char*)((ng14)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB306;

LAB307:    t2 = ((char*)((ng15)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB308;

LAB309:    t2 = ((char*)((ng16)));
    t17 = xsi_vlog_unsigned_case_compare(t45, 4, t2, 4);
    if (t17 == 1)
        goto LAB310;

LAB311:
LAB312:    goto LAB199;

LAB202:    xsi_set_current_line(362, ng0);

LAB219:    xsi_set_current_line(363, ng0);
    t23 = (t0 + 4088U);
    t30 = *((char **)t23);
    t23 = (t0 + 8808);
    xsi_vlogvar_assign_value(t23, t30, 0, 0, 8);
    goto LAB218;

LAB204:    xsi_set_current_line(365, ng0);

LAB220:    xsi_set_current_line(366, ng0);
    t3 = (t0 + 4088U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB206:    xsi_set_current_line(368, ng0);

LAB221:    xsi_set_current_line(369, ng0);
    t3 = (t0 + 4248U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB208:    xsi_set_current_line(371, ng0);

LAB222:    xsi_set_current_line(372, ng0);
    t3 = (t0 + 4408U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB210:    xsi_set_current_line(374, ng0);

LAB223:    xsi_set_current_line(375, ng0);
    t3 = (t0 + 4568U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB212:    xsi_set_current_line(377, ng0);

LAB224:    xsi_set_current_line(378, ng0);
    t3 = (t0 + 4728U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB214:    xsi_set_current_line(380, ng0);

LAB225:    xsi_set_current_line(381, ng0);
    t3 = (t0 + 4888U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB216:    xsi_set_current_line(383, ng0);

LAB226:    xsi_set_current_line(384, ng0);
    t3 = (t0 + 5048U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB229:    xsi_set_current_line(391, ng0);

LAB262:    xsi_set_current_line(392, ng0);
    t20 = (t0 + 5208U);
    t21 = *((char **)t20);
    t20 = (t0 + 8808);
    xsi_vlogvar_assign_value(t20, t21, 0, 0, 8);
    goto LAB261;

LAB231:    xsi_set_current_line(395, ng0);

LAB263:    xsi_set_current_line(396, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB233:    xsi_set_current_line(399, ng0);

LAB264:    xsi_set_current_line(400, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB235:    xsi_set_current_line(403, ng0);

LAB265:    xsi_set_current_line(404, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB237:    xsi_set_current_line(407, ng0);

LAB266:    xsi_set_current_line(408, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB239:    xsi_set_current_line(411, ng0);

LAB267:    xsi_set_current_line(412, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB241:    xsi_set_current_line(415, ng0);

LAB268:    xsi_set_current_line(416, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB243:    xsi_set_current_line(419, ng0);

LAB269:    xsi_set_current_line(420, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB245:    xsi_set_current_line(423, ng0);

LAB270:    xsi_set_current_line(424, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB247:    xsi_set_current_line(427, ng0);

LAB271:    xsi_set_current_line(428, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB249:    xsi_set_current_line(431, ng0);

LAB272:    xsi_set_current_line(432, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 8808);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 8);
    goto LAB261;

LAB251:    xsi_set_current_line(435, ng0);

LAB273:    xsi_set_current_line(436, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 8808);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 8);
    goto LAB261;

LAB253:    xsi_set_current_line(439, ng0);

LAB274:    xsi_set_current_line(440, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 8808);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 8);
    goto LAB261;

LAB255:    xsi_set_current_line(443, ng0);

LAB275:    xsi_set_current_line(444, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 8808);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 8);
    goto LAB261;

LAB257:    xsi_set_current_line(447, ng0);

LAB276:    xsi_set_current_line(448, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 8808);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 8);
    goto LAB261;

LAB259:    xsi_set_current_line(451, ng0);

LAB277:    xsi_set_current_line(452, ng0);
    t3 = (t0 + 8808);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 8808);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 8);
    goto LAB261;

LAB280:    xsi_set_current_line(459, ng0);

LAB313:    xsi_set_current_line(460, ng0);
    t20 = (t0 + 11688);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memset(t46, 0, 8);
    t23 = (t46 + 4);
    t30 = (t22 + 4);
    t24 = *((unsigned int *)t22);
    t25 = (t24 >> 0);
    *((unsigned int *)t46) = t25;
    t26 = *((unsigned int *)t30);
    t27 = (t26 >> 0);
    *((unsigned int *)t23) = t27;
    t28 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t28 & 15U);
    t29 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t29 & 15U);

LAB314:    t32 = ((char*)((ng1)));
    t47 = xsi_vlog_unsigned_case_compare(t46, 4, t32, 4);
    if (t47 == 1)
        goto LAB315;

LAB316:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t46, 4, t2, 4);
    if (t17 == 1)
        goto LAB317;

LAB318:    t2 = ((char*)((ng16)));
    t17 = xsi_vlog_unsigned_case_compare(t46, 4, t2, 4);
    if (t17 == 1)
        goto LAB319;

LAB320:
LAB322:
LAB321:    xsi_set_current_line(470, ng0);

LAB327:    xsi_set_current_line(471, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t0 + 8808);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 8);

LAB323:    goto LAB312;

LAB282:    xsi_set_current_line(476, ng0);

LAB328:    goto LAB312;

LAB284:    xsi_set_current_line(480, ng0);

LAB329:    goto LAB312;

LAB286:    xsi_set_current_line(484, ng0);

LAB330:    goto LAB312;

LAB288:    xsi_set_current_line(488, ng0);

LAB331:    xsi_set_current_line(489, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    memset(t48, 0, 8);
    t9 = (t48 + 4);
    t16 = (t8 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (t10 >> 0);
    *((unsigned int *)t48) = t11;
    t12 = *((unsigned int *)t16);
    t13 = (t12 >> 0);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t14 & 15U);
    t15 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t15 & 15U);

LAB332:    t19 = ((char*)((ng2)));
    t31 = xsi_vlog_unsigned_case_compare(t48, 4, t19, 4);
    if (t31 == 1)
        goto LAB333;

LAB334:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t17 == 1)
        goto LAB335;

LAB336:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t17 == 1)
        goto LAB337;

LAB338:    t2 = ((char*)((ng16)));
    t17 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t17 == 1)
        goto LAB339;

LAB340:
LAB342:
LAB341:    xsi_set_current_line(502, ng0);

LAB348:    xsi_set_current_line(503, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t0 + 8808);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 8);

LAB343:    goto LAB312;

LAB290:    xsi_set_current_line(508, ng0);

LAB349:    xsi_set_current_line(509, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    memset(t49, 0, 8);
    t9 = (t49 + 4);
    t16 = (t8 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (t10 >> 0);
    *((unsigned int *)t49) = t11;
    t12 = *((unsigned int *)t16);
    t13 = (t12 >> 0);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t14 & 15U);
    t15 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t15 & 15U);

LAB350:    t19 = ((char*)((ng1)));
    t31 = xsi_vlog_unsigned_case_compare(t49, 4, t19, 4);
    if (t31 == 1)
        goto LAB351;

LAB352:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t49, 4, t2, 4);
    if (t17 == 1)
        goto LAB353;

LAB354:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t49, 4, t2, 4);
    if (t17 == 1)
        goto LAB355;

LAB356:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t49, 4, t2, 4);
    if (t17 == 1)
        goto LAB357;

LAB358:    t2 = ((char*)((ng5)));
    t17 = xsi_vlog_unsigned_case_compare(t49, 4, t2, 4);
    if (t17 == 1)
        goto LAB359;

LAB360:    t2 = ((char*)((ng6)));
    t17 = xsi_vlog_unsigned_case_compare(t49, 4, t2, 4);
    if (t17 == 1)
        goto LAB361;

LAB362:
LAB363:    goto LAB312;

LAB292:    xsi_set_current_line(531, ng0);

LAB370:    xsi_set_current_line(532, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    memset(t50, 0, 8);
    t9 = (t50 + 4);
    t16 = (t8 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (t10 >> 0);
    *((unsigned int *)t50) = t11;
    t12 = *((unsigned int *)t16);
    t13 = (t12 >> 0);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t14 & 15U);
    t15 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t15 & 15U);

LAB371:    t19 = ((char*)((ng10)));
    t31 = xsi_vlog_unsigned_case_compare(t50, 4, t19, 4);
    if (t31 == 1)
        goto LAB372;

LAB373:    t2 = ((char*)((ng12)));
    t17 = xsi_vlog_unsigned_case_compare(t50, 4, t2, 4);
    if (t17 == 1)
        goto LAB374;

LAB375:
LAB376:    goto LAB312;

LAB294:    xsi_set_current_line(542, ng0);

LAB379:    xsi_set_current_line(543, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    memset(t51, 0, 8);
    t9 = (t51 + 4);
    t16 = (t8 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (t10 >> 0);
    *((unsigned int *)t51) = t11;
    t12 = *((unsigned int *)t16);
    t13 = (t12 >> 0);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t14 & 15U);
    t15 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t15 & 15U);

LAB380:    t19 = ((char*)((ng1)));
    t31 = xsi_vlog_unsigned_case_compare(t51, 4, t19, 4);
    if (t31 == 1)
        goto LAB381;

LAB382:
LAB383:    goto LAB312;

LAB296:    xsi_set_current_line(550, ng0);

LAB385:    xsi_set_current_line(551, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB298:    xsi_set_current_line(554, ng0);

LAB386:    xsi_set_current_line(555, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB300:    xsi_set_current_line(558, ng0);

LAB387:    xsi_set_current_line(559, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB302:    xsi_set_current_line(562, ng0);

LAB388:    xsi_set_current_line(563, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB304:    xsi_set_current_line(566, ng0);

LAB389:    xsi_set_current_line(567, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB306:    xsi_set_current_line(570, ng0);

LAB390:    xsi_set_current_line(571, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB308:    xsi_set_current_line(574, ng0);

LAB391:    xsi_set_current_line(575, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB310:    xsi_set_current_line(578, ng0);

LAB392:    xsi_set_current_line(579, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    memset(t52, 0, 8);
    t9 = (t52 + 4);
    t16 = (t8 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (t10 >> 0);
    *((unsigned int *)t52) = t11;
    t12 = *((unsigned int *)t16);
    t13 = (t12 >> 0);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t14 & 15U);
    t15 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t15 & 15U);

LAB393:    t19 = ((char*)((ng1)));
    t31 = xsi_vlog_unsigned_case_compare(t52, 4, t19, 4);
    if (t31 == 1)
        goto LAB394;

LAB395:    t2 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB396;

LAB397:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB398;

LAB399:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB400;

LAB401:    t2 = ((char*)((ng5)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB402;

LAB403:    t2 = ((char*)((ng6)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB404;

LAB405:    t2 = ((char*)((ng7)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB406;

LAB407:    t2 = ((char*)((ng8)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB408;

LAB409:    t2 = ((char*)((ng9)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB410;

LAB411:    t2 = ((char*)((ng10)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB412;

LAB413:    t2 = ((char*)((ng11)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB414;

LAB415:    t2 = ((char*)((ng12)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB416;

LAB417:    t2 = ((char*)((ng13)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB418;

LAB419:    t2 = ((char*)((ng14)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB420;

LAB421:    t2 = ((char*)((ng15)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB422;

LAB423:    t2 = ((char*)((ng16)));
    t17 = xsi_vlog_unsigned_case_compare(t52, 4, t2, 4);
    if (t17 == 1)
        goto LAB424;

LAB425:
LAB426:    goto LAB312;

LAB315:    xsi_set_current_line(461, ng0);

LAB324:    xsi_set_current_line(462, ng0);
    t33 = (t0 + 6168U);
    t39 = *((char **)t33);
    t33 = (t0 + 8808);
    xsi_vlogvar_assign_value(t33, t39, 0, 0, 8);
    goto LAB323;

LAB317:    xsi_set_current_line(464, ng0);

LAB325:    xsi_set_current_line(465, ng0);
    t3 = (t0 + 6168U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB323;

LAB319:    xsi_set_current_line(467, ng0);

LAB326:    xsi_set_current_line(468, ng0);
    t3 = (t0 + 6328U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB323;

LAB333:    xsi_set_current_line(490, ng0);

LAB344:    xsi_set_current_line(491, ng0);
    t20 = (t0 + 6488U);
    t21 = *((char **)t20);
    t20 = (t0 + 8808);
    xsi_vlogvar_assign_value(t20, t21, 0, 0, 8);
    goto LAB343;

LAB335:    xsi_set_current_line(493, ng0);

LAB345:    xsi_set_current_line(494, ng0);
    t3 = (t0 + 6008U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB343;

LAB337:    xsi_set_current_line(496, ng0);

LAB346:    xsi_set_current_line(497, ng0);
    t3 = (t0 + 5848U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB343;

LAB339:    xsi_set_current_line(499, ng0);

LAB347:    xsi_set_current_line(500, ng0);
    t3 = (t0 + 6648U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB343;

LAB351:    xsi_set_current_line(510, ng0);

LAB364:    xsi_set_current_line(511, ng0);
    t20 = (t0 + 6808U);
    t21 = *((char **)t20);
    t20 = (t0 + 8808);
    xsi_vlogvar_assign_value(t20, t21, 0, 0, 8);
    goto LAB363;

LAB353:    xsi_set_current_line(513, ng0);

LAB365:    xsi_set_current_line(514, ng0);
    t3 = (t0 + 6968U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB363;

LAB355:    xsi_set_current_line(516, ng0);

LAB366:    xsi_set_current_line(517, ng0);
    t3 = (t0 + 7128U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB363;

LAB357:    xsi_set_current_line(519, ng0);

LAB367:    xsi_set_current_line(520, ng0);
    t3 = (t0 + 7288U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB363;

LAB359:    xsi_set_current_line(522, ng0);

LAB368:    xsi_set_current_line(523, ng0);
    t3 = (t0 + 7448U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB363;

LAB361:    xsi_set_current_line(525, ng0);

LAB369:    xsi_set_current_line(526, ng0);
    t3 = (t0 + 7608U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB363;

LAB372:    xsi_set_current_line(533, ng0);

LAB377:    xsi_set_current_line(534, ng0);
    t20 = (t0 + 5528U);
    t21 = *((char **)t20);
    t20 = (t0 + 8808);
    xsi_vlogvar_assign_value(t20, t21, 0, 0, 8);
    goto LAB376;

LAB374:    xsi_set_current_line(536, ng0);

LAB378:    xsi_set_current_line(537, ng0);
    t3 = (t0 + 5688U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB376;

LAB381:    xsi_set_current_line(544, ng0);

LAB384:    xsi_set_current_line(545, ng0);
    t20 = (t0 + 8088U);
    t21 = *((char **)t20);
    t20 = (t0 + 8808);
    xsi_vlogvar_assign_value(t20, t21, 0, 0, 8);
    goto LAB383;

LAB394:    xsi_set_current_line(580, ng0);

LAB427:    xsi_set_current_line(581, ng0);
    t20 = (t0 + 5368U);
    t21 = *((char **)t20);
    t20 = (t0 + 8808);
    xsi_vlogvar_assign_value(t20, t21, 0, 0, 8);
    goto LAB426;

LAB396:    xsi_set_current_line(584, ng0);

LAB428:    xsi_set_current_line(585, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB398:    xsi_set_current_line(588, ng0);

LAB429:    xsi_set_current_line(589, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB400:    xsi_set_current_line(592, ng0);

LAB430:    xsi_set_current_line(593, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB402:    xsi_set_current_line(596, ng0);

LAB431:    xsi_set_current_line(597, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB404:    xsi_set_current_line(600, ng0);

LAB432:    xsi_set_current_line(601, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB406:    xsi_set_current_line(604, ng0);

LAB433:    xsi_set_current_line(605, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB408:    xsi_set_current_line(608, ng0);

LAB434:    xsi_set_current_line(609, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB410:    xsi_set_current_line(612, ng0);

LAB435:    xsi_set_current_line(613, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB412:    xsi_set_current_line(616, ng0);

LAB436:    xsi_set_current_line(617, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB414:    xsi_set_current_line(620, ng0);

LAB437:    xsi_set_current_line(621, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB416:    xsi_set_current_line(624, ng0);

LAB438:    xsi_set_current_line(625, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB418:    xsi_set_current_line(628, ng0);

LAB439:    xsi_set_current_line(629, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB420:    xsi_set_current_line(632, ng0);

LAB440:    xsi_set_current_line(633, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB422:    xsi_set_current_line(636, ng0);

LAB441:    xsi_set_current_line(637, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

LAB424:    xsi_set_current_line(640, ng0);

LAB442:    xsi_set_current_line(641, ng0);
    t3 = (t0 + 8248U);
    t7 = *((char **)t3);
    t3 = (t0 + 8808);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB426;

}

static void Always_665_3(char *t0)
{
    char t4[8];
    char t16[8];
    char t37[8];
    char t38[8];
    char t39[8];
    char t40[8];
    char t41[8];
    char t42[8];
    char t44[8];
    char t45[8];
    char t46[8];
    char t47[8];
    char t48[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    int t43;

LAB0:    t1 = (t0 + 13352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(665, ng0);
    t2 = (t0 + 13952);
    *((int *)t2) = 1;
    t3 = (t0 + 13384);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(665, ng0);

LAB5:    xsi_set_current_line(666, ng0);
    t5 = (t0 + 1528U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 12);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 12);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 15U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 15U);

LAB6:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t14, 4);
    if (t15 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng10)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng12)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng13)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng14)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng15)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng16)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t15 == 1)
        goto LAB37;

LAB38:
LAB39:    goto LAB2;

LAB7:    xsi_set_current_line(667, ng0);

LAB40:    xsi_set_current_line(668, ng0);
    t17 = (t0 + 1528U);
    t18 = *((char **)t17);
    memset(t16, 0, 8);
    t17 = (t16 + 4);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (t20 >> 8);
    *((unsigned int *)t16) = t21;
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 8);
    *((unsigned int *)t17) = t23;
    t24 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t24 & 15U);
    t25 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t25 & 15U);

LAB41:    t26 = ((char*)((ng1)));
    t27 = xsi_vlog_unsigned_case_compare(t16, 4, t26, 4);
    if (t27 == 1)
        goto LAB42;

LAB43:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 4, t2, 4);
    if (t15 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 4, t2, 4);
    if (t15 == 1)
        goto LAB46;

LAB47:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 4, t2, 4);
    if (t15 == 1)
        goto LAB48;

LAB49:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 4, t2, 4);
    if (t15 == 1)
        goto LAB50;

LAB51:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 4, t2, 4);
    if (t15 == 1)
        goto LAB52;

LAB53:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 4, t2, 4);
    if (t15 == 1)
        goto LAB54;

LAB55:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 4, t2, 4);
    if (t15 == 1)
        goto LAB56;

LAB57:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 4, t2, 4);
    if (t15 == 1)
        goto LAB58;

LAB59:
LAB61:
LAB60:    xsi_set_current_line(745, ng0);

LAB112:    xsi_set_current_line(746, ng0);
    t2 = (t0 + 2808U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB62:    goto LAB39;

LAB9:    xsi_set_current_line(751, ng0);

LAB113:    xsi_set_current_line(752, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB11:    xsi_set_current_line(755, ng0);

LAB114:    xsi_set_current_line(756, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB13:    xsi_set_current_line(759, ng0);

LAB115:    xsi_set_current_line(760, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB15:    xsi_set_current_line(763, ng0);

LAB116:    xsi_set_current_line(764, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB17:    xsi_set_current_line(767, ng0);

LAB117:    xsi_set_current_line(768, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB19:    xsi_set_current_line(771, ng0);

LAB118:    xsi_set_current_line(772, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB21:    xsi_set_current_line(775, ng0);

LAB119:    xsi_set_current_line(776, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB39;

LAB23:    xsi_set_current_line(779, ng0);

LAB120:    xsi_set_current_line(780, ng0);
    t3 = (t0 + 6648U);
    t5 = *((char **)t3);
    memset(t37, 0, 8);
    t3 = (t37 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t37) = t10;
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t3) = t13;
    t7 = (t37 + 4);
    t20 = *((unsigned int *)t7);
    t21 = (~(t20));
    t22 = *((unsigned int *)t37);
    t23 = (t22 & t21);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB121;

LAB122:    xsi_set_current_line(783, ng0);

LAB125:    xsi_set_current_line(784, ng0);
    t2 = (t0 + 2968U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB123:    goto LAB39;

LAB25:    xsi_set_current_line(788, ng0);

LAB126:    xsi_set_current_line(789, ng0);
    t3 = (t0 + 6648U);
    t5 = *((char **)t3);
    memset(t37, 0, 8);
    t3 = (t37 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t37) = t10;
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t3) = t13;
    t7 = (t37 + 4);
    t20 = *((unsigned int *)t7);
    t21 = (~(t20));
    t22 = *((unsigned int *)t37);
    t23 = (t22 & t21);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB127;

LAB128:    xsi_set_current_line(792, ng0);

LAB131:    xsi_set_current_line(793, ng0);
    t2 = (t0 + 2968U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB129:    goto LAB39;

LAB27:    xsi_set_current_line(797, ng0);

LAB132:    xsi_set_current_line(798, ng0);
    t3 = (t0 + 2328U);
    t5 = *((char **)t3);

LAB133:    t3 = ((char*)((ng1)));
    t27 = xsi_vlog_unsigned_case_compare(t5, 2, t3, 2);
    if (t27 == 1)
        goto LAB134;

LAB135:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t15 == 1)
        goto LAB136;

LAB137:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t15 == 1)
        goto LAB138;

LAB139:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t15 == 1)
        goto LAB140;

LAB141:
LAB142:    goto LAB39;

LAB29:    xsi_set_current_line(814, ng0);

LAB147:    xsi_set_current_line(815, ng0);
    t3 = (t0 + 2328U);
    t6 = *((char **)t3);

LAB148:    t3 = ((char*)((ng1)));
    t27 = xsi_vlog_unsigned_case_compare(t6, 2, t3, 2);
    if (t27 == 1)
        goto LAB149;

LAB150:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t15 == 1)
        goto LAB151;

LAB152:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t15 == 1)
        goto LAB153;

LAB154:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t15 == 1)
        goto LAB155;

LAB156:
LAB157:    goto LAB39;

LAB31:    xsi_set_current_line(831, ng0);

LAB162:    xsi_set_current_line(832, ng0);
    t3 = (t0 + 3928U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB39;

LAB33:    xsi_set_current_line(835, ng0);

LAB163:    xsi_set_current_line(836, ng0);
    t3 = (t0 + 8088U);
    t7 = *((char **)t3);
    memset(t37, 0, 8);
    t3 = (t37 + 4);
    t14 = (t7 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (t8 >> 0);
    *((unsigned int *)t37) = t9;
    t10 = *((unsigned int *)t14);
    t11 = (t10 >> 0);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t12 & 7U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 7U);

LAB164:    t17 = ((char*)((ng1)));
    t27 = xsi_vlog_unsigned_case_compare(t37, 3, t17, 3);
    if (t27 == 1)
        goto LAB165;

LAB166:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t37, 3, t2, 3);
    if (t15 == 1)
        goto LAB167;

LAB168:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t37, 3, t2, 3);
    if (t15 == 1)
        goto LAB169;

LAB170:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t37, 3, t2, 3);
    if (t15 == 1)
        goto LAB171;

LAB172:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t37, 3, t2, 3);
    if (t15 == 1)
        goto LAB173;

LAB174:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t37, 3, t2, 3);
    if (t15 == 1)
        goto LAB175;

LAB176:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t37, 3, t2, 3);
    if (t15 == 1)
        goto LAB177;

LAB178:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t37, 3, t2, 3);
    if (t15 == 1)
        goto LAB179;

LAB180:
LAB181:    goto LAB39;

LAB35:    xsi_set_current_line(864, ng0);

LAB190:    xsi_set_current_line(865, ng0);
    t3 = (t0 + 3928U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB39;

LAB37:    xsi_set_current_line(868, ng0);

LAB191:    xsi_set_current_line(869, ng0);
    t3 = (t0 + 1528U);
    t7 = *((char **)t3);
    memset(t38, 0, 8);
    t3 = (t38 + 4);
    t14 = (t7 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (t8 >> 8);
    *((unsigned int *)t38) = t9;
    t10 = *((unsigned int *)t14);
    t11 = (t10 >> 8);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t12 & 15U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 15U);

LAB192:
LAB194:    t2 = ((char*)((ng15)));
    t15 = xsi_vlog_unsigned_case_compare(t38, 4, t2, 4);
    if (t15 == 1)
        goto LAB195;

LAB196:    t2 = ((char*)((ng16)));
    t15 = xsi_vlog_unsigned_case_compare(t38, 4, t2, 4);
    if (t15 == 1)
        goto LAB197;

LAB198:
LAB193:    xsi_set_current_line(870, ng0);

LAB200:    xsi_set_current_line(871, ng0);
    t17 = (t0 + 8088U);
    t18 = *((char **)t17);
    memset(t39, 0, 8);
    t17 = (t39 + 4);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (t20 >> 0);
    *((unsigned int *)t39) = t21;
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 0);
    *((unsigned int *)t17) = t23;
    t24 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t24 & 7U);
    t25 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t25 & 7U);

LAB201:    t26 = ((char*)((ng1)));
    t27 = xsi_vlog_unsigned_case_compare(t39, 3, t26, 3);
    if (t27 == 1)
        goto LAB202;

LAB203:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t39, 3, t2, 3);
    if (t15 == 1)
        goto LAB204;

LAB205:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t39, 3, t2, 3);
    if (t15 == 1)
        goto LAB206;

LAB207:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t39, 3, t2, 3);
    if (t15 == 1)
        goto LAB208;

LAB209:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t39, 3, t2, 3);
    if (t15 == 1)
        goto LAB210;

LAB211:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t39, 3, t2, 3);
    if (t15 == 1)
        goto LAB212;

LAB213:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t39, 3, t2, 3);
    if (t15 == 1)
        goto LAB214;

LAB215:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t39, 3, t2, 3);
    if (t15 == 1)
        goto LAB216;

LAB217:
LAB218:
LAB199:    goto LAB39;

LAB42:    xsi_set_current_line(669, ng0);

LAB63:    xsi_set_current_line(670, ng0);
    t28 = (t0 + 2488U);
    t29 = *((char **)t28);
    t28 = (t29 + 4);
    t30 = *((unsigned int *)t28);
    t31 = (~(t30));
    t32 = *((unsigned int *)t29);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB64;

LAB65:    xsi_set_current_line(673, ng0);

LAB68:    xsi_set_current_line(674, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB66:    goto LAB62;

LAB44:    xsi_set_current_line(678, ng0);

LAB69:    xsi_set_current_line(679, ng0);
    t3 = (t0 + 2648U);
    t5 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 8);
    goto LAB62;

LAB46:    xsi_set_current_line(682, ng0);

LAB70:    xsi_set_current_line(683, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t5);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB71;

LAB72:    xsi_set_current_line(686, ng0);

LAB75:    xsi_set_current_line(687, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB73:    goto LAB62;

LAB48:    xsi_set_current_line(691, ng0);

LAB76:    xsi_set_current_line(692, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t5);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB77;

LAB78:    xsi_set_current_line(695, ng0);

LAB81:    xsi_set_current_line(696, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB79:    goto LAB62;

LAB50:    xsi_set_current_line(700, ng0);

LAB82:    xsi_set_current_line(701, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t5);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB83;

LAB84:    xsi_set_current_line(704, ng0);

LAB87:    xsi_set_current_line(705, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB85:    goto LAB62;

LAB52:    xsi_set_current_line(709, ng0);

LAB88:    xsi_set_current_line(710, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t5);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB89;

LAB90:    xsi_set_current_line(713, ng0);

LAB93:    xsi_set_current_line(714, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB91:    goto LAB62;

LAB54:    xsi_set_current_line(718, ng0);

LAB94:    xsi_set_current_line(719, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t5);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB95;

LAB96:    xsi_set_current_line(722, ng0);

LAB99:    xsi_set_current_line(723, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB97:    goto LAB62;

LAB56:    xsi_set_current_line(727, ng0);

LAB100:    xsi_set_current_line(728, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t5);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB101;

LAB102:    xsi_set_current_line(731, ng0);

LAB105:    xsi_set_current_line(732, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB103:    goto LAB62;

LAB58:    xsi_set_current_line(736, ng0);

LAB106:    xsi_set_current_line(737, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (~(t8));
    t10 = *((unsigned int *)t5);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB107;

LAB108:    xsi_set_current_line(740, ng0);

LAB111:    xsi_set_current_line(741, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);

LAB109:    goto LAB62;

LAB64:    xsi_set_current_line(670, ng0);

LAB67:    xsi_set_current_line(671, ng0);
    t35 = (t0 + 2808U);
    t36 = *((char **)t35);
    t35 = (t0 + 8968);
    xsi_vlogvar_assign_value(t35, t36, 0, 0, 8);
    goto LAB66;

LAB71:    xsi_set_current_line(683, ng0);

LAB74:    xsi_set_current_line(684, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8968);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB73;

LAB77:    xsi_set_current_line(692, ng0);

LAB80:    xsi_set_current_line(693, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8968);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB79;

LAB83:    xsi_set_current_line(701, ng0);

LAB86:    xsi_set_current_line(702, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8968);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB85;

LAB89:    xsi_set_current_line(710, ng0);

LAB92:    xsi_set_current_line(711, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8968);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB91;

LAB95:    xsi_set_current_line(719, ng0);

LAB98:    xsi_set_current_line(720, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8968);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB97;

LAB101:    xsi_set_current_line(728, ng0);

LAB104:    xsi_set_current_line(729, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8968);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB103;

LAB107:    xsi_set_current_line(737, ng0);

LAB110:    xsi_set_current_line(738, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t0 + 8968);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB109;

LAB121:    xsi_set_current_line(780, ng0);

LAB124:    xsi_set_current_line(781, ng0);
    t14 = (t0 + 3128U);
    t17 = *((char **)t14);
    t14 = (t0 + 8968);
    xsi_vlogvar_assign_value(t14, t17, 0, 0, 8);
    goto LAB123;

LAB127:    xsi_set_current_line(789, ng0);

LAB130:    xsi_set_current_line(790, ng0);
    t14 = (t0 + 3128U);
    t17 = *((char **)t14);
    t14 = (t0 + 8968);
    xsi_vlogvar_assign_value(t14, t17, 0, 0, 8);
    goto LAB129;

LAB134:    xsi_set_current_line(799, ng0);

LAB143:    xsi_set_current_line(800, ng0);
    t6 = (t0 + 3288U);
    t7 = *((char **)t6);
    t6 = (t0 + 8968);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 8);
    goto LAB142;

LAB136:    xsi_set_current_line(802, ng0);

LAB144:    xsi_set_current_line(803, ng0);
    t3 = (t0 + 3448U);
    t6 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 8);
    goto LAB142;

LAB138:    xsi_set_current_line(805, ng0);

LAB145:    xsi_set_current_line(806, ng0);
    t3 = (t0 + 3608U);
    t6 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 8);
    goto LAB142;

LAB140:    xsi_set_current_line(808, ng0);

LAB146:    xsi_set_current_line(809, ng0);
    t3 = (t0 + 3768U);
    t6 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 8);
    goto LAB142;

LAB149:    xsi_set_current_line(816, ng0);

LAB158:    xsi_set_current_line(817, ng0);
    t7 = (t0 + 3288U);
    t14 = *((char **)t7);
    t7 = (t0 + 8968);
    xsi_vlogvar_assign_value(t7, t14, 0, 0, 8);
    goto LAB157;

LAB151:    xsi_set_current_line(819, ng0);

LAB159:    xsi_set_current_line(820, ng0);
    t3 = (t0 + 3448U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB157;

LAB153:    xsi_set_current_line(822, ng0);

LAB160:    xsi_set_current_line(823, ng0);
    t3 = (t0 + 3608U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB157;

LAB155:    xsi_set_current_line(825, ng0);

LAB161:    xsi_set_current_line(826, ng0);
    t3 = (t0 + 3768U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB157;

LAB165:    xsi_set_current_line(837, ng0);

LAB182:    xsi_set_current_line(838, ng0);
    t18 = (t0 + 4088U);
    t19 = *((char **)t18);
    t18 = (t0 + 8968);
    xsi_vlogvar_assign_value(t18, t19, 0, 0, 8);
    goto LAB181;

LAB167:    xsi_set_current_line(840, ng0);

LAB183:    xsi_set_current_line(841, ng0);
    t3 = (t0 + 4088U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB169:    xsi_set_current_line(843, ng0);

LAB184:    xsi_set_current_line(844, ng0);
    t3 = (t0 + 4248U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB171:    xsi_set_current_line(846, ng0);

LAB185:    xsi_set_current_line(847, ng0);
    t3 = (t0 + 4408U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB173:    xsi_set_current_line(849, ng0);

LAB186:    xsi_set_current_line(850, ng0);
    t3 = (t0 + 4568U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB175:    xsi_set_current_line(852, ng0);

LAB187:    xsi_set_current_line(853, ng0);
    t3 = (t0 + 4728U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB177:    xsi_set_current_line(855, ng0);

LAB188:    xsi_set_current_line(856, ng0);
    t3 = (t0 + 4888U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB179:    xsi_set_current_line(858, ng0);

LAB189:    xsi_set_current_line(859, ng0);
    t3 = (t0 + 5048U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB181;

LAB195:    xsi_set_current_line(899, ng0);

LAB227:    xsi_set_current_line(900, ng0);
    t3 = (t0 + 1528U);
    t7 = *((char **)t3);
    memset(t40, 0, 8);
    t3 = (t40 + 4);
    t14 = (t7 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (t8 >> 4);
    *((unsigned int *)t40) = t9;
    t10 = *((unsigned int *)t14);
    t11 = (t10 >> 4);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t12 & 15U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 15U);

LAB228:    t17 = ((char*)((ng1)));
    t27 = xsi_vlog_unsigned_case_compare(t40, 4, t17, 4);
    if (t27 == 1)
        goto LAB229;

LAB230:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB231;

LAB232:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB233;

LAB234:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB235;

LAB236:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB237;

LAB238:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB239;

LAB240:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB241;

LAB242:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB243;

LAB244:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB245;

LAB246:    t2 = ((char*)((ng10)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB247;

LAB248:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB249;

LAB250:    t2 = ((char*)((ng12)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB251;

LAB252:    t2 = ((char*)((ng13)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB253;

LAB254:    t2 = ((char*)((ng14)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB255;

LAB256:    t2 = ((char*)((ng15)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB257;

LAB258:    t2 = ((char*)((ng16)));
    t15 = xsi_vlog_unsigned_case_compare(t40, 4, t2, 4);
    if (t15 == 1)
        goto LAB259;

LAB260:
LAB261:    goto LAB199;

LAB197:    xsi_set_current_line(967, ng0);

LAB278:    xsi_set_current_line(968, ng0);
    t3 = (t0 + 1528U);
    t7 = *((char **)t3);
    memset(t41, 0, 8);
    t3 = (t41 + 4);
    t14 = (t7 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (t8 >> 4);
    *((unsigned int *)t41) = t9;
    t10 = *((unsigned int *)t14);
    t11 = (t10 >> 4);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t12 & 15U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 15U);

LAB279:    t17 = ((char*)((ng1)));
    t27 = xsi_vlog_unsigned_case_compare(t41, 4, t17, 4);
    if (t27 == 1)
        goto LAB280;

LAB281:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB282;

LAB283:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB284;

LAB285:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB286;

LAB287:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB288;

LAB289:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB290;

LAB291:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB292;

LAB293:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB294;

LAB295:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB296;

LAB297:    t2 = ((char*)((ng10)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB298;

LAB299:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB300;

LAB301:    t2 = ((char*)((ng12)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB302;

LAB303:    t2 = ((char*)((ng13)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB304;

LAB305:    t2 = ((char*)((ng14)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB306;

LAB307:    t2 = ((char*)((ng15)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB308;

LAB309:    t2 = ((char*)((ng16)));
    t15 = xsi_vlog_unsigned_case_compare(t41, 4, t2, 4);
    if (t15 == 1)
        goto LAB310;

LAB311:
LAB312:    goto LAB199;

LAB202:    xsi_set_current_line(872, ng0);

LAB219:    xsi_set_current_line(873, ng0);
    t28 = (t0 + 4088U);
    t29 = *((char **)t28);
    t28 = (t0 + 8968);
    xsi_vlogvar_assign_value(t28, t29, 0, 0, 8);
    goto LAB218;

LAB204:    xsi_set_current_line(875, ng0);

LAB220:    xsi_set_current_line(876, ng0);
    t3 = (t0 + 4088U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB206:    xsi_set_current_line(878, ng0);

LAB221:    xsi_set_current_line(879, ng0);
    t3 = (t0 + 4248U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB208:    xsi_set_current_line(881, ng0);

LAB222:    xsi_set_current_line(882, ng0);
    t3 = (t0 + 4408U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB210:    xsi_set_current_line(884, ng0);

LAB223:    xsi_set_current_line(885, ng0);
    t3 = (t0 + 4568U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB212:    xsi_set_current_line(887, ng0);

LAB224:    xsi_set_current_line(888, ng0);
    t3 = (t0 + 4728U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB214:    xsi_set_current_line(890, ng0);

LAB225:    xsi_set_current_line(891, ng0);
    t3 = (t0 + 4888U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB216:    xsi_set_current_line(893, ng0);

LAB226:    xsi_set_current_line(894, ng0);
    t3 = (t0 + 5048U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB218;

LAB229:    xsi_set_current_line(901, ng0);

LAB262:    xsi_set_current_line(902, ng0);
    t18 = (t0 + 5208U);
    t19 = *((char **)t18);
    t18 = (t0 + 8968);
    xsi_vlogvar_assign_value(t18, t19, 0, 0, 8);
    goto LAB261;

LAB231:    xsi_set_current_line(905, ng0);

LAB263:    xsi_set_current_line(906, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB233:    xsi_set_current_line(909, ng0);

LAB264:    xsi_set_current_line(910, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB235:    xsi_set_current_line(913, ng0);

LAB265:    xsi_set_current_line(914, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB237:    xsi_set_current_line(917, ng0);

LAB266:    xsi_set_current_line(918, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB239:    xsi_set_current_line(921, ng0);

LAB267:    xsi_set_current_line(922, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB241:    xsi_set_current_line(925, ng0);

LAB268:    xsi_set_current_line(926, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB243:    xsi_set_current_line(929, ng0);

LAB269:    xsi_set_current_line(930, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB245:    xsi_set_current_line(933, ng0);

LAB270:    xsi_set_current_line(934, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB247:    xsi_set_current_line(937, ng0);

LAB271:    xsi_set_current_line(938, ng0);
    t3 = (t0 + 5208U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB261;

LAB249:    xsi_set_current_line(941, ng0);

LAB272:    xsi_set_current_line(942, ng0);
    t3 = (t0 + 8968);
    t7 = (t3 + 56U);
    t14 = *((char **)t7);
    t17 = (t0 + 8968);
    xsi_vlogvar_assign_value(t17, t14, 0, 0, 8);
    goto LAB261;

LAB251:    xsi_set_current_line(945, ng0);

LAB273:    xsi_set_current_line(946, ng0);
    t3 = (t0 + 8968);
    t7 = (t3 + 56U);
    t14 = *((char **)t7);
    t17 = (t0 + 8968);
    xsi_vlogvar_assign_value(t17, t14, 0, 0, 8);
    goto LAB261;

LAB253:    xsi_set_current_line(949, ng0);

LAB274:    xsi_set_current_line(950, ng0);
    t3 = (t0 + 8968);
    t7 = (t3 + 56U);
    t14 = *((char **)t7);
    t17 = (t0 + 8968);
    xsi_vlogvar_assign_value(t17, t14, 0, 0, 8);
    goto LAB261;

LAB255:    xsi_set_current_line(953, ng0);

LAB275:    xsi_set_current_line(954, ng0);
    t3 = (t0 + 8968);
    t7 = (t3 + 56U);
    t14 = *((char **)t7);
    t17 = (t0 + 8968);
    xsi_vlogvar_assign_value(t17, t14, 0, 0, 8);
    goto LAB261;

LAB257:    xsi_set_current_line(957, ng0);

LAB276:    xsi_set_current_line(958, ng0);
    t3 = (t0 + 8968);
    t7 = (t3 + 56U);
    t14 = *((char **)t7);
    t17 = (t0 + 8968);
    xsi_vlogvar_assign_value(t17, t14, 0, 0, 8);
    goto LAB261;

LAB259:    xsi_set_current_line(961, ng0);

LAB277:    xsi_set_current_line(962, ng0);
    t3 = (t0 + 8968);
    t7 = (t3 + 56U);
    t14 = *((char **)t7);
    t17 = (t0 + 8968);
    xsi_vlogvar_assign_value(t17, t14, 0, 0, 8);
    goto LAB261;

LAB280:    xsi_set_current_line(969, ng0);

LAB313:    xsi_set_current_line(970, ng0);
    t18 = (t0 + 1528U);
    t19 = *((char **)t18);
    memset(t42, 0, 8);
    t18 = (t42 + 4);
    t26 = (t19 + 4);
    t20 = *((unsigned int *)t19);
    t21 = (t20 >> 0);
    *((unsigned int *)t42) = t21;
    t22 = *((unsigned int *)t26);
    t23 = (t22 >> 0);
    *((unsigned int *)t18) = t23;
    t24 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t24 & 15U);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 & 15U);

LAB314:    t28 = ((char*)((ng1)));
    t43 = xsi_vlog_unsigned_case_compare(t42, 4, t28, 4);
    if (t43 == 1)
        goto LAB315;

LAB316:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t42, 4, t2, 4);
    if (t15 == 1)
        goto LAB317;

LAB318:    t2 = ((char*)((ng16)));
    t15 = xsi_vlog_unsigned_case_compare(t42, 4, t2, 4);
    if (t15 == 1)
        goto LAB319;

LAB320:
LAB322:
LAB321:    xsi_set_current_line(980, ng0);

LAB327:    xsi_set_current_line(981, ng0);
    t2 = (t0 + 8968);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t14 = (t0 + 8968);
    xsi_vlogvar_assign_value(t14, t7, 0, 0, 8);

LAB323:    goto LAB312;

LAB282:    xsi_set_current_line(986, ng0);

LAB328:    goto LAB312;

LAB284:    xsi_set_current_line(990, ng0);

LAB329:    goto LAB312;

LAB286:    xsi_set_current_line(994, ng0);

LAB330:    goto LAB312;

LAB288:    xsi_set_current_line(998, ng0);

LAB331:    xsi_set_current_line(999, ng0);
    t3 = (t0 + 1528U);
    t7 = *((char **)t3);
    memset(t44, 0, 8);
    t3 = (t44 + 4);
    t14 = (t7 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (t8 >> 0);
    *((unsigned int *)t44) = t9;
    t10 = *((unsigned int *)t14);
    t11 = (t10 >> 0);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t12 & 15U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 15U);

LAB332:    t17 = ((char*)((ng2)));
    t27 = xsi_vlog_unsigned_case_compare(t44, 4, t17, 4);
    if (t27 == 1)
        goto LAB333;

LAB334:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t15 == 1)
        goto LAB335;

LAB336:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t15 == 1)
        goto LAB337;

LAB338:    t2 = ((char*)((ng16)));
    t15 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t15 == 1)
        goto LAB339;

LAB340:
LAB342:
LAB341:    xsi_set_current_line(1012, ng0);

LAB348:    xsi_set_current_line(1013, ng0);
    t2 = (t0 + 8968);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t14 = (t0 + 8968);
    xsi_vlogvar_assign_value(t14, t7, 0, 0, 8);

LAB343:    goto LAB312;

LAB290:    xsi_set_current_line(1018, ng0);

LAB349:    xsi_set_current_line(1019, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t14 = *((char **)t7);
    memset(t45, 0, 8);
    t17 = (t45 + 4);
    t18 = (t14 + 4);
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t45) = t9;
    t10 = *((unsigned int *)t18);
    t11 = (t10 >> 0);
    *((unsigned int *)t17) = t11;
    t12 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t12 & 15U);
    t13 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t13 & 15U);

LAB350:    t19 = ((char*)((ng1)));
    t27 = xsi_vlog_unsigned_case_compare(t45, 4, t19, 4);
    if (t27 == 1)
        goto LAB351;

LAB352:
LAB353:    goto LAB312;

LAB292:    xsi_set_current_line(1026, ng0);

LAB355:    xsi_set_current_line(1027, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t14 = *((char **)t7);
    memset(t46, 0, 8);
    t17 = (t46 + 4);
    t18 = (t14 + 4);
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t46) = t9;
    t10 = *((unsigned int *)t18);
    t11 = (t10 >> 0);
    *((unsigned int *)t17) = t11;
    t12 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t12 & 15U);
    t13 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t13 & 15U);

LAB356:    t19 = ((char*)((ng10)));
    t27 = xsi_vlog_unsigned_case_compare(t46, 4, t19, 4);
    if (t27 == 1)
        goto LAB357;

LAB358:    t2 = ((char*)((ng12)));
    t15 = xsi_vlog_unsigned_case_compare(t46, 4, t2, 4);
    if (t15 == 1)
        goto LAB359;

LAB360:
LAB361:    goto LAB312;

LAB294:    xsi_set_current_line(1037, ng0);

LAB364:    xsi_set_current_line(1038, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t14 = *((char **)t7);
    memset(t47, 0, 8);
    t17 = (t47 + 4);
    t18 = (t14 + 4);
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t47) = t9;
    t10 = *((unsigned int *)t18);
    t11 = (t10 >> 0);
    *((unsigned int *)t17) = t11;
    t12 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t12 & 15U);
    t13 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t13 & 15U);

LAB365:    t19 = ((char*)((ng1)));
    t27 = xsi_vlog_unsigned_case_compare(t47, 4, t19, 4);
    if (t27 == 1)
        goto LAB366;

LAB367:
LAB368:    goto LAB312;

LAB296:    xsi_set_current_line(1045, ng0);

LAB370:    xsi_set_current_line(1046, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB298:    xsi_set_current_line(1049, ng0);

LAB371:    xsi_set_current_line(1050, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB300:    xsi_set_current_line(1053, ng0);

LAB372:    xsi_set_current_line(1054, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB302:    xsi_set_current_line(1057, ng0);

LAB373:    xsi_set_current_line(1058, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB304:    xsi_set_current_line(1061, ng0);

LAB374:    xsi_set_current_line(1062, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB306:    xsi_set_current_line(1065, ng0);

LAB375:    xsi_set_current_line(1066, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB308:    xsi_set_current_line(1069, ng0);

LAB376:    xsi_set_current_line(1070, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB312;

LAB310:    xsi_set_current_line(1073, ng0);

LAB377:    xsi_set_current_line(1074, ng0);
    t3 = (t0 + 11688);
    t7 = (t3 + 56U);
    t14 = *((char **)t7);
    memset(t48, 0, 8);
    t17 = (t48 + 4);
    t18 = (t14 + 4);
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t48) = t9;
    t10 = *((unsigned int *)t18);
    t11 = (t10 >> 0);
    *((unsigned int *)t17) = t11;
    t12 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t12 & 15U);
    t13 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t13 & 15U);

LAB378:    t19 = ((char*)((ng1)));
    t27 = xsi_vlog_unsigned_case_compare(t48, 4, t19, 4);
    if (t27 == 1)
        goto LAB379;

LAB380:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB381;

LAB382:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB383;

LAB384:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB385;

LAB386:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB387;

LAB388:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB389;

LAB390:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB391;

LAB392:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB393;

LAB394:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB395;

LAB396:    t2 = ((char*)((ng10)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB397;

LAB398:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB399;

LAB400:    t2 = ((char*)((ng12)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB401;

LAB402:    t2 = ((char*)((ng13)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB403;

LAB404:    t2 = ((char*)((ng14)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB405;

LAB406:    t2 = ((char*)((ng15)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB407;

LAB408:    t2 = ((char*)((ng16)));
    t15 = xsi_vlog_unsigned_case_compare(t48, 4, t2, 4);
    if (t15 == 1)
        goto LAB409;

LAB410:
LAB411:    goto LAB312;

LAB315:    xsi_set_current_line(971, ng0);

LAB324:    xsi_set_current_line(972, ng0);
    t29 = (t0 + 6168U);
    t35 = *((char **)t29);
    t29 = (t0 + 8968);
    xsi_vlogvar_assign_value(t29, t35, 0, 0, 8);
    goto LAB323;

LAB317:    xsi_set_current_line(974, ng0);

LAB325:    xsi_set_current_line(975, ng0);
    t3 = (t0 + 6168U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB323;

LAB319:    xsi_set_current_line(977, ng0);

LAB326:    xsi_set_current_line(978, ng0);
    t3 = (t0 + 6328U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB323;

LAB333:    xsi_set_current_line(1000, ng0);

LAB344:    xsi_set_current_line(1001, ng0);
    t18 = (t0 + 6488U);
    t19 = *((char **)t18);
    t18 = (t0 + 8968);
    xsi_vlogvar_assign_value(t18, t19, 0, 0, 8);
    goto LAB343;

LAB335:    xsi_set_current_line(1003, ng0);

LAB345:    xsi_set_current_line(1004, ng0);
    t3 = (t0 + 6008U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB343;

LAB337:    xsi_set_current_line(1006, ng0);

LAB346:    xsi_set_current_line(1007, ng0);
    t3 = (t0 + 5848U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB343;

LAB339:    xsi_set_current_line(1009, ng0);

LAB347:    xsi_set_current_line(1010, ng0);
    t3 = (t0 + 6648U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB343;

LAB351:    xsi_set_current_line(1020, ng0);

LAB354:    xsi_set_current_line(1021, ng0);
    t26 = (t0 + 6808U);
    t28 = *((char **)t26);
    t26 = (t0 + 8968);
    xsi_vlogvar_assign_value(t26, t28, 0, 0, 8);
    goto LAB353;

LAB357:    xsi_set_current_line(1028, ng0);

LAB362:    xsi_set_current_line(1029, ng0);
    t26 = (t0 + 5528U);
    t28 = *((char **)t26);
    t26 = (t0 + 8968);
    xsi_vlogvar_assign_value(t26, t28, 0, 0, 8);
    goto LAB361;

LAB359:    xsi_set_current_line(1031, ng0);

LAB363:    xsi_set_current_line(1032, ng0);
    t3 = (t0 + 5688U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB361;

LAB366:    xsi_set_current_line(1039, ng0);

LAB369:    xsi_set_current_line(1040, ng0);
    t26 = (t0 + 8088U);
    t28 = *((char **)t26);
    t26 = (t0 + 8968);
    xsi_vlogvar_assign_value(t26, t28, 0, 0, 8);
    goto LAB368;

LAB379:    xsi_set_current_line(1075, ng0);

LAB412:    xsi_set_current_line(1076, ng0);
    t26 = (t0 + 5368U);
    t28 = *((char **)t26);
    t26 = (t0 + 8968);
    xsi_vlogvar_assign_value(t26, t28, 0, 0, 8);
    goto LAB411;

LAB381:    xsi_set_current_line(1079, ng0);

LAB413:    xsi_set_current_line(1080, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB383:    xsi_set_current_line(1083, ng0);

LAB414:    xsi_set_current_line(1084, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB385:    xsi_set_current_line(1087, ng0);

LAB415:    xsi_set_current_line(1088, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB387:    xsi_set_current_line(1091, ng0);

LAB416:    xsi_set_current_line(1092, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB389:    xsi_set_current_line(1095, ng0);

LAB417:    xsi_set_current_line(1096, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB391:    xsi_set_current_line(1099, ng0);

LAB418:    xsi_set_current_line(1100, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB393:    xsi_set_current_line(1103, ng0);

LAB419:    xsi_set_current_line(1104, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB395:    xsi_set_current_line(1107, ng0);

LAB420:    xsi_set_current_line(1108, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB397:    xsi_set_current_line(1111, ng0);

LAB421:    xsi_set_current_line(1112, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB399:    xsi_set_current_line(1115, ng0);

LAB422:    xsi_set_current_line(1116, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB401:    xsi_set_current_line(1119, ng0);

LAB423:    xsi_set_current_line(1120, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB403:    xsi_set_current_line(1123, ng0);

LAB424:    xsi_set_current_line(1124, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB405:    xsi_set_current_line(1127, ng0);

LAB425:    xsi_set_current_line(1128, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB407:    xsi_set_current_line(1131, ng0);

LAB426:    xsi_set_current_line(1132, ng0);
    t3 = (t0 + 5368U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

LAB409:    xsi_set_current_line(1135, ng0);

LAB427:    xsi_set_current_line(1136, ng0);
    t3 = (t0 + 8248U);
    t7 = *((char **)t3);
    t3 = (t0 + 8968);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 8);
    goto LAB411;

}

static void Always_1149_4(char *t0)
{
    char t6[8];
    char t16[8];
    char t22[8];
    char t25[8];
    char t27[8];
    char t28[8];
    char t29[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    int t13;
    char *t14;
    char *t15;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    int t23;
    char *t24;
    char *t26;

LAB0:    t1 = (t0 + 13600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(1149, ng0);
    t2 = (t0 + 13968);
    *((int *)t2) = 1;
    t3 = (t0 + 13632);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(1149, ng0);

LAB5:    xsi_set_current_line(1152, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 9128);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(1153, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9288);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1155, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1156, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1157, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1158, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1160, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 10088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1161, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 10248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1162, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 10408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1163, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 10568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1164, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 10728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1165, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 10888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1166, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1167, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1169, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1170, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 11528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(1172, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 12);
    *((unsigned int *)t6) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 12);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t11 & 15U);
    t12 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t12 & 15U);

LAB6:    t5 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t5, 4);
    if (t13 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng10)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng11)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng12)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng13)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng14)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng15)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng16)));
    t13 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t13 == 1)
        goto LAB37;

LAB38:
LAB39:    goto LAB2;

LAB7:    xsi_set_current_line(1173, ng0);

LAB40:    xsi_set_current_line(1174, ng0);
    t14 = (t0 + 1368U);
    t15 = *((char **)t14);
    t14 = (t0 + 8648);
    xsi_vlogvar_assign_value(t14, t15, 0, 0, 16);
    goto LAB39;

LAB9:    xsi_set_current_line(1177, ng0);

LAB41:    xsi_set_current_line(1178, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB39;

LAB11:    xsi_set_current_line(1181, ng0);

LAB42:    xsi_set_current_line(1182, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB39;

LAB13:    xsi_set_current_line(1185, ng0);

LAB43:    xsi_set_current_line(1186, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB39;

LAB15:    xsi_set_current_line(1189, ng0);

LAB44:    xsi_set_current_line(1190, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB39;

LAB17:    xsi_set_current_line(1193, ng0);

LAB45:    xsi_set_current_line(1194, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB39;

LAB19:    xsi_set_current_line(1197, ng0);

LAB46:    xsi_set_current_line(1198, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB39;

LAB21:    xsi_set_current_line(1201, ng0);

LAB47:    xsi_set_current_line(1202, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB39;

LAB23:    xsi_set_current_line(1205, ng0);

LAB48:    xsi_set_current_line(1206, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng17)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_minus(t16, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t16, 0, 0, 16);
    xsi_set_current_line(1207, ng0);
    t2 = (t0 + 6648U);
    t3 = *((char **)t2);
    memset(t16, 0, 8);
    t2 = (t16 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 0);
    t9 = (t8 & 1);
    *((unsigned int *)t16) = t9;
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t2) = t12;
    t5 = (t16 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (~(t17));
    t19 = *((unsigned int *)t16);
    t20 = (t19 & t18);
    t21 = (t20 != 0);
    if (t21 > 0)
        goto LAB49;

LAB50:    xsi_set_current_line(1210, ng0);

LAB53:    xsi_set_current_line(1211, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 9128);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);

LAB51:    goto LAB39;

LAB25:    xsi_set_current_line(1215, ng0);

LAB54:    xsi_set_current_line(1216, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng17)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_minus(t16, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t16, 0, 0, 16);
    xsi_set_current_line(1217, ng0);
    t2 = (t0 + 6648U);
    t3 = *((char **)t2);
    memset(t16, 0, 8);
    t2 = (t16 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 0);
    t9 = (t8 & 1);
    *((unsigned int *)t16) = t9;
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t2) = t12;
    t5 = (t16 + 4);
    t17 = *((unsigned int *)t5);
    t18 = (~(t17));
    t19 = *((unsigned int *)t16);
    t20 = (t19 & t18);
    t21 = (t20 != 0);
    if (t21 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(1220, ng0);

LAB59:    xsi_set_current_line(1221, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 9128);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);

LAB57:    goto LAB39;

LAB27:    xsi_set_current_line(1225, ng0);

LAB60:    xsi_set_current_line(1226, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng18)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_minus(t16, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t16, 0, 0, 16);
    goto LAB39;

LAB29:    xsi_set_current_line(1229, ng0);

LAB61:    xsi_set_current_line(1230, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng18)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_minus(t16, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t16, 0, 0, 16);
    goto LAB39;

LAB31:    xsi_set_current_line(1233, ng0);

LAB62:    xsi_set_current_line(1234, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng19)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_minus(t16, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t16, 0, 0, 16);
    xsi_set_current_line(1235, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 10088);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB39;

LAB33:    xsi_set_current_line(1238, ng0);

LAB63:    xsi_set_current_line(1239, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng20)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_minus(t16, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t16, 0, 0, 16);
    xsi_set_current_line(1240, ng0);
    t2 = (t0 + 8088U);
    t3 = *((char **)t2);
    memset(t16, 0, 8);
    t2 = (t16 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 0);
    *((unsigned int *)t16) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t11 & 7U);
    t12 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t12 & 7U);

LAB64:    t5 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_compare(t16, 3, t5, 3);
    if (t13 == 1)
        goto LAB65;

LAB66:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t16, 3, t2, 3);
    if (t13 == 1)
        goto LAB67;

LAB68:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t16, 3, t2, 3);
    if (t13 == 1)
        goto LAB69;

LAB70:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t16, 3, t2, 3);
    if (t13 == 1)
        goto LAB71;

LAB72:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t16, 3, t2, 3);
    if (t13 == 1)
        goto LAB73;

LAB74:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t16, 3, t2, 3);
    if (t13 == 1)
        goto LAB75;

LAB76:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t16, 3, t2, 3);
    if (t13 == 1)
        goto LAB77;

LAB78:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t16, 3, t2, 3);
    if (t13 == 1)
        goto LAB79;

LAB80:
LAB81:    goto LAB39;

LAB35:    xsi_set_current_line(1268, ng0);

LAB90:    xsi_set_current_line(1269, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t22, 0, 8);
    xsi_vlog_unsigned_minus(t22, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t22, 0, 0, 16);
    goto LAB39;

LAB37:    xsi_set_current_line(1272, ng0);

LAB91:    xsi_set_current_line(1273, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    memset(t22, 0, 8);
    t3 = (t22 + 4);
    t5 = (t4 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (t7 >> 8);
    *((unsigned int *)t22) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 8);
    *((unsigned int *)t3) = t10;
    t11 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t11 & 15U);
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 15U);

LAB92:    t14 = ((char*)((ng1)));
    t23 = xsi_vlog_unsigned_case_compare(t22, 4, t14, 4);
    if (t23 == 1)
        goto LAB93;

LAB94:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB95;

LAB96:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB97;

LAB98:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB99;

LAB100:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB101;

LAB102:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB103;

LAB104:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB105;

LAB106:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB107;

LAB108:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB109;

LAB110:    t2 = ((char*)((ng10)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB111;

LAB112:    t2 = ((char*)((ng11)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB113;

LAB114:    t2 = ((char*)((ng12)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB115;

LAB116:    t2 = ((char*)((ng13)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB117;

LAB118:    t2 = ((char*)((ng14)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB119;

LAB120:    t2 = ((char*)((ng15)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB121;

LAB122:    t2 = ((char*)((ng16)));
    t13 = xsi_vlog_unsigned_case_compare(t22, 4, t2, 4);
    if (t13 == 1)
        goto LAB123;

LAB124:
LAB125:    goto LAB39;

LAB49:    xsi_set_current_line(1207, ng0);

LAB52:    xsi_set_current_line(1208, ng0);
    t14 = (t0 + 2168U);
    t15 = *((char **)t14);
    t14 = (t0 + 9288);
    xsi_vlogvar_assign_value(t14, t15, 0, 0, 1);
    goto LAB51;

LAB55:    xsi_set_current_line(1217, ng0);

LAB58:    xsi_set_current_line(1218, ng0);
    t14 = (t0 + 2168U);
    t15 = *((char **)t14);
    t14 = (t0 + 9288);
    xsi_vlogvar_assign_value(t14, t15, 0, 0, 1);
    goto LAB57;

LAB65:    xsi_set_current_line(1241, ng0);

LAB82:    xsi_set_current_line(1242, ng0);
    t14 = (t0 + 2168U);
    t15 = *((char **)t14);
    t14 = (t0 + 10248);
    xsi_vlogvar_assign_value(t14, t15, 0, 0, 1);
    goto LAB81;

LAB67:    xsi_set_current_line(1244, ng0);

LAB83:    xsi_set_current_line(1245, ng0);
    t3 = (t0 + 2168U);
    t4 = *((char **)t3);
    t3 = (t0 + 10248);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 1);
    goto LAB81;

LAB69:    xsi_set_current_line(1247, ng0);

LAB84:    xsi_set_current_line(1248, ng0);
    t3 = (t0 + 2168U);
    t4 = *((char **)t3);
    t3 = (t0 + 10408);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 1);
    goto LAB81;

LAB71:    xsi_set_current_line(1250, ng0);

LAB85:    xsi_set_current_line(1251, ng0);
    t3 = (t0 + 2168U);
    t4 = *((char **)t3);
    t3 = (t0 + 10568);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 1);
    goto LAB81;

LAB73:    xsi_set_current_line(1253, ng0);

LAB86:    xsi_set_current_line(1254, ng0);
    t3 = (t0 + 2168U);
    t4 = *((char **)t3);
    t3 = (t0 + 10728);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 1);
    goto LAB81;

LAB75:    xsi_set_current_line(1256, ng0);

LAB87:    xsi_set_current_line(1257, ng0);
    t3 = (t0 + 2168U);
    t4 = *((char **)t3);
    t3 = (t0 + 10888);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 1);
    goto LAB81;

LAB77:    xsi_set_current_line(1259, ng0);

LAB88:    xsi_set_current_line(1260, ng0);
    t3 = (t0 + 2168U);
    t4 = *((char **)t3);
    t3 = (t0 + 11048);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 1);
    goto LAB81;

LAB79:    xsi_set_current_line(1262, ng0);

LAB89:    xsi_set_current_line(1263, ng0);
    t3 = (t0 + 2168U);
    t4 = *((char **)t3);
    t3 = (t0 + 11208);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 1);
    goto LAB81;

LAB93:    xsi_set_current_line(1274, ng0);

LAB126:    xsi_set_current_line(1275, ng0);
    t15 = (t0 + 1368U);
    t24 = *((char **)t15);
    t15 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t24, 16, t15, 16);
    t26 = (t0 + 8648);
    xsi_vlogvar_assign_value(t26, t25, 0, 0, 16);
    goto LAB125;

LAB95:    xsi_set_current_line(1278, ng0);

LAB127:    xsi_set_current_line(1279, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB97:    xsi_set_current_line(1282, ng0);

LAB128:    xsi_set_current_line(1283, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB99:    xsi_set_current_line(1286, ng0);

LAB129:    xsi_set_current_line(1287, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB101:    xsi_set_current_line(1290, ng0);

LAB130:    xsi_set_current_line(1291, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB103:    xsi_set_current_line(1294, ng0);

LAB131:    xsi_set_current_line(1295, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB105:    xsi_set_current_line(1298, ng0);

LAB132:    xsi_set_current_line(1299, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB107:    xsi_set_current_line(1302, ng0);

LAB133:    xsi_set_current_line(1303, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB109:    xsi_set_current_line(1306, ng0);

LAB134:    xsi_set_current_line(1307, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB111:    xsi_set_current_line(1310, ng0);

LAB135:    xsi_set_current_line(1311, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB113:    xsi_set_current_line(1314, ng0);

LAB136:    xsi_set_current_line(1315, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB115:    xsi_set_current_line(1318, ng0);

LAB137:    xsi_set_current_line(1319, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB117:    xsi_set_current_line(1322, ng0);

LAB138:    xsi_set_current_line(1323, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB119:    xsi_set_current_line(1326, ng0);

LAB139:    xsi_set_current_line(1327, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng21)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_minus(t25, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t25, 0, 0, 16);
    goto LAB125;

LAB121:    xsi_set_current_line(1330, ng0);

LAB140:    xsi_set_current_line(1331, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    memset(t25, 0, 8);
    t3 = (t25 + 4);
    t5 = (t4 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (t7 >> 4);
    *((unsigned int *)t25) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 4);
    *((unsigned int *)t3) = t10;
    t11 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t11 & 15U);
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 15U);

LAB141:    t14 = ((char*)((ng1)));
    t23 = xsi_vlog_unsigned_case_compare(t25, 4, t14, 4);
    if (t23 == 1)
        goto LAB142;

LAB143:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB144;

LAB145:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB146;

LAB147:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB148;

LAB149:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB150;

LAB151:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB152;

LAB153:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB154;

LAB155:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB156;

LAB157:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB158;

LAB159:    t2 = ((char*)((ng10)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB160;

LAB161:    t2 = ((char*)((ng11)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB162;

LAB163:    t2 = ((char*)((ng12)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB164;

LAB165:    t2 = ((char*)((ng13)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB166;

LAB167:    t2 = ((char*)((ng14)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB168;

LAB169:    t2 = ((char*)((ng15)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB170;

LAB171:    t2 = ((char*)((ng16)));
    t13 = xsi_vlog_unsigned_case_compare(t25, 4, t2, 4);
    if (t13 == 1)
        goto LAB172;

LAB173:
LAB174:    goto LAB125;

LAB123:    xsi_set_current_line(1398, ng0);

LAB191:    xsi_set_current_line(1399, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    memset(t27, 0, 8);
    t3 = (t27 + 4);
    t5 = (t4 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (t7 >> 4);
    *((unsigned int *)t27) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 4);
    *((unsigned int *)t3) = t10;
    t11 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t11 & 15U);
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 15U);

LAB192:    t14 = ((char*)((ng1)));
    t23 = xsi_vlog_unsigned_case_compare(t27, 4, t14, 4);
    if (t23 == 1)
        goto LAB193;

LAB194:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB195;

LAB196:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB197;

LAB198:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB199;

LAB200:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB201;

LAB202:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB203;

LAB204:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB205;

LAB206:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB207;

LAB208:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB209;

LAB210:    t2 = ((char*)((ng10)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB211;

LAB212:    t2 = ((char*)((ng11)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB213;

LAB214:    t2 = ((char*)((ng12)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB215;

LAB216:    t2 = ((char*)((ng13)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB217;

LAB218:    t2 = ((char*)((ng14)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB219;

LAB220:    t2 = ((char*)((ng15)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB221;

LAB222:    t2 = ((char*)((ng16)));
    t13 = xsi_vlog_unsigned_case_compare(t27, 4, t2, 4);
    if (t13 == 1)
        goto LAB223;

LAB224:
LAB225:    goto LAB125;

LAB142:    xsi_set_current_line(1332, ng0);

LAB175:    xsi_set_current_line(1333, ng0);
    t15 = (t0 + 1368U);
    t24 = *((char **)t15);
    t15 = ((char*)((ng22)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t24, 16, t15, 16);
    t26 = (t0 + 8648);
    xsi_vlogvar_assign_value(t26, t27, 0, 0, 16);
    goto LAB174;

LAB144:    xsi_set_current_line(1336, ng0);

LAB176:    xsi_set_current_line(1337, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng22)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB146:    xsi_set_current_line(1340, ng0);

LAB177:    xsi_set_current_line(1341, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng22)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB148:    xsi_set_current_line(1344, ng0);

LAB178:    xsi_set_current_line(1345, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng22)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB150:    xsi_set_current_line(1348, ng0);

LAB179:    xsi_set_current_line(1349, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng22)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB152:    xsi_set_current_line(1352, ng0);

LAB180:    xsi_set_current_line(1353, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng22)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB154:    xsi_set_current_line(1356, ng0);

LAB181:    xsi_set_current_line(1357, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng22)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB156:    xsi_set_current_line(1360, ng0);

LAB182:    xsi_set_current_line(1361, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng22)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB158:    xsi_set_current_line(1364, ng0);

LAB183:    xsi_set_current_line(1365, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng22)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB160:    xsi_set_current_line(1368, ng0);

LAB184:    xsi_set_current_line(1369, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng22)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB162:    xsi_set_current_line(1372, ng0);

LAB185:    xsi_set_current_line(1373, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng23)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB164:    xsi_set_current_line(1376, ng0);

LAB186:    xsi_set_current_line(1377, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng23)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB166:    xsi_set_current_line(1380, ng0);

LAB187:    xsi_set_current_line(1381, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng23)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB168:    xsi_set_current_line(1384, ng0);

LAB188:    xsi_set_current_line(1385, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng23)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB170:    xsi_set_current_line(1388, ng0);

LAB189:    xsi_set_current_line(1389, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng23)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB172:    xsi_set_current_line(1392, ng0);

LAB190:    xsi_set_current_line(1393, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng23)));
    memset(t27, 0, 8);
    xsi_vlog_unsigned_minus(t27, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t27, 0, 0, 16);
    goto LAB174;

LAB193:    xsi_set_current_line(1400, ng0);

LAB226:    xsi_set_current_line(1401, ng0);
    t15 = (t0 + 1368U);
    t24 = *((char **)t15);
    t15 = (t0 + 8648);
    xsi_vlogvar_assign_value(t15, t24, 0, 0, 16);
    goto LAB225;

LAB195:    xsi_set_current_line(1404, ng0);

LAB227:    xsi_set_current_line(1405, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB225;

LAB197:    xsi_set_current_line(1408, ng0);

LAB228:    xsi_set_current_line(1409, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB225;

LAB199:    xsi_set_current_line(1412, ng0);

LAB229:    xsi_set_current_line(1413, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB225;

LAB201:    xsi_set_current_line(1416, ng0);

LAB230:    xsi_set_current_line(1417, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB225;

LAB203:    xsi_set_current_line(1420, ng0);

LAB231:    xsi_set_current_line(1421, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB225;

LAB205:    xsi_set_current_line(1424, ng0);

LAB232:    xsi_set_current_line(1425, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB225;

LAB207:    xsi_set_current_line(1428, ng0);

LAB233:    xsi_set_current_line(1429, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB225;

LAB209:    xsi_set_current_line(1432, ng0);

LAB234:    xsi_set_current_line(1433, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_minus(t28, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t28, 0, 0, 16);
    xsi_set_current_line(1434, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB225;

LAB211:    xsi_set_current_line(1437, ng0);

LAB235:    xsi_set_current_line(1438, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_minus(t28, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t28, 0, 0, 16);
    xsi_set_current_line(1439, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB225;

LAB213:    xsi_set_current_line(1442, ng0);

LAB236:    xsi_set_current_line(1443, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_minus(t28, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t28, 0, 0, 16);
    xsi_set_current_line(1444, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB225;

LAB215:    xsi_set_current_line(1447, ng0);

LAB237:    xsi_set_current_line(1448, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_minus(t28, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t28, 0, 0, 16);
    xsi_set_current_line(1449, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB225;

LAB217:    xsi_set_current_line(1452, ng0);

LAB238:    xsi_set_current_line(1453, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_minus(t28, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t28, 0, 0, 16);
    xsi_set_current_line(1454, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB225;

LAB219:    xsi_set_current_line(1457, ng0);

LAB239:    xsi_set_current_line(1458, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_minus(t28, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t28, 0, 0, 16);
    xsi_set_current_line(1459, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB225;

LAB221:    xsi_set_current_line(1462, ng0);

LAB240:    xsi_set_current_line(1463, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t28, 0, 8);
    xsi_vlog_unsigned_minus(t28, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t28, 0, 0, 16);
    xsi_set_current_line(1464, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB225;

LAB223:    xsi_set_current_line(1467, ng0);

LAB241:    xsi_set_current_line(1468, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    memset(t28, 0, 8);
    t3 = (t28 + 4);
    t5 = (t4 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (t7 >> 0);
    *((unsigned int *)t28) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    *((unsigned int *)t3) = t10;
    t11 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t11 & 15U);
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 15U);

LAB242:    t14 = ((char*)((ng1)));
    t23 = xsi_vlog_unsigned_case_compare(t28, 4, t14, 4);
    if (t23 == 1)
        goto LAB243;

LAB244:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB245;

LAB246:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB247;

LAB248:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB249;

LAB250:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB251;

LAB252:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB253;

LAB254:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB255;

LAB256:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB257;

LAB258:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB259;

LAB260:    t2 = ((char*)((ng10)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB261;

LAB262:    t2 = ((char*)((ng11)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB263;

LAB264:    t2 = ((char*)((ng12)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB265;

LAB266:    t2 = ((char*)((ng13)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB267;

LAB268:    t2 = ((char*)((ng14)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB269;

LAB270:    t2 = ((char*)((ng15)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB271;

LAB272:    t2 = ((char*)((ng16)));
    t13 = xsi_vlog_unsigned_case_compare(t28, 4, t2, 4);
    if (t13 == 1)
        goto LAB273;

LAB274:
LAB275:    goto LAB225;

LAB243:    xsi_set_current_line(1469, ng0);

LAB276:    xsi_set_current_line(1470, ng0);
    t15 = (t0 + 1368U);
    t24 = *((char **)t15);
    t15 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t24, 16, t15, 16);
    t26 = (t0 + 8648);
    xsi_vlogvar_assign_value(t26, t29, 0, 0, 16);
    xsi_set_current_line(1471, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB245:    xsi_set_current_line(1474, ng0);

LAB277:    xsi_set_current_line(1475, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1476, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB247:    xsi_set_current_line(1479, ng0);

LAB278:    xsi_set_current_line(1480, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1481, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB249:    xsi_set_current_line(1484, ng0);

LAB279:    xsi_set_current_line(1485, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1486, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB251:    xsi_set_current_line(1489, ng0);

LAB280:    xsi_set_current_line(1490, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1491, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB253:    xsi_set_current_line(1494, ng0);

LAB281:    xsi_set_current_line(1495, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1496, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB255:    xsi_set_current_line(1499, ng0);

LAB282:    xsi_set_current_line(1500, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1501, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB257:    xsi_set_current_line(1504, ng0);

LAB283:    xsi_set_current_line(1505, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1506, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB259:    xsi_set_current_line(1509, ng0);

LAB284:    xsi_set_current_line(1510, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1511, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB261:    xsi_set_current_line(1514, ng0);

LAB285:    xsi_set_current_line(1515, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1516, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB263:    xsi_set_current_line(1519, ng0);

LAB286:    xsi_set_current_line(1520, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1521, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB265:    xsi_set_current_line(1524, ng0);

LAB287:    xsi_set_current_line(1525, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1526, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB267:    xsi_set_current_line(1529, ng0);

LAB288:    xsi_set_current_line(1530, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1531, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB269:    xsi_set_current_line(1534, ng0);

LAB289:    xsi_set_current_line(1535, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1536, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB271:    xsi_set_current_line(1539, ng0);

LAB290:    xsi_set_current_line(1540, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng24)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    xsi_set_current_line(1541, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 11528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    goto LAB275;

LAB273:    xsi_set_current_line(1544, ng0);

LAB291:    xsi_set_current_line(1545, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng25)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 16, t4, 16, t3, 16);
    t5 = (t0 + 8648);
    xsi_vlogvar_assign_value(t5, t29, 0, 0, 16);
    goto LAB275;

}


extern void work_m_00000000000841645702_1231679156_init()
{
	static char *pe[] = {(void *)Cont_141_0,(void *)Always_145_1,(void *)Always_155_2,(void *)Always_665_3,(void *)Always_1149_4};
	xsi_register_didat("work_m_00000000000841645702_1231679156", "isim/tb_isim_beh.exe.sim/work/m_00000000000841645702_1231679156.didat");
	xsi_register_executes(pe);
}
