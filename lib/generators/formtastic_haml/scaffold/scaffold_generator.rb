require 'generators/formtastic_haml'
require 'generators/erb/scaffold/scaffold_generator'

module FormtasticHaml
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      extend TemplatePath

      def copy_layout_file
        return unless options[:layout]
        template "layout.haml.erb",
                 File.join("app/views/layouts", controller_class_path, "#{controller_file_name}.html.haml")
      end

      protected

        def copy_view(view)
          template "#{view}.haml.erb", File.join("app/views", controller_file_path, "#{view}.html.haml")
        end

    end
  end
end