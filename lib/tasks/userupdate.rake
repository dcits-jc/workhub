namespace :userupdate do


  desc "seed update user attachment"

  # 文件上传列表
  attachment_arrary = [
    {itcode:'yuanyd',resume_attachment:'yuanyd_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'luzm',resume_attachment:'',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'liangchaob',resume_attachment:'liangchaob_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'yanges',resume_attachment:'yanges_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'hepengc',resume_attachment:'hepengc_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'liyjs',resume_attachment:'liyjs_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'handjb',resume_attachment:'',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'houxhb',resume_attachment:'',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'hujn',resume_attachment:'',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'cuijwa',resume_attachment:'cuijwa_resume.doc',degree_attachment:'cuijwa_degree.png',academic_attachment:'',idcard_attachment:'cuijwa_idcard.png'},
    {itcode:'huangsheng',resume_attachment:'',degree_attachment:'huangsheng_degree.png',academic_attachment:'',idcard_attachment:'huangsheng_idcard.png'},
    {itcode:'liussb',resume_attachment:'liussb_resume.doc',degree_attachment:'liussb_degree.png',academic_attachment:'',idcard_attachment:'liussb_idcard.png'},
    {itcode:'linsongb',resume_attachment:'linsongb_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'hejce',resume_attachment:'hejce_resume.doc',degree_attachment:'hejce_degree.png',academic_attachment:'hejce_academic.png',idcard_attachment:'hejce_idcard.png'},
    {itcode:'hujwe',resume_attachment:'hujwe_resume.doc',degree_attachment:'',academic_attachment:'hujwe_academic.png',idcard_attachment:'hujwe_idcard.png'},
    {itcode:'zhancy',resume_attachment:'',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'zhuywd',resume_attachment:'zhuywd_resume.doc',degree_attachment:'zhuywd_degree.png',academic_attachment:'zhuywd_academic.png',idcard_attachment:'zhuywd_idcard.png'},
    {itcode:'zhangzhend',resume_attachment:'zhangzhend_resume.doc',degree_attachment:'zhangzhend_degree.png',academic_attachment:'',idcard_attachment:'zhangzhend_idcard.png'},
    {itcode:'wuyln',resume_attachment:'wuyln_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'wangmhc',resume_attachment:'',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'liumgb',resume_attachment:'liumgb_resume.doc',degree_attachment:'liumgb_degree.png',academic_attachment:'',idcard_attachment:'liumgb_idcard.png'},
    {itcode:'yangqmc',resume_attachment:'yangqmc_resume.doc',degree_attachment:'yangqmc_degree.png',academic_attachment:'yangqmc_academic.png',idcard_attachment:'yangqmc_idcard.png'},
    {itcode:'hegha',resume_attachment:'hegha_resume.doc',degree_attachment:'hegha_degree.png',academic_attachment:'',idcard_attachment:'hegha_idcard.png'},
    {itcode:'mengwd',resume_attachment:'mengwd_resume.doc',degree_attachment:'mengwd_degree.png',academic_attachment:'',idcard_attachment:'mengwd_idcard.png'},
    {itcode:'chenydf',resume_attachment:'chenydf_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'tongkaia',resume_attachment:'',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'zhusle',resume_attachment:'',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'pengmha',resume_attachment:'',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'zhangjianau',resume_attachment:'zhangjianau_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'zhaodqa',resume_attachment:'',degree_attachment:'zhaodqa_degree.png',academic_attachment:'',idcard_attachment:'zhaodqa_idcard.png'},
    {itcode:'wangqunb',resume_attachment:'wangqunb_resume.doc',degree_attachment:'wangqunb_degree.png',academic_attachment:'',idcard_attachment:'wangqunb_idcard.png'},
    {itcode:'liugwc',resume_attachment:'liugwc_resume.doc',degree_attachment:'liugwc_degree.png',academic_attachment:'',idcard_attachment:'liugwc_idcard.png'},
    {itcode:'wangxbt',resume_attachment:'wangxbt_resume.doc',degree_attachment:'wangxbt_degree.png',academic_attachment:'',idcard_attachment:'wangxbt_idcard.png'},
    {itcode:'xiachuan',resume_attachment:'xiachuan_resume.doc',degree_attachment:'xiachuan_degree.png',academic_attachment:'xiachuan_academic.png',idcard_attachment:'xiachuan_idcard.png'},
    {itcode:'leina',resume_attachment:'leina_resume.doc',degree_attachment:'',academic_attachment:'leina_academic.png',idcard_attachment:'leina_idcard.png'},
    {itcode:'lvjiand',resume_attachment:'lvjiand_resume.doc',degree_attachment:'lvjiand_degree.png',academic_attachment:'',idcard_attachment:'lvjiand_idcard.png'},
    {itcode:'luohjc',resume_attachment:'luohjc_resume.doc',degree_attachment:'luohjc_degree.png',academic_attachment:'luohjc_academic.png',idcard_attachment:'luohjc_idcard.png'},
    {itcode:'wanggangac',resume_attachment:'',degree_attachment:'wanggangac_degree.png',academic_attachment:'',idcard_attachment:'wanggangac_idcard.png'},
    {itcode:'daiyla',resume_attachment:'daiyla_resume.doc',degree_attachment:'daiyla_degree.png',academic_attachment:'daiyla_academic.png',idcard_attachment:'daiyla_idcard.png'},
    {itcode:'guosqb',resume_attachment:'guosqb_resume.doc',degree_attachment:'guosqb_degree.png',academic_attachment:'',idcard_attachment:'guosqb_idcard.png'},
    {itcode:'gaojh',resume_attachment:'gaojh_resume.doc',degree_attachment:'gaojh_degree.png',academic_attachment:'',idcard_attachment:'gaojh_idcard.png'},
    {itcode:'guojca',resume_attachment:'guojca_resume.doc',degree_attachment:'guojca_degree.png',academic_attachment:'',idcard_attachment:'guojca_idcard.png'},
    {itcode:'liuxw',resume_attachment:'liuxw_resume.doc',degree_attachment:'liuxw_degree.png',academic_attachment:'',idcard_attachment:'liuxw_idcard.png'},
    {itcode:'zhangbol',resume_attachment:'zhangbol_resume.doc',degree_attachment:'zhangbol_degree.png',academic_attachment:'',idcard_attachment:'zhangbol_idcard.png'},
    {itcode:'yangfj',resume_attachment:'yangfj_resume.doc',degree_attachment:'yangfj_degree.png',academic_attachment:'yangfj_academic.png',idcard_attachment:'yangfj_idcard.png'},
    {itcode:'zhaolla',resume_attachment:'zhaolla_resume.doc',degree_attachment:'zhaolla_degree.png',academic_attachment:'zhaolla_academic.png',idcard_attachment:'zhaolla_idcard.png'},
    {itcode:'tianxl',resume_attachment:'tianxl_resume.doc',degree_attachment:'tianxl_degree.png',academic_attachment:'tianxl_academic.png',idcard_attachment:'tianxl_idcard.png'},
    {itcode:'zhengweic',resume_attachment:'zhengweic_resume.doc',degree_attachment:'zhengweic_degree.png',academic_attachment:'zhengweic_academic.png',idcard_attachment:'zhengweic_idcard.png'},
    {itcode:'huangxu',resume_attachment:'huangxu_resume.doc',degree_attachment:'huangxu_degree.png',academic_attachment:'huangxu_academic.png',idcard_attachment:'huangxu_idcard.png'},
    {itcode:'sunzqa',resume_attachment:'sunzqa_resume.doc',degree_attachment:'sunzqa_degree.png',academic_attachment:'sunzqa_academic.png',idcard_attachment:'sunzqa_idcard.png'},
    {itcode:'luyid',resume_attachment:'luyid_resume.doc',degree_attachment:'luyid_degree.png',academic_attachment:'luyid_academic.png',idcard_attachment:'luyid_idcard.png'},
    {itcode:'lilongl',resume_attachment:'',degree_attachment:'lilongl_degree.png',academic_attachment:'lilongl_academic.png',idcard_attachment:'lilongl_idcard.png'},
    {itcode:'linsenb',resume_attachment:'linsenb_resume.doc',degree_attachment:'linsenb_degree.png',academic_attachment:'',idcard_attachment:'linsenb_idcard.png'},
    {itcode:'fengzhong',resume_attachment:'fengzhong_resume.doc',degree_attachment:'fengzhong_degree.png',academic_attachment:'',idcard_attachment:'fengzhong_idcard.png'},
    {itcode:'zhangjra',resume_attachment:'zhangjra_resume.doc',degree_attachment:'zhangjra_degree.png',academic_attachment:'',idcard_attachment:'zhangjra_idcard.png'},
    {itcode:'huangybc',resume_attachment:'huangybc_resume.doc',degree_attachment:'huangybc_degree.png',academic_attachment:'huangybc_academic.png',idcard_attachment:'huangybc_idcard.png'},
    {itcode:'niepeng',resume_attachment:'niepeng_resume.doc',degree_attachment:'niepeng_degree.png',academic_attachment:'niepeng_academic.png',idcard_attachment:'niepeng_idcard.png'},
    {itcode:'sunfmb',resume_attachment:'sunfmb_resume.doc',degree_attachment:'sunfmb_degree.png',academic_attachment:'',idcard_attachment:'sunfmb_idcard.png'},
    {itcode:'liyingw',resume_attachment:'liyingw_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'malq',resume_attachment:'malq_resume.doc',degree_attachment:'malq_degree.png',academic_attachment:'malq_academic.png',idcard_attachment:'malq_idcard.png'},
    {itcode:'dongxyb',resume_attachment:'dongxyb_resume.doc',degree_attachment:'dongxyb_degree.png',academic_attachment:'',idcard_attachment:'dongxyb_idcard.png'},
    {itcode:'zouwj',resume_attachment:'',degree_attachment:'zouwj_degree.png',academic_attachment:'',idcard_attachment:'zouwj_idcard.png'},
    {itcode:'aizy',resume_attachment:'',degree_attachment:'aizy_degree.png',academic_attachment:'',idcard_attachment:'aizy_idcard.png'},
    {itcode:'lishf',resume_attachment:'lishf_resume.doc',degree_attachment:'',academic_attachment:'lishf_academic.png',idcard_attachment:'lishf_idcard.png'},
    {itcode:'zhangbin',resume_attachment:'zhangbin_resume.doc',degree_attachment:'',academic_attachment:'zhangbin_academic.png',idcard_attachment:'zhangbin_idcard.png'},
    {itcode:'chengxinc',resume_attachment:'chengxinc_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'hanymc',resume_attachment:'hanymc_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'wendan',resume_attachment:'wendan_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'zhangwzc',resume_attachment:'zhangwzc_resume.doc',degree_attachment:'zhangwzc_degree.png',academic_attachment:'',idcard_attachment:'zhangwzc_idcard.png'},
    {itcode:'zhangquand',resume_attachment:'zhangquand_resume.doc',degree_attachment:'zhangquand_degree.png',academic_attachment:'',idcard_attachment:'zhangquand_idcard.png'},
    {itcode:'jinliang',resume_attachment:'jinliang_resume.doc',degree_attachment:'jinliang_degree.png',academic_attachment:'jinliang_academic.png',idcard_attachment:'jinliang_idcard.png'},
    {itcode:'zhanghma',resume_attachment:'zhanghma_resume.doc',degree_attachment:'zhanghma_degree.png',academic_attachment:'',idcard_attachment:'zhanghma_idcard.png'},
    {itcode:'quyi',resume_attachment:'quyi_resume.doc',degree_attachment:'quyi_degree.png',academic_attachment:'quyi_academic.png',idcard_attachment:'quyi_idcard.png'},
    {itcode:'wangyuec',resume_attachment:'wangyuec_resume.doc',degree_attachment:'',academic_attachment:'wangyuec_academic.png',idcard_attachment:'wangyuec_idcard.png'},
    {itcode:'wuweim',resume_attachment:'wuweim_resume.doc',degree_attachment:'wuweim_degree.png',academic_attachment:'wuweim_academic.png',idcard_attachment:'wuweim_idcard.png'},
    {itcode:'caogs',resume_attachment:'caogs_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'songleib',resume_attachment:'songleib_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'wanghaoo',resume_attachment:'wanghaoo_resume.doc',degree_attachment:'wanghaoo_degree.png',academic_attachment:'',idcard_attachment:'wanghaoo_idcard.png'},
    {itcode:'zhangjingaq',resume_attachment:'zhangjingaq_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'sutaoa',resume_attachment:'sutaoa_resume.doc',degree_attachment:'sutaoa_degree.png',academic_attachment:'sutaoa_academic.png',idcard_attachment:'sutaoa_idcard.png'},
    {itcode:'liujyy',resume_attachment:'liujyy_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'yangfengg',resume_attachment:'yangfengg_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'fangmeng',resume_attachment:'fangmeng_resume.doc',degree_attachment:'fangmeng_degree.png',academic_attachment:'fangmeng_academic.png',idcard_attachment:'fangmeng_idcard.png'},
    {itcode:'xuzx',resume_attachment:'xuzx_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'liqingd',resume_attachment:'liqingd_resume.doc',degree_attachment:'liqingd_degree.png',academic_attachment:'',idcard_attachment:'liqingd_idcard.png'},
    {itcode:'wangchaor',resume_attachment:'wangchaor_resume.doc',degree_attachment:'wangchaor_degree.png',academic_attachment:'wangchaor_academic.png',idcard_attachment:'wangchaor_idcard.png'},
    {itcode:'pengsf',resume_attachment:'pengsf_resume.doc',degree_attachment:'pengsf_degree.png',academic_attachment:'pengsf_academic.png',idcard_attachment:'pengsf_idcard.png'},
    {itcode:'zhangdcb',resume_attachment:'zhangdcb_resume.doc',degree_attachment:'zhangdcb_degree.png',academic_attachment:'zhangdcb_academic.png',idcard_attachment:'zhangdcb_idcard.png'},
    {itcode:'sungn',resume_attachment:'sungn_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'zhangkunp',resume_attachment:'zhangkunp_resume.doc',degree_attachment:'zhangkunp_degree.png',academic_attachment:'zhangkunp_academic.png',idcard_attachment:'zhangkunp_idcard.png'},
    {itcode:'taosqb',resume_attachment:'taosqb_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'caixcd',resume_attachment:'caixcd_resume.doc',degree_attachment:'caixcd_degree.png',academic_attachment:'caixcd_academic.png',idcard_attachment:'caixcd_idcard.png'},
    {itcode:'xiangyub',resume_attachment:'xiangyub_resume.doc',degree_attachment:'xiangyub_degree.png',academic_attachment:'xiangyub_academic.png',idcard_attachment:'xiangyub_idcard.png'},
    {itcode:'tangliange',resume_attachment:'tangliange_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'chenqii',resume_attachment:'chenqii_resume.doc',degree_attachment:'chenqii_degree.png',academic_attachment:'',idcard_attachment:'chenqii_idcard.png'},
    {itcode:'guobind',resume_attachment:'guobind_resume.doc',degree_attachment:'guobind_degree.png',academic_attachment:'guobind_academic.png',idcard_attachment:'guobind_idcard.png'},
    {itcode:'xiaocgc',resume_attachment:'xiaocgc_resume.doc',degree_attachment:'xiaocgc_degree.png',academic_attachment:'xiaocgc_academic.png',idcard_attachment:'xiaocgc_idcard.png'},
    {itcode:'wanghwo',resume_attachment:'wanghwo_resume.doc',degree_attachment:'wanghwo_degree.png',academic_attachment:'wanghwo_academic.png',idcard_attachment:'wanghwo_idcard.png'},
    {itcode:'maoxsa',resume_attachment:'maoxsa_resume.doc',degree_attachment:'maoxsa_degree.png',academic_attachment:'maoxsa_academic.png',idcard_attachment:'maoxsa_idcard.png'},
    {itcode:'menghr',resume_attachment:'menghr_resume.doc',degree_attachment:'menghr_degree.png',academic_attachment:'menghr_academic.png',idcard_attachment:'menghr_idcard.png'},
    {itcode:'huzfb',resume_attachment:'huzfb_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:'huzfb_idcard.png'},
    {itcode:'zhugyc',resume_attachment:'zhugyc_resume.doc',degree_attachment:'zhugyc_degree.png',academic_attachment:'',idcard_attachment:'zhugyc_idcard.png'},
    {itcode:'tianmina',resume_attachment:'',degree_attachment:'tianmina_degree.png',academic_attachment:'tianmina_academic.png',idcard_attachment:'tianmina_idcard.png'},
    {itcode:'gaohq',resume_attachment:'gaohq_resume.doc',degree_attachment:'gaohq_degree.png',academic_attachment:'',idcard_attachment:'gaohq_idcard.png'},
    {itcode:'hefeig',resume_attachment:'',degree_attachment:'hefeig_degree.png',academic_attachment:'',idcard_attachment:'hefeig_idcard.png'},
    {itcode:'chenzhanc',resume_attachment:'chenzhanc_resume.doc',degree_attachment:'chenzhanc_degree.png',academic_attachment:'',idcard_attachment:'chenzhanc_idcard.png'},
    {itcode:'chenzwc',resume_attachment:'chenzwc_resume.doc',degree_attachment:'chenzwc_degree.png',academic_attachment:'chenzwc_academic.png',idcard_attachment:'chenzwc_idcard.png'},
    {itcode:'xutao',resume_attachment:'xutao_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'mengfda',resume_attachment:'mengfda_resume.doc',degree_attachment:'mengfda_degree.png',academic_attachment:'mengfda_academic.png',idcard_attachment:'mengfda_idcard.png'},
    {itcode:'wangkbb',resume_attachment:'wangkbb_resume.doc',degree_attachment:'wangkbb_degree.png',academic_attachment:'',idcard_attachment:'wangkbb_idcard.png'},
    {itcode:'wanghuiae',resume_attachment:'wanghuiae_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'xuchene',resume_attachment:'xuchene_resume.doc',degree_attachment:'xuchene_degree.png',academic_attachment:'',idcard_attachment:'xuchene_idcard.png'},
    {itcode:'zhouxcb',resume_attachment:'zhouxcb_resume.doc',degree_attachment:'zhouxcb_degree.png',academic_attachment:'',idcard_attachment:'zhouxcb_idcard.png'},
    {itcode:'zhaolif',resume_attachment:'zhaolif_resume.doc',degree_attachment:'zhaolif_degree.png',academic_attachment:'',idcard_attachment:'zhaolif_idcard.png'},
    {itcode:'chaiwc',resume_attachment:'chaiwc_resume.doc',degree_attachment:'chaiwc_degree.png',academic_attachment:'',idcard_attachment:'chaiwc_idcard.png'},
    {itcode:'hanxxd',resume_attachment:'hanxxd_resume.doc',degree_attachment:'hanxxd_degree.png',academic_attachment:'hanxxd_academic.png',idcard_attachment:'hanxxd_idcard.png'},
    {itcode:'qikf',resume_attachment:'qikf_resume.doc',degree_attachment:'qikf_degree.png',academic_attachment:'qikf_academic.png',idcard_attachment:'qikf_idcard.png'},
    {itcode:'zhangxina',resume_attachment:'zhangxina_resume.doc',degree_attachment:'zhangxina_degree.png',academic_attachment:'zhangxina_academic.png',idcard_attachment:'zhangxina_idcard.png'},
    {itcode:'tenglj',resume_attachment:'tenglj_resume.doc',degree_attachment:'tenglj_degree.png',academic_attachment:'tenglj_academic.png',idcard_attachment:'tenglj_idcard.png'},
    {itcode:'zhaoliangi',resume_attachment:'zhaoliangi_resume.doc',degree_attachment:'zhaoliangi_degree.png',academic_attachment:'zhaoliangi_academic.png',idcard_attachment:'zhaoliangi_idcard.png'},
    {itcode:'liuzlf',resume_attachment:'liuzlf_resume.doc',degree_attachment:'liuzlf_degree.png',academic_attachment:'',idcard_attachment:'liuzlf_idcard.png'},
    {itcode:'hedm',resume_attachment:'hedm_resume.doc',degree_attachment:'hedm_degree.png',academic_attachment:'hedm_academic.png',idcard_attachment:'hedm_idcard.png'},
    {itcode:'yangap',resume_attachment:'yangap_resume.doc',degree_attachment:'yangap_degree.png',academic_attachment:'yangap_academic.png',idcard_attachment:'yangap_idcard.png'},
    {itcode:'liucyj',resume_attachment:'liucyj_resume.doc',degree_attachment:'liucyj_degree.png',academic_attachment:'liucyj_academic.png',idcard_attachment:'liucyj_idcard.png'},
    {itcode:'jiazfa',resume_attachment:'jiazfa_resume.doc',degree_attachment:'jiazfa_degree.png',academic_attachment:'jiazfa_academic.png',idcard_attachment:'jiazfa_idcard.png'},
    {itcode:'lizhenu',resume_attachment:'lizhenu_resume.doc',degree_attachment:'lizhenu_degree.png',academic_attachment:'',idcard_attachment:'lizhenu_idcard.png'},
    {itcode:'lipfi',resume_attachment:'lipfi_resume.doc',degree_attachment:'lipfi_degree.png',academic_attachment:'lipfi_academic.png',idcard_attachment:'lipfi_idcard.png'},
    {itcode:'chengzs',resume_attachment:'chengzs_resume.doc',degree_attachment:'chengzs_degree.png',academic_attachment:'chengzs_academic.png',idcard_attachment:'chengzs_idcard.png'},
    {itcode:'guoxyk',resume_attachment:'',degree_attachment:'guoxyk_degree.png',academic_attachment:'',idcard_attachment:'guoxyk_idcard.png'},
    {itcode:'lvsy',resume_attachment:'lvsy_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:'lvsy_idcard.png'},
    {itcode:'zuokx',resume_attachment:'zuokx_resume.doc',degree_attachment:'zuokx_degree.png',academic_attachment:'zuokx_academic.png',idcard_attachment:'zuokx_idcard.png'},
    {itcode:'gaolid',resume_attachment:'gaolid_resume.doc',degree_attachment:'gaolid_degree.png',academic_attachment:'',idcard_attachment:'gaolid_idcard.png'},
    {itcode:'zhulg',resume_attachment:'zhulg_resume.doc',degree_attachment:'zhulg_degree.png',academic_attachment:'',idcard_attachment:'zhulg_idcard.png'},
    {itcode:'wangdian',resume_attachment:'wangdian_resume.doc',degree_attachment:'wangdian_degree.png',academic_attachment:'wangdian_academic.png',idcard_attachment:'wangdian_idcard.png'},
    {itcode:'pengxy',resume_attachment:'pengxy_resume.doc',degree_attachment:'pengxy_degree.png',academic_attachment:'',idcard_attachment:'pengxy_idcard.png'},
    {itcode:'zhaotiana',resume_attachment:'zhaotiana_resume.doc',degree_attachment:'zhaotiana_degree.png',academic_attachment:'',idcard_attachment:'zhaotiana_idcard.png'},
    {itcode:'liucdb',resume_attachment:'liucdb_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:'liucdb_idcard.png'},
    {itcode:'sunxua',resume_attachment:'sunxua_resume.doc',degree_attachment:'sunxua_degree.png',academic_attachment:'sunxua_academic.png',idcard_attachment:'sunxua_idcard.png'},
    {itcode:'liuxf',resume_attachment:'liuxf_resume.doc',degree_attachment:'liuxf_degree.png',academic_attachment:'',idcard_attachment:'liuxf_idcard.png'},
    {itcode:'chenjhf',resume_attachment:'',degree_attachment:'chenjhf_degree.png',academic_attachment:'chenjhf_academic.png',idcard_attachment:'chenjhf_idcard.png'},
    {itcode:'fanxfc',resume_attachment:'fanxfc_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:'fanxfc_idcard.png'},
    {itcode:'liaohwa',resume_attachment:'liaohwa_resume.doc',degree_attachment:'liaohwa_degree.png',academic_attachment:'liaohwa_academic.png',idcard_attachment:'liaohwa_idcard.png'},
    {itcode:'zhanghqi',resume_attachment:'',degree_attachment:'zhanghqi_degree.png',academic_attachment:'',idcard_attachment:'zhanghqi_idcard.png'},
    {itcode:'zhangydb',resume_attachment:'zhangydb_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'zhaoxjf',resume_attachment:'',degree_attachment:'zhaoxjf_degree.png',academic_attachment:'',idcard_attachment:'zhaoxjf_idcard.png'},
    {itcode:'qinyha',resume_attachment:'',degree_attachment:'qinyha_degree.png',academic_attachment:'',idcard_attachment:'qinyha_idcard.png'},
    {itcode:'wangjp',resume_attachment:'wangjp_resume.doc',degree_attachment:'wangjp_degree.png',academic_attachment:'wangjp_academic.png',idcard_attachment:'wangjp_idcard.png'},
    {itcode:'lixea',resume_attachment:'lixea_resume.doc',degree_attachment:'lixea_degree.png',academic_attachment:'lixea_academic.png',idcard_attachment:'lixea_idcard.png'},
    {itcode:'zhaoxud',resume_attachment:'zhaoxud_resume.doc',degree_attachment:'zhaoxud_degree.png',academic_attachment:'',idcard_attachment:'zhaoxud_idcard.png'},
    {itcode:'fengxdd',resume_attachment:'fengxdd_resume.doc',degree_attachment:'fengxdd_degree.png',academic_attachment:'fengxdd_academic.png',idcard_attachment:'fengxdd_idcard.png'},
    {itcode:'zhangzhengj',resume_attachment:'zhangzhengj_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''},
    {itcode:'fengduan',resume_attachment:'fengduan_resume.doc',degree_attachment:'',academic_attachment:'',idcard_attachment:''}
  ]

  file_arrary = []

  def url_patch(url)
    if url.blank?
      return ''
    else
      return File.open('tmp/pics/'+url)
    end
  end


  task :all_attachments => :environment do
    i = 0
    attachment_arrary.each do |a|
      user = User.find_by_itcode(a[:itcode])
      i = i+1
      if !user.is_updateattachment
        user.update(idcard_attachment: url_patch(a[:idcard_attachment]),degree_attachment: url_patch(a[:degree_attachment]),academic_attachment: url_patch(a[:academic_attachment]),resume_attachment: url_patch(a[:resume_attachment]))
        user.is_updateattachment = true
        user.save
      end
      puts i.to_s+' '+user.name+' attachments uploads success!'
    end
  end

  desc "seed update user info"

  user_info_arrary = [
    {itcode:"hejce",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"hujwe",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"wuyln",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"wangmhc",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"pengmha",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"zhangjianau",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"liyjs",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"handjb",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"hujn",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"cuijwa",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"liussb",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhuywd",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhangzhend",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"yangqmc",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"mengwd",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"tongkaia",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"houxhb",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"huangsheng",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"linsongb",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhancy",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"liumgb",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"hegha",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"chenydf",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhusle",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"hepengc",level:"专家",cost:3000,extra_cost:3750},
    {itcode:"wangqunb",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"liugwc",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"wangxbt",level:"高级",cost:3500,extra_cost:4375},
    {itcode:"leina",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"daiyla",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"guosqb",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"yangfj",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhaolla",level:"高级",cost:3000,extra_cost:3750},
    {itcode:"xiachuan",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"lvjiand",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"luohjc",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"wanggangac",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"gaojh",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"guojca",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"liuxw",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhangbol",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhaodqa",level:"专家",cost:3000,extra_cost:3750},
    {itcode:"liyingw",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"zouwj",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"zhengweic",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"huangxu",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"sunzqa",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"luyid",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"linsenb",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"fengzhong",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhangjra",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"niepeng",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"sunfmb",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"lishf",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"lilongl",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"huangybc",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"malq",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"dongxyb",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"aizy",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"tianxl",level:"专家",cost:3000,extra_cost:3750},
    {itcode:"yangfengg",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"hanymc",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhangquand",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"quyi",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"wuweim",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"wanghaoo",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhangjingaq",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"sutaoa",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhangwzc",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"chengxinc",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"wendan",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhanghma",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"wangyuec",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"caogs",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"songleib",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"liujyy",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"fangmeng",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhangbin",level:"专家",cost:3000,extra_cost:3750},
    {itcode:"jinliang",level:"专家",cost:3000,extra_cost:3750},
    {itcode:"xiangyub",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"guobind",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"tianmina",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"zhouxcb",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"zhangkunp",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"xiaocgc",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"wanghwo",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"maoxsa",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"menghr",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"huzfb",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"gaohq",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"hefeig",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"chenzhanc",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"mengfda",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"wangkbb",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"changdwa",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"zhaolif",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"liqingd",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"pengsf",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhangdcb",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhugyc",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"chenzwc",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"chaiwc",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"wangchaor",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"taosqb",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"caixcd",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"chenqii",level:"初级",cost:1100,extra_cost:1375},
    {itcode:"wanghuiae",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"xuzx",level:"专家",cost:3000,extra_cost:3750},
    {itcode:"liuxf",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"wangjp",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhaoliangi",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"hedm",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"yangap",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"liucyj",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"jiazfa",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"lvsy",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zuokx",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"pengxy",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"chenjhf",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"fanxfc",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhangydb",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"lixea",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhanghqi",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"liuzlf",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"lipfi",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"chengzs",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"guoxyk",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"gaolid",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhulg",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"wangdian",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhaotiana",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"liucdb",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"sunxua",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"liaohwa",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"zhaoxjf",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"qinyha",level:"中级",cost:1600,extra_cost:2000},
    {itcode:"qikf",level:"专家",cost:3000,extra_cost:3750},
    {itcode:"zhangxina",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"tenglj",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"lizhenu",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"zhaoxud",level:"高级",cost:2200,extra_cost:2750},
    {itcode:"fengxdd",level:"高级",cost:2200,extra_cost:2750}
  ]



itcode_arrary = [
  "yanges",
  "handjb",
  "cuijwa",
  "huangsheng",
  "linsongb",
  "zhancy",
  "zhuywd",
  "zhangzhend",
  "wuyln",
  "liumgb",
  "hegha",
  "mengwd",
  "zhusle",
  "zhangjianau",
  "wangqunb",
  "xiachuan",
  "wanggangac",
  "guosqb",
  "gaojh",
  "guojca",
  "yangfj",
  "linsenb",
  "niepeng",
  "malq",
  "hanymc",
  "wendan",
  "songleib",
  "zhangjingaq",
  "wangchaor",
  "pengsf",
  "tangliange",
  "xiaocgc",
  "wanghwo",
  "maoxsa",
  "menghr",
  "huzfb",
  "tianmina",
  "hefeig",
  "chenzhanc",
  "xutao",
  "mengfda",
  "wanghuiae",
  "changdwa",
  "xuchene",
  "zhouxcb",
  "zhaolif",
  "chaiwc",
  "tenglj",
  "zhaoliangi",
  "hedm",
  "liucyj",
  "lizhenu",
  "lipfi",
  "zhaotiana",
  "wangjp",
  "zhangzhengj",
  "fengduan"
  ]


  task :user_cost => :environment do
    i = 0
    user_info_arrary.each do |u|
      if user = User.find_by_itcode(u[:itcode])
        i = i+1
        user.update(u)
        puts i.to_s+' '+user.name+' info uploads success!'
      end
    end

    # cost 为nil 的设置为0
    User.find_each do |u|
      if u.cost.blank?
        u.cost = 0
        u.save
      end
      if u.extra_cost.blank?
        u.extra_cost = 0
        u.save
      end
      
      puts u.name + ' update success!'
    end
  end


  # 设置是否要求提交
  task :user_setcommit => :environment do
    itcode_arrary.each do |i|
      u = User.find_by_itcode(i)
      puts(u.name)
      u.is_feedneeded = true
      u.save
    end
  end



end
