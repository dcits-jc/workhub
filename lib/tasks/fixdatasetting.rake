namespace :fixdatasetting do
	desc "fix data setting"

	# 将所有项目号从12位缩短为10位
  task :short_code => :environment do
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
