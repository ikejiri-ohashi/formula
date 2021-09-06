lock '3.16.0'

set :application, 'formula'

set :repo_url,  'git@github.com:ikejiri-ohashi/formula.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ['publickey'],
                                  keys: ['~/.ssh/ikejirinabekey.pem'] 

# secret_base_keyを読み込ませるため追記
set :linked_files, %w[config/master.key]

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end