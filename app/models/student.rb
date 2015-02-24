require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

validates :email, :uniqueness => true, :on => :create
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
validates :age, :numericality => { :greater_than => 5 }
validates :phone, :format => { :with => /.+\d{3}.+\d{3}.+\d{4}.+/ }

  def name
     name = "#{self[:first_name]} #{self[:last_name]}"
  end

  def age
    now = Time.now.utc.to_date
    now.year - self[:birthday].year - ((now.month >self[:birthday].month || (now.month == self[:birthday].month && now.day >= self[:birthday].day)) ? 0 : 1)
  end


end

