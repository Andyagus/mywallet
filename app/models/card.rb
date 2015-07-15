class Card < ActiveRecord::Base
   has_many :users, dependent: :destroy, through: :userswallets
   has_many :userswallets

   validates_presence_of :number
   validates_format_of :number, with: /\A[345]\d{11,}/

   validates :exp_month, presence: true, inclusion: { in: (1..12) }
   validates :exp_year, presence: true, numericality: { greater_than_or_equal_to: 2015 }

   before_save :set_card_type

     def set_card_type
         first_num = self.number[0]
         self.card_type = case first_num
         when '3'
           "Amex"
         when '4' 
           "Visa"
         when '5'
           "MasterCard"
         end
     end

end
