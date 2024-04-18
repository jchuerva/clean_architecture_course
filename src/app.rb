require_relative 'view/screen_view'
require_relative 'view/presenter'
require_relative 'composition_root'
require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('--data. It can be in_memory or in_file') { |o| options[:data] = o }
end.parse!

db_type = options[:data] || 'in_memory'

dependencies = CompositionRoot.configure_dependencies(db_type)
presenter = Presenter.new(ScreenView.new, dependencies)

presenter.run
