class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

    def full_name
        self.first_name + " " + self.last_name
    end

    def list_roles
        concat_roles(self.characters)
    end


    def concat_roles(array)
        array.map do |char|
            "#{char.name} - #{char.show.name}"
        end
    end




end