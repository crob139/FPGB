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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    unisims_ver_m_00000000004078089572_0193655571_init();
    unisims_ver_m_00000000003266096158_2593380106_init();
    unisims_ver_m_00000000004091665089_1344024585_init();
    work_m_00000000003372393510_1277538928_init();
    work_m_00000000001540476521_4026924095_init();
    unisims_ver_m_00000000003631541332_1336192191_init();
    unisims_ver_m_00000000004146189403_3839349792_init();
    work_m_00000000000513900028_0351594120_init();
    work_m_00000000001205155178_1455714580_init();
    work_m_00000000000183937513_3671711236_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000183937513_3671711236");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
