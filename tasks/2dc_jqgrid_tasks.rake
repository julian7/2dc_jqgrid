namespace :jqgrid do

	desc "Copy javascripts, stylesheets and pictures to public"
	task :install do
	  Rake::Task[ "jqgrid:uninstall" ].execute
    %w(javascripts stylesheets pictures).each do |dir|
      source = File.expand_path(File.join(File.dirname(__FILE__), '..', 'public', dir))
      target = File.join(RAILS_ROOT, 'public', dir, 'jqgrid')
      FileUtils.cp_r(source, target, :verbose => true)
    end
	end

  desc 'Remove javascripts, stylesheets and pictures from public'
  task :uninstall do
    %w(javascripts stylesheets pictures).each do |dir|
      target = File.join(RAILS_ROOT, 'public', dir, 'jqgrid')
      FileUtils.rm_rf(target, :verbose => true)
    end
  end
  
end
