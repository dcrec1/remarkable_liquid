require 'liquid'

create_table "companies" do end
create_table "people" do end

class Company < ActiveRecord::Base
end

class Company::LiquidDropClass < Liquid::Drop
  def name
  end
  
  def slogan
  end
end

class Person < ActiveRecord::Base
end

class Person::LiquidDropClass < Liquid::Drop
  def id
  end
end
