namespace :rbenv do
  task :setup do
    on roles(fetch(:rbenv_roles)) do
      execute :git, 'clone', fetch(:rbenv_git_url), fetch(:rbenv_path)
      execute :git, 'clone', fetch(:ruby_build_git_url), fetch(:ruby_build_path)
    end
  end

  task :update do
    on roles(fetch(:rbenv_roles)) do
      [fetch(:rbenv_path), fetch(:ruby_build_path)].each do |update_path|
        within update_path do
          execute :git, 'pull'
        end
      end
    end
  end

  task :install, [:new_ruby] do |task, args|
    on roles(fetch(:rbenv_roles)) do
      execute :rbenv, 'install', args[:new_ruby] || fetch(:rbenv_ruby)
      execute :rbenv, 'local', args[:new_ruby] || fetch(:rbenv_ruby)
      execute :rbenv, 'rehash'
      execute :rbenv, 'exec', 'gem install bundler' if fetch(:bundle_roles)
      execute :rbenv, 'rehash'
    end
  end
end

namespace :load do
  task :defaults do
    set :ruby_build_path, -> { '%s/plugins/ruby-build' % fetch(:rbenv_path) }
    set :rbenv_git_url, 'git://github.com/sstephenson/rbenv.git'
    set :ruby_build_git_url, 'git://github.com/sstephenson/ruby-build.git'
  end
end

Capistrano::DSL.stages.each do |stage|
  current_tasks = Rake.application.top_level_tasks.join(' ')
  if current_tasks.match(/rbenv.(setup|install|update)/)
    Rake::Task['rbenv:validate'].clear
  end
end
