desc 'This rebuilds development db'
task :nuke => ["db:drop", "db:create", "db:migrate"]