application = 'newton'
app_path = "/var/released_app/dev/#{application}"

listen 55001 # by default Unicorn listens on port 8080
worker_processes 3 # this should be >= nr_cpus
#pid "/var/www/redmine/log/unicorn.pid"
pid "#{app_path}/shared/tmp/pids/unicorn.pid"
stderr_path "#{app_path}/shared/log/unicorn.stderr.log"
stdout_path "#{app_path}/shared/log/unicorn.stdout.log"

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
