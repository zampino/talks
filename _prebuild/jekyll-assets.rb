require 'haml_coffee_assets'
Sprockets.append_path File.dirname(HamlCoffeeAssets.helpers_path)
Sprockets.append_path File.expand_path('../_assets/bower_components', __dir__)
Sprockets.append_path File.expand_path('../_assets/slides', __dir__)
