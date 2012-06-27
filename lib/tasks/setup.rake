namespace :travel do

  task :copy_db_yaml do
    `cp config/database.yml.template config/database.yml`
  end

  task :setup_from_scratch => [:"copy_db_yaml", :"db:drop:all", :"db:create:all",
    :"db:migrate", :"db:seed"]

end
