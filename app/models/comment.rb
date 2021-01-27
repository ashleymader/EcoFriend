class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :brand 

    validates :review, presence: true
    # validates :brand, uniqueness: { scope: :user, message: "brand has already been reviewed by you" } #not a customized validation (DIDN'T WORK)

    # validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
    


    def name_category_info
        "#{name}"
    end 

    # def not_a_duplicate # custom validation
    #     if Brand.find_by(name: name)
    #       errors.add(:name, 'can not be a duplicate')
    #     end
    # end 

end
