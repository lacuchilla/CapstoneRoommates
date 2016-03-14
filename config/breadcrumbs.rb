crumb :root do
  link "Home", root_path
end


crumb :households do
  link "All households", households_path
end

crumb :household do |household|
  link household.name, household
  parent :root
end

crumb :edit_household do |household|
  link "Edit #{household.name}", name
  parent :household, household
end

crumb :bills do
  link "All Bills for Household", household_bills_path
  parent :household, household
end

crumb :bill do |bill|
  link bill.name, bill
  parent :household
end

crumb :edit_bill do |bill|
  link "Edit #{bill.name}", name
  parent :bill, bill
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
