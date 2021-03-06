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
    work_m_00000000000194835517_4026924095_init();
    unisims_ver_m_00000000003631541332_1336192191_init();
    unisims_ver_m_00000000004146189403_3839349792_init();
    work_m_00000000003148012247_0351594120_init();
    xilinxcorelib_ver_m_00000000001358910285_0762544251_init();
    xilinxcorelib_ver_m_00000000001687936702_4010766627_init();
    xilinxcorelib_ver_m_00000000000456851583_2163228903_init();
    xilinxcorelib_ver_m_00000000001603977570_3339021304_init();
    work_m_00000000003289761879_1614110532_init();
    work_m_00000000004081671546_0975962166_init();
    work_m_00000000004060082010_1524327968_init();
    work_m_00000000002146322344_0886308060_init();
    work_m_00000000001188448399_0924832676_init();
    work_m_00000000000835480144_1231679156_init();
    work_m_00000000002838335823_3241795565_init();
    work_m_00000000000916122190_4071936101_init();
    work_m_00000000004000458140_0557852902_init();
    work_m_00000000004000458140_1293535217_init();
    work_m_00000000004000458140_3270845860_init();
    work_m_00000000001803964604_1508321868_init();
    work_m_00000000003427664185_2070152269_init();
    work_m_00000000004000458140_0499366614_init();
    work_m_00000000004000458140_1373190775_init();
    work_m_00000000001582697730_2381739659_init();
    work_m_00000000003488540803_0913898041_init();
    work_m_00000000001919341735_2051753848_init();
    work_m_00000000003427664185_1600167844_init();
    work_m_00000000001205155178_1455714580_init();
    work_m_00000000000762132485_3671711236_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000762132485_3671711236");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
