require_relative 'view/screen_view'
require_relative 'view/presenter'
require_relative 'composition_root'

presenter = Presenter.new(ScreenView.new, CompositionRoot.configure_dependencies)

presenter.run
