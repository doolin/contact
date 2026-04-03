# frozen_string_literal: true

SimpleCov.start 'rails' do
  enable_coverage :branch

  # Scope C: active runtime paths in app code only.
  track_files 'app/{controllers,mailers,models}/**/*.rb'
  add_filter '/app/controllers/admins_controller.rb'
  add_filter '/app/controllers/registrations_controller.rb'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Mailers', 'app/mailers'

  minimum_coverage line: 100, branch: 100
  minimum_coverage_by_file line: 100, branch: 100
end
