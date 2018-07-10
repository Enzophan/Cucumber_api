#Run Test Case

node node_modules/cucumber/bin/cucumber.js features/test.feature

#Export to report
node node_modules/cucumber/bin/cucumber.js features/booking_create_by_api.feature -f json:test/report/cucumber_report.json

node node_modules/cucumber/bin/cucumber.js features/booking_create_traveler_by_api.feature -f json:test/report/cucumber_report.json

node node_modules/cucumber/bin/cucumber.js features/booking_create_traveler_by_api.feature -f summary -f json:test/report/cucumber_report.json

# Cancel books

node node_modules/cucumber/bin/cucumber.js features/work_clear_data.feature

# Report HTML

@ node index.js

# Cucumber_api
