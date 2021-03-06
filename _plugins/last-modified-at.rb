#
# This custom plugin dynamically sets the 'last_modified_at' parameter for each page.
# The parameter contains date and time of last commit that changed the corresponding file.
# For available date formats, refer to https://git-scm.com/docs/git-log#git-log---dateltformatgt
#
Jekyll::Hooks.register :pages, :post_init do |page|
  page.data['last_modified_at'] =
    `git log -1 --format=%cd --date=iso -- #{page.path}`.strip
end
