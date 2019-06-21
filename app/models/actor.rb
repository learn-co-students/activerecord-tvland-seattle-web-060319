class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + " " + self.last_name
  end

  def list_roles
    my_characters = Character.where(actor_id: self.id)
    roles = []
    my_characters.each do |ch|
        roles << "#{ch.name} - #{Show.where(id: ch.show_id).first.name}"
    end
    roles
  end
end