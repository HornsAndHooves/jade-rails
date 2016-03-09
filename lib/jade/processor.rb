module Jade
  class Processor

    def self.instance
      @instance ||= new
    end

    def self.call(input)
      instance.call(input)
    end

    def call(input)
      namespace = 'this.JST'
      template = Jade::Renderer.compile(input[:data])

      <<-JS.strip_heredoc
        (function() {
          #{namespace} || (#{namespace} = {});
          #{namespace}[#{input[:name].inspect}] = #{template};
        }).call(this);
      JS
    end
  end
end