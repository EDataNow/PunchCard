#!/bin/bash

function reset{
	echo Starting db reset for rails...
	echo Purging the database...
	rake db:purge
	echo Purge complete! Migrating...
	rake db:migrate
	echo Migrate complete! Seeding...
	rake db:seed
	echo Seed complete! Starting rails server...
}

function serverStart{
	rails s
}

reset
serverStart