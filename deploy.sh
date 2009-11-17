#!/bin/sh
sudo apt-get install libmagick9-dev

sudo gem install desert rmagick hpricot htmlentities haml calendar_date_select icalendar aws-s3 rmagick --no-ri --no-rdoc

cd /var/rails/sistasatlanta

rake db:migrate

touch tmp/restart.txt