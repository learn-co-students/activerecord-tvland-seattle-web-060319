class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + " " + self.last_name
  end

  def list_roles
    # strings in the form "#{character_name} - #{show_name}"
    self.characters.map do |char|
      "#{char.name} - #{char.show.name}" 
    end
  end
end