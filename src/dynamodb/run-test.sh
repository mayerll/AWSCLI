#! /bin/bash

echo "List all the tables of Dynamodb"
aws dynamodb list-tables

echo "Let us choose a new table for testing"
table_name='new-table-for-test'
aws dynamodb create-table \
    --table-name $table_name \
    --attribute-definitions \
        AttributeName=Artist,AttributeType=S \
        AttributeName=SongTitle,AttributeType=S \
    --key-schema \
        AttributeName=Artist,KeyType=HASH \
        AttributeName=SongTitle,KeyType=RANGE \
    --provisioned-throughput \
        ReadCapacityUnits=10,WriteCapacityUnits=5 \
    --table-class STANDARD

echo "Put items into the table"
aws dynamodb put-item --table-name $table_name --item '{"Artist": {"S": "No One You Know"}, "SongTitle": {"S": "Call Me Today"}, "AlbumTitle": {"S": "Somewhat Famous"}}' --return-consumed-capacity TOTAL

aws dynamodb put-item --table-name $table_name --item '{"Artist": {"S": "Acme Band"}, "SongTitle": {"S": "Happy Day"}, "AlbumTitle": {"S": "Songs About Life"} }' --return-consumed-capacity TOTAL

echo "Get items from the table"
aws dynamodb scan --table-name $table_name
