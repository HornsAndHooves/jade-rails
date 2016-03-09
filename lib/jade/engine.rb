module Jade
  class Engine < ::Rails::Engine
    initializer 'jade.assets.register', group: :all do |app|
      config.assets.configure do |env|
        env.register_mime_type 'text/x-jade-template', extensions: ['.jade']
        env.register_transformer 'text/x-jade-template', 'application/javascript', Jade::Processor
      end
    end
  end
end
