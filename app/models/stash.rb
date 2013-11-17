class Stash < ActiveRecord::Base
	belongs_to :user
	has_many :posts, dependent: :destroy

    validates :name,  presence: true

    def self.search(search)
  if search
    find(:all, :conditions => ['LOWER(name) LIKE ?', "%#{search}%".downcase])
  else
    find(:all)
  end
end
end
