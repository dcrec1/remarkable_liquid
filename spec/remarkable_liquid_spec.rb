require File.join(File.dirname(__FILE__), "spec_helper.rb")

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

describe Remarkable::Liquid do
  describe "have_liquid_methods" do
    before :each do
      @model = Company.new
    end
  
    it "should validate that a model has liquid methods" do
      have_liquid_methods(:name, :slogan).matches?(@model).should be_true
    end
    
    it "should validate that a model doens't has a liquid method" do
      have_liquid_methods(:year).matches?(@model).should be_false
    end
    
    it "should look for id as a liquid method" do
      have_liquid_methods(:id).matches?(Person.new).should be_true
    end
    
    it "should know inherited id method is not a liquid method" do
      have_liquid_methods(:id).matches?(@model).should be_false
    end
  end
end
