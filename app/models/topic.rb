class Topic < ActiveRecord::Base
  belongs_to :publisher, class_name: 'User'

  belongs_to :category
  
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

end
