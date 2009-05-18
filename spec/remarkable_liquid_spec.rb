require File.join(File.dirname(__FILE__), "spec_helper.rb")

require 'liquid'

create_table "companies" do end

class Company < ActiveRecord::Base
end

class Company::LiquidDropClass < Liquid::Drop
  def initialize(object)
  end
  
  def name
  end
  
  def slogan
  end
end

describe Remarkable::Liquid do
  describe "have_liquid_methods" do
    it "should validate that a model has liquid methods" do
      have_liquid_methods(:name, :slogan).matches?(Company.new).should be_true
    end
    
    it "should validate that a model doens't has a name" do
      have_liquid_methods(:year).matches?(Company.new).should be_false
    end
  end
end
