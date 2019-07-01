# Smart Pension Ruby Test

## Instructions:

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)

> e.g.: ./parser.rb webserver.log


b. Returns the following:
List of webpages with most page views ordered from most pages views to less page views

e.g.:

> /home 90 visits

> /index 80 visits

> etc...

List of webpages with most unique page views also ordered

e.g.:

> /about/2 8 unique views

> /index 5 unique views

> etc...

## How I've solved this challenge:

As per the given instructions and after inspecting the file webserver.log I've decided to create two files, ./smart_pension_app/lib/log_analyzer.rb and ./smart_pension_app/logs_report.rb. In the first one (log_analyzer.rb), is where the logic behind the app lives, the class LogAnalyzer manages the creation of an object called 'parser' everytime the logs_report.rb file is launched.

Once it's running, logs_report.rb calls the methods needed to achieve the challenge's goals. First parsing the logs data and then the rest of them.

Finally the results are given to the user as a interated list of strings.

This challenge has been built using Test-Driven Development (TDD) with RSpec.
