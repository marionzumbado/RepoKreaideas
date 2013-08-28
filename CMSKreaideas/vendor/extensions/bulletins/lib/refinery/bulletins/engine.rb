module Refinery
  module Bulletins
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Bulletins

      engine_name :refinery_bulletins

      initializer "register refinerycms_bulletins plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "bulletins"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.bulletins_admin_bulletins_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/bulletins/bulletin'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Bulletins)
      end
    end
  end
end
