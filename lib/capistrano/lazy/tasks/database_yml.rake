remote_file 'config/database.yml' => './config/database.yml', :roles => :db
file './config/database.yml' do |f|
  yaml_file(f.name)
end
