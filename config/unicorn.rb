
# Minimal sample configuration file for Unicorn (not Rack) when used
# with daemonization (unicorn -D) started in your working directory.
#
# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.
# See also http://unicorn.bogomips.org/examples/unicorn.conf.rb for
# a more verbose configuration using more features.

listen 20000 # by default Unicorn listens on port 8080
worker_processes 3 # this should be >= nr_cpus
#pid "/var/www/redmine/log/unicorn.pid"
pid "/tmp/newton_unicorn.pid"
#stderr_path "/var/www/redmine/log/unicorn.log"
stderr_path "log/unicorn.log"
#stdout_path "/var/www/redmine/log/unicorn.log"
stdout_path "log/unicorn.log"

#path "/App/GameExrc/Trump/Poker/ver3/"

#
# 使い方
#
# 起動
# bundle exec unicorn_rails -c config/unicorn.conf -E production -D
# bundle exec unicorn_rails -c config/unicorn.conf -E production -D --path /App/GameExrc/Trump/Poker/ver3/

# プロセス特定
# sudo pgrep -f 'unicorn_rails master'
#
# graceful shutdown: 処理中のすべてのリクエストの処理が終わってからシャットダウン
# 000はプロセスIDとする
# sudo kill -QUIT 000
#
# quick shutdown: 処理中のリクエストすべてを中断し、シャットダウン
# sudo kill -INT 000
