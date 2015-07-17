class User < ActiveRecord::Base
   validates_presence_of :fname, :lname, :email
   validates_uniqueness_of :email
   validates_format_of :phone, with: /\d{3}-\d{3}-\d{4}/

   validates_numericality_of :balance, { greater_than: 0}
   validates :password, { confirmation: true }


   has_many :userswallets
   has_many :cards, through: :userswallets

   def full_name
      fname + ' ' + lname
   end

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"},
   :default_url => "/images/:style/missing.png"
   validates_attachment_content_type :avatar,
   :content_type => /\Aimage\/.*\Z/

end
