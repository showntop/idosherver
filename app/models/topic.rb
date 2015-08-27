class Topic < ActiveRecord::Base
  belongs_to :user, class_name: 'User'

  belongs_to :category

  before_save :update_profile
  
  def self.create_with_attachments! params
    ActiveRecord::Base.transaction do
      #
      Topic.create!(title: params[:title], raw_content: params[:raw_content])
      TopicAttachment.create!(params[:attachments])
      params
    end
  end
  
  def self.top n
    
  end

  private
  def update_profile
  #   cooked_doc = Nokogiri::HTML(self.cooked)
  #   nodes = cooked_doc.xpath('//p')
  #   Rails.logger.info nodes
  #   self.profile = nodes[0,[cooked_doc.length, 5].min].to_s
    self.profile = self.cooked#.slice(0, 255)
  end

end
