class Weibo < ActiveRecord::Base


  def self.html2image
    id   = Random.rand(20)
    file = Tempfile.new(["template_#{id}", '.jpg'], 'tmp', :encoding => 'ascii-8bit')
    #不加html标准标签中文会乱码
    #因为textarea中的换行是\n 需要替换成br标签
    # weibo = Faraday.get("http://localhost:3002/weibos/1").body.force_encoding('utf-8')
    # p weibo.encoding
    weibo = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>img {  max-width: 800px;  }</style></head><body><div>你好</div><div class='feature'><div class='school_name'> 则是</div><div class='class_name'>班级</div><div>成功</div><br/><div><div>老师</div><div><img class='qrcode' src='http://b.hiphotos.baidu.com/zhidao/pic/item/b21bb051f8198618d755f33848ed2e738bd4e678.jpg'></div></div><div><div>文字</div><img src='http://img.redocn.com/201010/3/827367_12860700111Fz1.jpg'></div></div></body></html> "
    file.write(IMGKit.new(weibo, quality: 200).to_jpg)
    file.flush
    file.path
  end
end