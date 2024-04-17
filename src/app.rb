require_relative 'view/screen_view'
require_relative 'view/presenter'
require_relative 'composition_root'

presenter = Presenter.new(ScreenView.new, CompositionRoot.configure_dependencies)
presenter.welcome_message

while true
  presenter.get_all_users
  presenter.create_user
end
