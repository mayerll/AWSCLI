#! /bin/bash

echo "List all the tables of Dynamodb"

aws dynamodb list-tables

echo "Let us choose table my-table-better-troll"
table_name='my-table-better-troll'

echo "Put items into the table"
aws dynamodb put-item --table-name $table_name --item '{"Artist": {"S": "No One You Know"}, "SongTitle": {"S": "Call Me Today"}, "AlbumTitle": {"S": "Somewhat Famous"}}' --return-consumed-capacity TOTAL

aws dynamodb put-item --table-name $table_name --item '{"Artist": {"S": "Acme Band"}, "SongTitle": {"S": "Happy Day"}, "AlbumTitle": {"S": "Songs About Life"} }' --return-consumed-capacity TOTAL

echo "Get items from the table"
aws dynamodb scan --table-name $table_name
