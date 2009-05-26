def strainer
  Liquid::Strainer
end

module Remarkable
  module Liquid
    module Matchers
      class HaveLiquidMethodsMatcher < Remarkable::ActiveRecord::Base
        arguments :names
        
        assertion :has_liquid_method?
        
        def has_liquid_method?
          begin
            methods = eval("#{@subject.class}::LiquidDropClass").instance_methods(false)
            @names.each do |name|
              return false unless methods.include? name.to_s
            end
          rescue
            false
          end
        end
      end

      def have_liquid_methods(*attributes)
        HaveLiquidMethodsMatcher.new(attributes).spec(self)
      end
      
      class BeALiquidFilterMatcher < Remarkable::ActiveRecord::Base      
        assertion :liquid_filter?
        
        def liquid_filter?
          !strainer.filters["#{@subject.to_s}"].nil?
        end
      end

      def be_a_liquid_filter
        BeALiquidFilterMatcher.new.spec(self)
      end
    end
  end
end

Liquid::Strainer.class_eval "def self.filters; return @@filters; end"
