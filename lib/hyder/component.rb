module Hyder
  class Component
    def initialize(context, *args)
      @context = context
      @args = args
    end

    def render
      ERB.new(template).result(binding)
    end

    private

    def template
      raise NotImplementedError, "Define a template method in your component."
    end
  end
end
