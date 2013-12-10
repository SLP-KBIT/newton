#!/bin/bash
echo -e "\n\e[34;1m-- rubocop --\e[m"
bundle exec rubocop app/ spec/controllers
echo -e "\n\e[34;1m-- rspec --\e[m"
bundle exec rake spec
