namespace :import_unofficialuser do
  desc "import un_official unit"
  # 将所有项目号从12位缩短为10位

    task :init_unofficialunit => :environment do

    team_arrary = [
      {name: "大客户Bu(托管).大客户中央区事业部(东诚)",team_type: "none_tech"},
      {name: "第一政企Bu(托管).互联网东区事业部(人事人)",team_type: "none_tech"},
      {name: "第一政企Bu(托管).华东集成应用事业部(人事人)",team_type: "none_tech"},
      {name: "第二政企Bu(托管).电力华东业务部(人事人)",team_type: "none_tech"},
      {name: "大客户Bu(托管).大客户中南区事业部(东诚)",team_type: "none_tech"},
      {name: "大客户Bu(托管).大客户华南区事业部(东诚)",team_type: "none_tech"},
      {name: "第二金融Bu(托管).金融业务拓展事业一部(人事人)",team_type: "none_tech"},
      {name: "第二政企Bu(托管).电力南区事业部(人事人)",team_type: "none_tech"},
      {name: "第二政企Bu(托管).政企事业四部(DGT)",team_type: "none_tech"},
      {name: "第二政企Bu(托管).电力北区业务二部(人事人)",team_type: "none_tech"},
      {name: "第一金融Bu(托管).金融北区业务一部(DGT)",team_type: "none_tech"},
      {name: "第二政企Bu(托管).电力北区业务二部(DGT)",team_type: "none_tech"},
      {name: "第一金融Bu(托管).金融华东事业部(DGT)",team_type: "none_tech"},
      {name: "第二政企Bu(托管)-电力北区技术二部(人事人)",team_type: "none_tech"},
      {name: "第二金融Bu(托管).金融业务拓展事业一部(DGT)",team_type: "none_tech"},
      {name: "大客户Bu(托管).大客户北方区事业部(DGT)",team_type: "none_tech"},
      {name: "大客户Bu(托管).大客户新业务事业部(DGT)",team_type: "none_tech"},
      {name: "第二金融Bu(托管).金融核心客户事业部(DGT)",team_type: "none_tech"},
      {name: "第二金融Bu(托管).第二金融BU综合管理部(DGT)",team_type: "none_tech"}
    ]

    admin_user = User.find_by(itcode: 'liangchaob')

    # 建立团队
    team_arrary.each do |t|
      s =Team.create(t)
      s.create_binding_managementprojects!(admin_user)
      puts t[:name] + " binding project created!!"
    end

  end





  desc "import un_official user"
  task :init_unofficialuser => :environment do

    user_arrary = [
      {code: "00000712",name: "王爱平",itcode: "wangap",team_name: "运营商Bu.新业务事业部",area_name: "北京",status: "在岗",worktype: "营销",cost_center: "313J0002",title: "客户经理",email: "wangap@dcits.com",password: "000000",password_resetting:true,is_admin:false},
      {code: "00001487",name: "何晓刚",itcode: "hexg",team_name: "经营管理部.总经理室",area_name: "北京",status: "在岗",worktype: "管理",cost_center: "31790001",title: "SBU副总裁",email: "hexg@dcits.com",password: "000000",password_resetting:true,is_admin:false},
      {code: "00001529",name: "陆燕",itcode: "luyan",team_name: "经营管理部.总经理室",area_name: "北京",status: "在岗",worktype: "管理",cost_center: "31790001",title: "SBU战略合作总监",email: "luyan@dcits.com",password: "000000",password_resetting:true,is_admin:false},
      {code: "00002403",name: "吕萍",itcode: "lvping",team_name: "经营管理部.经营管理部",area_name: "北京",status: "在岗",worktype: "管理",cost_center: "31790004",title: "部门副总经理",email: "lvping@dcits.com",password: "000000",password_resetting:true,is_admin:false},
    ]

    # 遍历所有项目
    Project.find_each do |p|
      # 如果项目号存在
      if p.code.present?
        p.code = p.code[0..9]
        puts p.code
        p.save
      end
    end

  end






end
