namespace :rubocop do
  desc "Copy rubocop presets into project"
  task presets: :environment do
    pp "COPYING PRESETS-----"

    source = File.join(Gem.loaded_specs["rubocop-presets"].full_gem_path, "config", "*.yml")
    target = Rails.root.join("config", "rubocop")
    FileUtils.makedir_p(target)
    FileUtils.cp_r(Dir.glob(source), target)
  end
end
