Gem::Specification.new do |s|
  s.name = %q{statwhore}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Nunemaker"]
  s.date = %q{2008-07-30}
  s.description = %q{for the stat addict in us all}
  s.email = ["nunemaker@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "examples/account.rb", "examples/profile.rb", "examples/profiles.rb", "lib/statwhore.rb", "lib/statwhore/connection.rb", "lib/statwhore/google.rb", "lib/statwhore/google/analytics.rb", "lib/statwhore/google/analytics/account.rb", "lib/statwhore/google/analytics/profile.rb", "lib/statwhore/google/feedburner.rb", "lib/statwhore/version.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "spec/fixtures/analytics_account_find_all.html", "spec/fixtures/analytics_profile_find_all.html", "spec/fixtures/dashboard_report_webgroup.xml", "spec/spec.opts", "spec/spec_helper.rb", "spec/statwhore_google_analytics_account_spec.rb", "spec/statwhore_google_analytics_profile_spec.rb", "spec/statwhore_google_analytics_spec.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://statwhore.rubyforge.org}
  s.post_install_message = %q{}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{statwhore}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{for the stat addict in us all}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<googlebase>, [">= 0.2.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0.2"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0.6"])
    else
      s.add_dependency(%q<googlebase>, [">= 0.2.0"])
      s.add_dependency(%q<activesupport>, [">= 2.0.2"])
      s.add_dependency(%q<hpricot>, [">= 0.6"])
    end
  else
    s.add_dependency(%q<googlebase>, [">= 0.2.0"])
    s.add_dependency(%q<activesupport>, [">= 2.0.2"])
    s.add_dependency(%q<hpricot>, [">= 0.6"])
  end
end