module Remarkable
  module Liquid
    module Matchers
      class HaveLiquidMethodsMatcher < Remarkable::ActiveRecord::Base
        arguments :names
        
        assertion :has_liquid_method?
        
        def has_liquid_method?
          begin
            drop = eval("#{@subject.class}::LiquidDropClass.new(Object.new)")
            @names.each do |name|
              return false unless drop.respond_to? name
            end
          rescue
            false
          end
        end
      end

      def have_liquid_methods(*attributes)
        HaveLiquidMethodsMatcher.new(attributes).spec(self)
      end

    end
  end
end
