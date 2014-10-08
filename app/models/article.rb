class Article < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  validates :title, :sub_title, presence: true

  
  
  
  
  def self.search(search_string)
   if search_string
    where('title or sub_title like ?', "%#{search_string}%")
   else
    scoped
   end
  end
  
  
  
end
