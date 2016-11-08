require 'colored'
require 'cocoapods'

module CocoapodsAcknowledgementsFilter
  @@filter = Proc.new { |name| 
    true
  }

  def self.exclude
    @@exclude
  end

  def self.filter
    @@filter
  end

  Pod::HooksManager.register('cocoapods-acknowledgements-filter', :pre_install) do |context, user_options|
    @@exclude = user_options["exclude"]
    filter = user_options["filter"]
    @@filter = filter unless filter.nil?
  end
end

module Pod
  module Generator
    class Acknowledgements

      alias_method :specs_before, :specs

      # @return [Array<Specification>] The root specifications for which the
      #         acknowledgements should be generated.
      #
      def specs
        file_accessors.map { |accessor| accessor.spec.root }.uniq
                      .select { |spec| not CocoapodsAcknowledgementsFilter::exclude.include? spec.name } 
                      .select { |spec| CocoapodsAcknowledgementsFilter::filter.call(spec.name) }
      end
    
    end
  end
end
