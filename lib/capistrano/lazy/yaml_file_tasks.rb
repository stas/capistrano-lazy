require 'capistrano/lazy/yaml_files'

include ::Capistrano::DSL::YamlFiles

load File.expand_path('../tasks/database_yml.rake', __FILE__)
