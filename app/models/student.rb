require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, :uniqueness => true, :format => { :with => /\w*@\w{1,}\.\w{2,}/ }
  validates :age, :numericality => { :greater_than_or_equal_to => 5}
  validates :phone, :format => { :with => /.{10,}/ }

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def name
    "#{first_name} #{last_name}"
  end


end
