namespace :importattachment do

  desc "seed update user attachment"

  # 文件上传列表
  attachment_arrary = [
    {itcode: 'aizy',idcard_attachment: 'tmp/pics/aizy_idcard.png',degree_attachment: ''},
    {itcode: 'caixcd',idcard_attachment: 'tmp/pics/caixcd_idcard.png',degree_attachment: ''}
  ]

  task :idcard => :environment do
    attachment_arrary.each do |a|
      user = User.find_by_itcode(a[:itcode])
      user.update(idcard_attachment: File.open(a[:idcard_attachment]))
      puts a[:idcard_attachment]+' uploads success!'
    end
  end

end
